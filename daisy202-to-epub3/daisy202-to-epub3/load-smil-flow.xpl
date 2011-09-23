<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" xmlns:px="http://www.daisy.org/ns/pipeline/xproc" xmlns:pxi="http://www.daisy.org/ns/pipeline/xproc/internal"
    xmlns:html="http://www.w3.org/1999/xhtml" xmlns:d="http://www.daisy.org/ns/pipeline/data" xmlns:mo="http://www.w3.org/ns/SMIL" xmlns:xd="http://www.daisy.org/ns/pipeline/doc"
    type="pxi:daisy202-to-epub3-load-smil-flow" name="load-smil-flow" version="1.0">

    <p:documentation xd:target="parent">
        <xd:short>For loading the SMIL flow.</xd:short>
    </p:documentation>

    <p:input port="flow" primary="true">
        <p:documentation>
            <xd:short>A fileset with references to the DAISY 2.02 SMIL-files, ordered like the DAISY 2.02 flow.</xd:short>
            <xd:example>
                <d:fileset xmlns:d="http://www.daisy.org/ns/pipeline/data" xml:base="file:/home/user/daisy202/">
                    <d:file href="a.smil" media-type="application/smil+xml"/>
                    <d:file href="b.smil" media-type="application/smil+xml"/>
                    <d:file href="c.smil" media-type="application/smil+xml"/>
                </d:fileset>
            </xd:example>
        </p:documentation>
    </p:input>
    <p:output port="daisy-smil" sequence="true">
        <p:documentation>
            <xd:short>The DAISY 2.02 SMIL-files.</xd:short>
            <xd:example xmlns="">
                <smil xml:base="file:/home/user/daisy202/a.smil">...</smil>
                <smil xml:base="file:/home/user/daisy202/b.smil">...</smil>
                <smil xml:base="file:/home/user/daisy202/c.smil">...</smil>
            </xd:example>
        </p:documentation>
        <p:pipe port="daisy-smil" step="flow-iterate"/>
    </p:output>
    <p:output port="content-flow" sequence="true">
        <p:documentation>
            <xd:short>A fileset with references to the DAISY 2.02 content files, ordered by occurence in the DAISY 2.02 flow.</xd:short>
            <xd:example>
                <d:fileset xmlns:d="http://www.daisy.org/ns/pipeline/data" xml:base="file:/home/user/daisy202/">
                    <d:file href="a.html" media-type="application/xhtml+xml"/>
                    <d:file href="b.html" media-type="application/xhtml+xml"/>
                    <d:file href="c.html" media-type="application/xhtml+xml"/>
                </d:fileset>
            </xd:example>
        </p:documentation>
        <p:pipe port="result" step="content-flow"/>
    </p:output>

    <p:import href="http://www.daisy.org/pipeline/modules/fileset-utils/xproc/fileset-library.xpl">
        <p:documentation>For manipulating filesets.</p:documentation>
    </p:import>

    <p:add-xml-base all="true" relative="false"/>
    <p:for-each name="flow-iterate">
        <p:output port="daisy-smil" primary="false" sequence="true">
            <p:pipe port="result" step="flow-iterate.daisy-smil"/>
        </p:output>
        <p:output port="content-flow" primary="false" sequence="true">
            <p:pipe port="result" step="flow-iterate.content-flow"/>
        </p:output>
        <p:iteration-source select="/*/*"/>
        <p:variable name="original-uri" select="p:resolve-uri(/*/@href,/*/@xml:base)"/>
        <p:variable name="xml-base" select="/*/@xml:base"/>
        <p:load name="flow-iterate.smils">
            <p:with-option name="href" select="$original-uri"/>
        </p:load>
        <p:add-attribute match="/*" attribute-name="xml:base" name="flow-iterate.daisy-smil">
            <p:with-option name="attribute-value" select="$original-uri"/>
        </p:add-attribute>
        <p:xslt>
            <p:with-param name="xml-base" select="$xml-base"/>
            <p:input port="stylesheet">
                <p:document href="http://www.daisy.org/pipeline/modules/mediaoverlay-utils/smil-to-text-fileset.xsl"/>
            </p:input>
        </p:xslt>
        <p:add-attribute match="//d:file" attribute-name="media-type" attribute-value="application/xhtml+xml"/>
        <p:identity name="flow-iterate.content-flow"/>
    </p:for-each>

    <px:fileset-join name="content-flow">
        <p:input port="source">
            <p:pipe port="content-flow" step="flow-iterate"/>
        </p:input>
    </px:fileset-join>

</p:declare-step>
