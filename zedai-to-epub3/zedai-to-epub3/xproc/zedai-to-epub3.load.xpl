<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" xmlns:px="http://www.daisy.org/ns/pipeline/xproc" xmlns:cx="http://xmlcalabash.com/ns/extensions"
    xmlns:d="http://www.daisy.org/ns/pipeline/data" xmlns:xd="http://www.daisy.org/ns/pipeline/doc" xmlns:z="http://www.daisy.org/ns/z3986/authoring/"
    type="px:zedai-to-epub3-load" exclude-inline-prefixes="#all" version="1.0">

    <p:documentation xd:target="parent">Loads a ZedAI (DAISY 4 XML) fileset from disk.</p:documentation>

    <p:input port="source" primary="true" px:name="source"/>
    <p:output port="fileset.out" primary="true">
        <p:pipe port="result" step="fileset"/>
    </p:output>
    <p:output port="in-memory.out" sequence="true">
        <p:pipe port="result" step="zedai"/>
    </p:output>

    <p:import href="http://www.daisy.org/pipeline/modules/fileset-utils/xproc/fileset-library.xpl"/>

    <!--=========================================================================-->
    <!-- INITIALIZATION                                                          -->
    <!--=========================================================================-->

    <p:documentation>Prepare the ZedAI Document</p:documentation>
    <p:group name="zedai">
        <p:output port="result"/>
        <p:identity/>
        <p:add-xml-base/>
        <!--TODO process xincludes-->
    </p:group>

    <!--=========================================================================-->
    <!-- EXTRACT RESOURCES                                                       -->
    <!--=========================================================================-->

    <p:group name="fileset">
        <p:output port="result"/>
        <p:variable name="zedai-href" select="/*/@xml:base"/>
        <p:variable name="fileset-base" select="replace($zedai-href,'[^/]+$','')"/>
        <p:for-each>
            <p:iteration-source select="//z:object[@src]"/>
            <p:variable name="href" select="/*/@src"/>
            <p:variable name="media-type" select="(/*/@srctype,'')[1]"/>
            <px:fileset-create>
                <p:with-option name="base" select="$fileset-base"/>
            </px:fileset-create>
            <px:fileset-add-entry>
                <p:with-option name="href" select="$href"/>
                <p:with-option name="media-type" select="$media-type"/>
            </px:fileset-add-entry>
            <p:add-attribute match="/*/*" attribute-name="original-href">
                <p:with-option name="attribute-value" select="p:resolve-uri($href,$zedai-href)"/>
            </p:add-attribute>
        </p:for-each>
        <px:fileset-join name="fileset.resources"/>

        <px:fileset-create>
            <p:with-option name="base" select="$fileset-base"/>
        </px:fileset-create>
        <px:fileset-add-entry>
            <p:with-option name="href" select="$zedai-href"/>
            <p:with-option name="media-type" select="'application/x-Z39.86-AI+xml'"/>
        </px:fileset-add-entry>
        <p:add-attribute match="/*/*" attribute-name="original-href">
            <p:with-option name="attribute-value" select="$zedai-href"/>
        </p:add-attribute>
        <p:identity name="fileset.zedai"/>

        <px:fileset-join>
            <p:input port="source">
                <p:pipe port="result" step="fileset.zedai"/>
                <p:pipe port="result" step="fileset.resources"/>
            </p:input>
        </px:fileset-join>
    </p:group>

</p:declare-step>
