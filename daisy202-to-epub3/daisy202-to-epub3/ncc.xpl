<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" xmlns:html="http://www.w3.org/1999/xhtml" xmlns:px="http://www.daisy.org/ns/pipeline/xproc"
    xmlns:pxi="http://www.daisy.org/ns/pipeline/xproc/internal" xmlns:xd="http://www.daisy.org/ns/pipeline/doc" xmlns:d="http://www.daisy.org/ns/pipeline/data" type="pxi:daisy202-to-epub3-ncc"
    version="1.0">

    <p:documentation xd:target="parent">
        <xd:short>Load the DAISY 2.02 NCC.</xd:short>
    </p:documentation>

    <p:option name="href" required="true">
        <p:documentation>
            <xd:short>URI to input NCC.</xd:short>
            <xd:example>file:/home/user/daisy202/ncc.html</xd:example>
        </p:documentation>
    </p:option>

    <p:output port="ncc" primary="false">
        <p:documentation>
            <xd:short>The DAISY 2.02 NCC</xd:short>
            <xd:example>
                <html xmlns="http://www.w3.org/1999/xhtml" xml:base="file:/home/user/daisy202/ncc.html">...</html>
            </xd:example>
        </p:documentation>
        <p:pipe port="result" step="ncc"/>
    </p:output>
    <p:output port="flow" primary="false">
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
        <p:pipe port="result" step="flow"/>
    </p:output>
    <p:output port="pub-id" primary="false">
        <p:documentation>
            <xd:short>The publication identifier, extracted from the dc:itentifier meta element in the DAISY 2.02 NCC.</xd:short>
            <xd:example>
                <d:meta>1234567890</d:meta>
            </xd:example>
        </p:documentation>
        <p:pipe port="result" step="pub-id"/>
    </p:output>

    <p:import href="http://www.daisy.org/pipeline/modules/html-utils/html-library.xpl">
        <p:documentation>
            <xd:short>For loading the NCC, which is a HTML-file.</xd:short>
        </p:documentation>
    </p:import>

    <p:documentation>Loads the NCC.</p:documentation>
    <px:html-load name="ncc">
        <p:with-option name="href" select="$href"/>
    </px:html-load>

    <p:documentation>Makes a chronologically ordered list of SMIL-files referenced from the NCC.</p:documentation>
    <p:xslt name="flow">
        <p:input port="source">
            <p:pipe port="result" step="ncc"/>
        </p:input>
        <p:input port="parameters">
            <p:empty/>
        </p:input>
        <p:input port="stylesheet">
            <p:document href="ncc-to-flow-fileset.xsl"/>
        </p:input>
    </p:xslt>
    <p:sink/>

    <p:add-attribute name="pub-id" match="/*" attribute-name="value">
        <p:with-option name="attribute-value" select="//html:head/html:meta[@name='dc:identifier']/@content">
            <p:pipe port="result" step="ncc"/>
        </p:with-option>
        <p:input port="source">
            <p:inline>
                <d:meta name="pub-id"/>
            </p:inline>
        </p:input>
    </p:add-attribute>
    <p:sink/>

</p:declare-step>
