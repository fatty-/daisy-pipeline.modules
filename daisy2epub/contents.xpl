<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" xmlns:c="http://www.w3.org/ns/xproc-step"
    xmlns:d2e="http://pipeline.daisy.org/ns/daisy2epub/"
    xmlns:cxf="http://xmlcalabash.com/ns/extensions/fileutils"
    xmlns:html="http://www.w3.org/1999/xhtml" xmlns:px="http://pipeline.daisy.org/ns/"
    xmlns:cx="http://xmlcalabash.com/ns/extensions" xmlns:opf="http://www.idpf.org/2007/opf"
    type="d2e:contents" name="contents" version="1.0">

    <p:input port="source" primary="true"/>
    <p:input port="id-mapping" primary="false"/>
    <p:output port="manifest" primary="false">
        <p:pipe port="result" step="contents.manifest"/>
    </p:output>
    <p:output port="store-complete" primary="false" sequence="true">
        <p:pipe port="store" step="contents.iterate"/>
    </p:output>
    <p:output port="resource-manifest" primary="false">
        <p:pipe port="result" step="contents.resources"/>
    </p:output>
    <p:output port="metadata" primary="false">
        <p:pipe port="result" step="contents.metadata"/>
    </p:output>

    <p:option name="daisy-dir" required="true"/>
    <p:option name="content-dir" required="true"/>
    <p:option name="epub-dir" required="true"/>

    <p:import href="fileset-library.xpl"/>
    <p:import href="html-library.xpl"/>

    <p:documentation><![CDATA[
            read XHTML-files
            input: spine-manifest@media-overlay
            primary output: "manifest"
            output: "store-complete"
            output: "resource-manifest"
            output: "metadata"
    ]]></p:documentation>

    <p:for-each name="contents.iterate">
        <p:output port="manifest">
            <p:pipe port="result" step="contents.iterate.manifest"/>
        </p:output>
        <p:output port="store" primary="false">
            <p:pipe port="result" step="contents.iterate.store"/>
        </p:output>
        <p:output port="resources" primary="false">
            <p:pipe port="result" step="contents.iterate.resources"/>
        </p:output>
        <p:output port="metadata" primary="false">
            <p:pipe port="result" step="contents.iterate.metadata"/>
        </p:output>

        <p:iteration-source select="//c:entry"/>
        <p:variable name="href" select="/*/@href"/>
        <p:variable name="new-href" select="replace($href,'\.([^\.]+)$','.xhtml')"/>

        <px:load-html>
            <p:with-option name="href" select="concat($daisy-dir,$href)"/>
        </px:load-html>
        <p:viewport match="//html:a">
            <p:variable name="smil-href" select="tokenize(/*/@href,'#')[1]"/>
            <p:variable name="smil-id"
                select="if (contains(/*/@href,'#')) then tokenize(/*/@href,'#')[last()] else ''"/>
            <p:add-attribute match="/*" attribute-name="href">
                <p:with-option name="attribute-value"
                    select="concat(
                            //c:entry[@smil-href=$smil-href]/@content-href,
                            if ($smil-id)
                            then concat('#', //c:entry[@smil-href=$smil-href[1]]/c:id[@smil-id=$smil-id]/@content-id )
                            else ''
                            )">
                    <p:pipe port="id-mapping" step="contents"/>
                </p:with-option>
            </p:add-attribute>
        </p:viewport>
        <p:xslt name="contents.iterate.xhtml">
            <p:with-param name="href" select="$new-href"/>
            <p:input port="stylesheet">
                <p:document href="xhtml2content.xsl"/>
            </p:input>
        </p:xslt>
        <p:delete match="/*/@xml:base"/>
        <p:store name="contents.iterate.store">
            <p:with-option name="href" select="p:resolve-uri(concat($content-dir,$new-href))"/>
        </p:store>
        <p:add-attribute name="contents.iterate.content" attribute-name="xml:base" match="/*">
            <p:input port="source">
                <p:pipe port="result" step="contents.iterate.xhtml"/>
            </p:input>
            <p:with-option name="attribute-value" select=".">
                <p:pipe port="result" step="contents.iterate.store"/>
            </p:with-option>
        </p:add-attribute>
        <p:sink/>

        <p:xslt name="contents.iterate.resources">
            <p:with-param name="base" select="$epub-dir"/>
            <p:input port="source">
                <p:pipe port="result" step="contents.iterate.content"/>
            </p:input>
            <p:input port="stylesheet">
                <p:document href="content2resources.xsl"/>
            </p:input>
        </p:xslt>
        <p:sink/>

        <p:xslt name="contents.iterate.metadata">
            <p:input port="source">
                <p:pipe port="result" step="contents.iterate.content"/>
            </p:input>
            <p:input port="parameters">
                <p:empty/>
            </p:input>
            <p:input port="stylesheet">
                <p:document href="content2metadata.xsl"/>
            </p:input>
        </p:xslt>
        <p:sink/>

        <px:create-manifest>
            <p:with-option name="base" select="$epub-dir"/>
        </px:create-manifest>
        <px:add-manifest-entry name="contents.iterate.manifest">
            <p:with-option name="href"
                select="concat(substring-after($content-dir,$epub-dir),$new-href)"/>
            <p:with-option name="media-type" select="'application/xhtml+xml'"/>
        </px:add-manifest-entry>
        <p:sink/>
    </p:for-each>

    <px:join-manifests name="contents.manifest">
        <p:input port="source">
            <p:pipe port="manifest" step="contents.iterate"/>
        </p:input>
    </px:join-manifests>
    <p:sink/>

    <px:join-manifests name="contents.resources">
        <p:input port="source">
            <p:pipe port="resources" step="contents.iterate"/>
        </p:input>
    </px:join-manifests>
    <p:sink/>

    <p:wrap-sequence wrapper="c:metadata">
        <p:input port="source">
            <p:pipe port="metadata" step="contents.iterate"/>
        </p:input>
    </p:wrap-sequence>
    <p:unwrap name="contents.metadata" match="c:metadata[parent::c:metadata]"/>
    <p:sink/>

</p:declare-step>
