<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:opf="http://www.idpf.org/2007/opf" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:template match="/*">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:copy-of select="*[not(self::opf:meta)]"/>
            <xsl:for-each select="opf:meta">
                <xsl:copy-of select="."/>
                <xsl:if test="not(@refines)">
                    <opf:meta name="{@property}" content="{.}">
                        <xsl:if test="@scheme">
                            <xsl:copy-of select="@scheme"/>
                        </xsl:if>
                    </opf:meta>
                </xsl:if>
            </xsl:for-each>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>