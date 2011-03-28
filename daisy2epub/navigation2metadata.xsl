<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:c="http://www.w3.org/ns/xproc-step" xmlns:html="http://www.w3.org/1999/xhtml" version="2.0">
    
    <xsl:template match="/*">
        <c:metadata>
            <xsl:for-each select="//html:head/html:meta">
                <c:meta name="{@name}" content="{@content}">
                    <xsl:if test="@scheme">
                        <xsl:attribute name="scheme" select="@scheme"/>
                    </xsl:if>
                </c:meta>
            </xsl:for-each>
        </c:metadata>
    </xsl:template>
    
</xsl:stylesheet>
