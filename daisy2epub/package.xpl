<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" xmlns:c="http://www.w3.org/ns/xproc-step"
    xmlns:d2e="http://pipeline.daisy.org/ns/daisy2epub/"
    xmlns:cxf="http://xmlcalabash.com/ns/extensions/fileutils"
    xmlns:cx="http://xmlcalabash.com/ns/extensions" xmlns:opf="http://www.idpf.org/2007/opf" type="d2e:package" name="package"
    version="1.0">

    <p:documentation><![CDATA[
            input: result@metadata
            input: result@manifest
            input: result@spine
            primary output: "result"
            output: "store-complete"
    ]]></p:documentation>
    
    <p:input port="metadata" primary="false"/>
    <p:input port="manifest" primary="false"/>
    <p:input port="spine" primary="false"/>
    <p:output port="result"/>
    <p:output port="store-complete" primary="false">
        <p:pipe port="result" step="package.store"/>
    </p:output>
    
    <p:option name="content-dir" required="true"/>
    
    <p:identity>
        <p:input port="source">
            <p:inline>
                <opf:package version="3.0"
                    profile="http://www.idpf.org/epub/30/profile/package/"/>
            </p:inline>
        </p:input>
    </p:identity>
    <p:insert position="last-child">
        <p:input port="insertion">
            <p:pipe port="metadata" step="package"/>
            <p:pipe port="manifest" step="package"/>
            <p:pipe port="spine" step="package"/>
        </p:input>
    </p:insert>
    <p:add-attribute attribute-name="unique-identifier" match="/*">
        <p:with-option name="attribute-value" select="'TODO (dc:identifier from metadata)'"/>
    </p:add-attribute>
    <p:add-attribute attribute-name="xml:lang" match="/*">
        <p:with-option name="attribute-value" select="'TODO (language from metadata)'"/>
    </p:add-attribute>
    <p:identity name="package.document"/>
    <p:store name="package.store">
        <p:with-option name="href" select="concat($content-dir,'package.opf')"/>
    </p:store>
    <p:add-attribute attribute-name="xml:base" match="/*">
        <p:input port="source">
            <p:pipe port="result" step="package.document"/>
        </p:input>
        <p:with-option name="attribute-value" select=".">
            <p:pipe port="result" step="package.store"/>
        </p:with-option>
    </p:add-attribute>
    
</p:declare-step>