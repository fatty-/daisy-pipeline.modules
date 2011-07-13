<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" xmlns:opf="http://www.idpf.org/2007/opf"
    xmlns:px="http://www.daisy.org/ns/pipeline/xproc" xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:pxi="http://www.daisy.org/ns/pipeline/xproc/internal"
    xmlns:xd="http://www.daisy.org/ns/pipeline/doc" type="pxi:daisy202-to-epub3-package"
    name="package" exclude-inline-prefixes="#all" version="1.0">

    <p:documentation xd:target="parent">
        <xd:short>Compile and store the OPF.</xd:short>
        <xd:author>
            <xd:name>Jostein Austvik Jacobsen</xd:name>
            <xd:mailto>josteinaj@gmail.com</xd:mailto>
            <xd:organization>NLB</xd:organization>
        </xd:author>
        <xd:maintainer>Jostein Austvik Jacobsen</xd:maintainer>
        <xd:input port="opf-metadata">Metadata in OPF-format.</xd:input>
        <xd:input port="opf-manifest">Manifest in OPF-format.</xd:input>
        <xd:input port="opf-spine">Spine in OPF-format.</xd:input>
        <xd:output port="store-complete">Pipe connection for 'p:store'-dependencies.</xd:output>
        <xd:option name="publication-dir">URI to the directory where all the EPUB 3 content should be
            stored.</xd:option>
    </p:documentation>

    <p:input port="ncc" primary="false"/>
    <p:input port="manifest" primary="false" sequence="true"/>

    <p:output port="opf-package" primary="false">
        <p:pipe port="result" step="opf-package"/>
    </p:output>
    <p:output port="fileset" primary="false">
        <p:pipe port="result" step="result-fileset"/>
    </p:output>
    <p:output port="store-complete" primary="false">
        <p:pipe port="result" step="store"/>
    </p:output>

    <p:option name="publication-dir" required="true"/>
    <p:option name="epub-dir" required="true"/>
    <p:option name="pub-id" required="true"/>

    <p:import href="http://www.daisy.org/pipeline/modules/fileset-utils/xproc/fileset-library.xpl"/>

    <p:documentation>Compile OPF metadata.</p:documentation>
    <p:xslt name="opf-metadata">
        <p:with-param name="pub-id" select="$pub-id"/>
        <p:input port="source">
            <p:pipe port="ncc" step="package"/>
        </p:input>
        <p:input port="stylesheet">
            <p:document href="ncc-metadata-to-opf-metadata.xsl"/>
        </p:input>
    </p:xslt>
    <p:sink/>

    <p:documentation>Compile OPF manifest.</p:documentation>
    <p:group name="opf-manifest">
        <p:output port="result" primary="true"/>
        <p:output port="fileset">
            <p:pipe port="result" step="opf-manifest.fileset"/>
        </p:output>

        <px:fileset-join name="input-manifest">
            <p:input port="source">
                <p:pipe port="manifest" step="package"/>
            </p:input>
        </px:fileset-join>
        <p:sink/>

        <px:fileset-create>
            <p:with-option name="base" select="$publication-dir"/>
        </px:fileset-create>
        <px:fileset-add-entry name="opf-manifest.navigation-manifest">
            <p:with-option name="href" select="concat($publication-dir,'navigation.xhtml')"/>
            <p:with-option name="media-type" select="'application/xhtml+xml'"/>
        </px:fileset-add-entry>
        <p:sink/>

        <px:fileset-join name="opf-manifest.fileset">
            <p:input port="source">
                <p:pipe port="manifest" step="package"/>
                <p:pipe port="result" step="opf-manifest.navigation-manifest"/>
            </p:input>
        </px:fileset-join>
        <p:xslt name="opf-manifest.result">
            <p:input port="parameters">
                <p:empty/>
            </p:input>
            <p:input port="stylesheet">
                <p:document
                    href="http://www.daisy.org/pipeline/modules/epub3-pub-utils/xslt/fileset-to-manifest.xsl"
                />
            </p:input>
        </p:xslt>
    </p:group>

    <p:documentation>Compile OPF spine.</p:documentation>
    <p:xslt name="opf-spine">
        <p:input port="parameters">
            <p:empty/>
        </p:input>
        <p:input port="stylesheet">
            <p:document
                href="http://www.daisy.org/pipeline/modules/epub3-pub-utils/xslt/manifest-to-spine.xsl"
            />
        </p:input>
    </p:xslt>
    <p:sink/>

    <p:identity>
        <p:documentation>Construct the outer &lt;opf:package ...&gt;-element.</p:documentation>
        <p:input port="source">
            <p:inline><![CDATA[]]><package xmlns="http://www.idpf.org/2007/opf" version="3.0"
                    profile="http://www.idpf.org/epub/30/profile/package/"/>
            </p:inline>
        </p:input>
    </p:identity>
    <p:insert position="last-child">
        <p:documentation>Inserts the metadata, manifest and spine (in that order) as children of the
            &lt;opf:package ...&gt;-element.</p:documentation>
        <p:input port="insertion">
            <p:pipe port="result" step="opf-metadata"/>
            <p:pipe port="result" step="opf-manifest"/>
            <p:pipe port="result" step="opf-spine"/>
        </p:input>
    </p:insert>
    <p:add-attribute attribute-name="unique-identifier" match="/*" attribute-value="pub-id"/>
    <p:add-attribute attribute-name="xml:lang" match="/*">
        <p:with-option name="attribute-value" select="/opf:package/opf:metadata/dc:language"/>
    </p:add-attribute>
    <p:identity name="opf-package"/>

    <p:store name="store" indent="true">
        <p:with-option name="href" select="concat($publication-dir,'package.opf')"/>
    </p:store>

    <px:fileset-add-entry name="fileset-with-package">
        <p:input port="source">
            <p:pipe port="fileset" step="opf-manifest"/>
        </p:input>
        <p:with-option name="href" select="concat($publication-dir,'package.opf')"/>
        <p:with-option name="media-type" select="'application/oebps-package+xml'"/>
    </px:fileset-add-entry>
    <px:fileset-create name="fileset-with-epub-base">
        <p:with-option name="base" select="$epub-dir"/>
    </px:fileset-create>
    <px:fileset-join name="result-fileset">
        <p:input port="source">
            <p:pipe port="result" step="fileset-with-package"/>
            <p:pipe port="result" step="fileset-with-epub-base"/>
        </p:input>
    </px:fileset-join>

</p:declare-step>
