<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
    xmlns:c="http://www.w3.org/ns/xproc-step"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="#all">
    
    <xsl:template match="/">
        <section>
            <h2>Relax NG Validation Results</h2>
            <ul>
                <xsl:apply-templates/>
            </ul>
        </section>
    </xsl:template>
    
    <!-- note that below, &#160; = &nbsp; -->
    <xsl:template match="c:error">
        <li>
            (<em>Line: </em><xsl:value-of select="@line"/>, 
            <em>Column: </em><xsl:value-of select="@column"/>) 
            &#160;
            <xsl:value-of select="./text()"/>
        </li>
    </xsl:template>
    
</xsl:stylesheet>