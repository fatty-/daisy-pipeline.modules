<p:library version="1.0" 
    xmlns:p="http://www.w3.org/ns/xproc"
    xmlns:c="http://www.w3.org/ns/xproc-step" 
    xmlns:px="http://www.daisy.org/ns/pipeline/xproc"
    xmlns:xd="http://www.daisy.org/ns/pipeline/doc"
    xmlns:tmp="http://www.daisy.org/ns/pipeline/tmp"
    xmlns:dtb="http://www.daisy.org/z3986/2005/dtbook/"
    exclude-inline-prefixes="dtb tmp p c px xd">

    <p:documentation>
        <xd:short>Metadata Utilities Library</xd:short>
        <xd:author>
            <xd:name>Marisa DeMeglio</xd:name>
            <xd:mailto>marisa.demeglio@gmail.com</xd:mailto>
            <xd:organization>DAISY</xd:organization>
        </xd:author>
        <xd:maintainer>Marisa DeMeglio</xd:maintainer>
    </p:documentation>
    
    
    <p:documentation>Generate a MODS metadata record from a DTBook 2005-3 document.</p:documentation>
    <p:declare-step name="dtbook-to-mods-meta" type="px:dtbook-to-mods-meta">
        <p:input port="source"/>
        <p:output port="result"/>
        <p:input port="parameters" kind="parameter"/>
        <p:validate-with-relax-ng name="validate-dtbook-input">
            <p:input port="schema">
                <p:document href="schema/dtbook-2005-3.rng"/>
            </p:input>
        </p:validate-with-relax-ng>
        <p:xslt name="generate-mods">
            <p:input port="stylesheet">
                <p:document href="dtbook-to-mods-meta.xsl"/>
            </p:input>
        </p:xslt>
    </p:declare-step>
    
    <p:documentation>Generate ZedAI inline metadata from a DTBook 2005-3 document.</p:documentation>
    <p:declare-step name="dtbook-to-zedai-meta" type="px:dtbook-to-zedai-meta">
        <p:input port="source"/>
        <p:output port="result"/>
        <p:input port="parameters" kind="parameter"/>
        <p:validate-with-relax-ng name="validate-dtbook-input">
            <p:input port="schema">
                <p:document href="schema/dtbook-2005-3.rng"/>
            </p:input>
        </p:validate-with-relax-ng>
        <p:xslt name="generate-zedai-meta">
            <p:input port="stylesheet">
                <p:inline>
                    <!-- This is a wrapper to XML-ify the output.  XProc will only accept it this way. -->
                    <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
                        <xsl:import href="dtbook-to-zedai-meta.xsl"/>
                        <xsl:template match="/">
                            <tmp:wrapper>
                                <xsl:apply-imports/>
                            </tmp:wrapper>
                        </xsl:template>
                    </xsl:stylesheet>
                </p:inline>
            </p:input>
        </p:xslt>
    </p:declare-step>
    
</p:library>
