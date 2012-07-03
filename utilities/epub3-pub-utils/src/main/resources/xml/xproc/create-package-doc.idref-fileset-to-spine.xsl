<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns="http://www.idpf.org/2007/opf">
    <xsl:output indent="yes"/>
    <xsl:template match="/*">
        <spine>
            <xsl:for-each select="*">
                <itemref idref="{@idref}" id="itemref_{position()}"/>
            </xsl:for-each>
        </spine>
    </xsl:template>
</xsl:stylesheet>
