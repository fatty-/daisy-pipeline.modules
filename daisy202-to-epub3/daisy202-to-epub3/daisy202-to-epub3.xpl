<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc"
    xmlns:px="http://www.daisy.org/ns/pipeline/xproc"
    xmlns:cx="http://xmlcalabash.com/ns/extensions"
    xmlns:pxi="http://www.daisy.org/ns/pipeline/xproc/internal"
    xmlns:xd="http://www.daisy.org/ns/pipeline/doc" version="1.0">

    <p:pipeinfo>
        <cd:converter name="daisy202-to-epub3" version="1.0"
            xmlns:cd="http://www.daisy.org/ns/pipeline/converter">
            <cd:description>Transforms a DAISY 2.02 publication into an EPUB3
                publication.</cd:description>
            <cd:arg name="href" type="option" bind="href" desc="Path to input NCC."/>
            <cd:arg name="output" type="option" bind="output"
                desc="Path to output directory for the EPUB."/>
        </cd:converter>
    </p:pipeinfo>

    <p:documentation xd:target="parent">
        <xd:short>Transforms a DAISY 2.02-book into an EPUB3-book.</xd:short>
        <xd:author>
            <xd:name>Jostein Austvik Jacobsen</xd:name>
            <xd:mailto>josteinaj@gmail.com</xd:mailto>
            <xd:organization>NLB</xd:organization>
        </xd:author>
        <xd:maintainer>Jostein Austvik Jacobsen</xd:maintainer>
        <xd:version>1.0</xd:version>
        <xd:see>http://code.google.com/p/daisy-pipeline/</xd:see>
        <xd:option name="href">Path to input NCC.</xd:option>
        <xd:option name="output">Path to output directory for the EPUB.</xd:option>
        <xd:import href="ncc.xpl">For loading the NCC.</xd:import>
        <xd:import href="mediaoverlay-and-content.xpl">For processing the SMILs and the
            content.</xd:import>
        <xd:import href="resources.xpl">For processing auxiliary resources.</xd:import>
        <xd:import href="navigation.xpl">For making the navigation document.</xd:import>
        <xd:import href="package.xpl">For making the package document.</xd:import>
    </p:documentation>

    <p:output port="result">
        <p:pipe port="result" step="zip"/>
    </p:output>

    <p:option name="href" required="true"/>
    <p:option name="output" required="true"/>

    <p:import href="ncc.xpl"/>
    <p:import href="mediaoverlay-and-content.xpl"/>
    <p:import href="navigation.xpl"/>
    <p:import href="resources.xpl"/>
    <p:import href="package.xpl"/>
    <p:import
        href="http://www.daisy.org/pipeline/modules/epub3-ocf-utils/xproc/epub3-ocf-library.xpl"/>

    <p:variable name="daisy-dir" select="replace(p:resolve-uri($href),'[^/]+$','')">
        <p:inline>
            <irrelevant/>
        </p:inline>
    </p:variable>
    <p:variable name="output-dir"
        select="if (ends-with(p:resolve-uri($output),'/'))
                    then p:resolve-uri($output)
                    else concat(p:resolve-uri($output),'/')">
        <p:inline>
            <irrelevant/>
        </p:inline>
    </p:variable>
    <p:variable name="epub-dir" select="concat($output-dir,'epub/')"/>
    <p:variable name="content-dir" select="concat($epub-dir,'Publication/')"/>
    <p:variable name="subcontent-dir" select="concat($content-dir,'Content/')"/>

    <p:documentation>Load the DAISY 2.02 NCC.</p:documentation>
    <pxi:daisy202-to-epub3-ncc name="ncc">
        <p:with-option name="href" select="p:resolve-uri($href)">
            <p:inline>
                <irrelevant/>
            </p:inline>
        </p:with-option>
    </pxi:daisy202-to-epub3-ncc>

    <pxi:daisy202-to-epub3-mediaoverlay-and-content name="mediaoverlay-and-content">
        <p:with-option name="daisy-dir" select="$daisy-dir"/>
        <p:with-option name="subcontent-dir" select="$subcontent-dir"/>
        <p:input port="flow">
            <p:pipe port="flow" step="ncc"/>
        </p:input>
    </pxi:daisy202-to-epub3-mediaoverlay-and-content>

    <p:documentation>Copy all referenced auxilliary resources (audio, stylesheets, images,
        etc.)</p:documentation>
    <pxi:daisy202-to-epub3-resources name="resources">
        <p:input port="daisy-smil">
            <p:pipe port="daisy-smil" step="mediaoverlay-and-content"/>
        </p:input>
        <p:input port="daisy-content">
            <p:pipe port="daisy-content" step="mediaoverlay-and-content"/>
        </p:input>
        <p:with-option name="daisy-dir" select="$daisy-dir"/>
        <p:with-option name="subcontent-dir" select="$subcontent-dir"/>
        <p:with-option name="epub-dir" select="$epub-dir"/>
    </pxi:daisy202-to-epub3-resources>

    <p:documentation>Make and store the OPF</p:documentation>
    <pxi:daisy202-to-epub3-package name="package">
        <p:with-option name="content-dir" select="$content-dir"/>
        <p:with-option name="epub-dir" select="$epub-dir"/>
        <p:input port="ncc">
            <p:pipe port="ncc" step="ncc"/>
        </p:input>
        <p:input port="manifest">
            <p:pipe port="manifest" step="mediaoverlay-and-content"/>
            <p:pipe port="manifest" step="resources"/>
        </p:input>
    </pxi:daisy202-to-epub3-package>

    <p:documentation>Make and store the EPUB 3 Navigation Document based on the DAISY 2.02
        NCC.</p:documentation>
    <pxi:daisy202-to-epub3-navigation name="navigation">
        <p:with-option name="content-dir" select="$content-dir"/>
        <p:with-option name="subcontent-dir" select="$subcontent-dir"/>
        <p:input port="ncc">
            <p:pipe port="ncc" step="ncc"/>
        </p:input>
        <p:input port="daisy-smil">
            <p:pipe port="daisy-smil" step="mediaoverlay-and-content"/>
        </p:input>
    </pxi:daisy202-to-epub3-navigation>

    <p:documentation>Finalize the EPUB3 fileset (i.e. make it ready for zipping).</p:documentation>
    <p:group name="finalize">
        <p:output port="result" primary="false">
            <p:pipe port="result" step="finalize.result"/>
        </p:output>
        <p:identity name="finalize.store-complete">
            <p:input port="source">
                <p:pipe port="store-complete" step="mediaoverlay-and-content"/>
                <p:pipe port="manifest" step="resources"/>
                <p:pipe port="store-complete" step="navigation"/>
                <p:pipe port="store-complete" step="package"/>
            </p:input>
        </p:identity>
        <p:sink/>
        <px:epub3-ocf-finalize cx:depends-on="finalize.store-complete" name="finalize.result">
            <p:input port="source">
                <p:pipe port="fileset" step="package"/>
            </p:input>
        </px:epub3-ocf-finalize>
    </p:group>

    <p:documentation>Package the EPUB 3 fileset as a ZIP-file (OCF).</p:documentation>
    <px:epub3-ocf-zip name="zip">
        <p:input port="source">
            <p:pipe port="result" step="finalize"/>
        </p:input>
        <p:with-option name="target"
            select="replace(concat($output-dir,encode-for-uri(//dc:identifier),' - ',//dc:title,'.epub'),'^[^:]+:(.*)$','$1')">
            <p:pipe port="opf-package" step="package"/>
        </p:with-option>
    </px:epub3-ocf-zip>

</p:declare-step>
