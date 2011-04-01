<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:c="http://www.w3.org/ns/xproc-step" xmlns:smil="http://www.w3.org/ns/SMIL"
    xmlns:opf="http://www.idpf.org/2007/opf" exclude-result-prefixes="#all" version="2.0">

    <xsl:param name="language" required="yes"/>

    <xsl:template match="@*|node()">
        <xsl:choose>
            <xsl:when test="self::*">
                <xsl:element name="{local-name()}" namespace="http://www.w3.org/ns/SMIL">
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>


    </xsl:template>

    <xsl:template match="/*">
        <smil xmlns="http://www.w3.org/ns/SMIL" version="3.0"
            profile="http://www.idpf.org/epub/30/profile/content/" xml:lang="{$language}">
            <xsl:apply-templates/>
        </smil>
    </xsl:template>

    <xsl:template match="meta">
        <xsl:element name="meta" namespace="http://www.w3.org/ns/SMIL">
            <xsl:attribute name="property" select="@name"/>
            <xsl:value-of select="@content"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="layout"/>

</xsl:stylesheet>
