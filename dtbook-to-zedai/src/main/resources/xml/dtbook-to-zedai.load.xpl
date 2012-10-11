<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step version="1.0" name="dtbook-to-zedai.load" type="px:dtbook-to-zedai-load" xmlns:p="http://www.w3.org/ns/xproc"
    xmlns:c="http://www.w3.org/ns/xproc-step" xmlns:cx="http://xmlcalabash.com/ns/extensions" xmlns:cxo="http://xmlcalabash.com/ns/extensions/osutils"
    xmlns:px="http://www.daisy.org/ns/pipeline/xproc" xmlns:pxi="http://www.daisy.org/ns/pipeline/xproc/internal"
    xmlns:tmp="http://www.daisy.org/ns/pipeline/tmp" xmlns:z="http://www.daisy.org/ns/z3998/authoring/"
    xmlns:d="http://www.daisy.org/ns/pipeline/data" exclude-inline-prefixes="cx p c cxo px pxi z tmp">

    <p:documentation>
        Loads the DTBook XML fileset.
    </p:documentation>

    <p:input port="source" primary="true" sequence="true" px:media-type="application/x-dtbook+xml">
        <p:documentation>
            One or more DTBook files to be loaded. 
            Any auxilliary resources referenced from the DTBook documents will be resolved based on these files.
        </p:documentation>
    </p:input>

    <p:output port="fileset.out" primary="true">
        <p:documentation>
            A fileset containing references to all the DTBook files and any resources they reference (images etc.). The xml:base is also set with an absolute URI for each file, and is intended to represent the "original file", 
            while the href can change during conversions to reflect the path and filename of the resource in the output fileset.
        </p:documentation>
        <p:pipe port="result" step="fileset"/>
    </p:output>

    <p:output port="in-memory.out" sequence="true">
        <p:documentation>
            A sequence of all the DTBook documents loaded from disk so that the DTBook conversion step does not depend on documents being stored on disk. 
            This means that the conversion step can receive DTBook documents either through this step, or as a result from other conversion steps, 
            allowing for easy chaining of scripts.
        </p:documentation>
        <p:pipe port="result" step="dtbook"/>
    </p:output>

    <p:import href="http://www.daisy.org/pipeline/modules/fileset-utils/xproc/fileset-library.xpl"/>
    <p:import href="http://www.daisy.org/pipeline/modules/mediatype-utils/mediatype.xpl"/>
  
    <p:identity name="dtbook"/>

    <p:for-each>
        <p:variable name="dtbook-base" select="base-uri(/*)"/>
        <p:variable name="fileset-base" select="replace($dtbook-base,'^(.*/)[^/]*$','$1')"/>
        <p:identity name="for-each.dtbook"/>
        <px:fileset-create name="for-each.fileset">
            <p:with-option name="base" select="$fileset-base"/>
        </px:fileset-create>
        <px:fileset-add-entry name="fileset.dtbook">
            <p:with-option name="href" select="$dtbook-base"/>
            <p:with-option name="media-type" select="'application/x-dtbook+xml'"/>
        </px:fileset-add-entry>
        <p:for-each name="fileset.resources">
            <p:output port="result"/>
            <p:iteration-source select="//*[@src]">
                <p:pipe port="result" step="for-each.dtbook"/>
            </p:iteration-source>
            <p:variable name="src" select="/*/@src"/>
            <px:fileset-add-entry>
                <p:input port="source">
                    <p:pipe port="result" step="for-each.fileset"/>
                </p:input>
                <p:with-option name="href" select="$src"/>
            </px:fileset-add-entry>
        </p:for-each>
        <px:fileset-join>
            <p:input port="source">
                <p:pipe port="result" step="fileset.dtbook"/>
                <p:pipe port="result" step="fileset.resources"/>
            </p:input>
        </px:fileset-join>
    </p:for-each>
    <px:fileset-join/>
    <px:mediatype-detect/>
    <p:group>
        <p:variable name="fileset-base" select="base-uri(/*)"/>
        <p:viewport match="/*/*">
            <p:add-attribute attribute-name="original-href" match="/*">
                <p:with-option name="attribute-value" select="resolve-uri(/*/@href,$fileset-base)"/>
            </p:add-attribute>
        </p:viewport>
    </p:group>
    <p:identity name="fileset"/>
    <p:sink/>

</p:declare-step>
