<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:dtb="http://www.daisy.org/z3986/2005/dtbook/"
    exclude-result-prefixes="dtb" version="2.0"
    xmlns:d2z="http://pipeline.daisy.org/ns/dtbook2zedai/">


    <xsl:output indent="yes" method="xml"/>


    <xsl:template match="/">

        <xsl:message>Rename code and kbd elements.</xsl:message>
        <xsl:apply-templates/>
        <xsl:message>--Done</xsl:message>
    </xsl:template>

    <!-- identity template -->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="dtb:code | dtb:kbd">
        <xsl:variable name="block-level-contents"
            select="tokenize('dfn,code,samp,kbd,cite,a,img,imggroup,q,sent,w,prodnote,annoref,noteref', ',')"/>

        <xsl:choose>
            <xsl:when test="child::*/local-name() = $block-level-contents">
                <xsl:element name="d2z:code-block">
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:when>
            <!-- if it doesn't have any of the above elements, then all the contents must be from this list of phrase-level elements
                em, strong,  abbr, acronym,  br,  sub, sup, bdo, pagenum, text()-->
            <xsl:otherwise>
                <xsl:element name="d2z:code-phrase">
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>


    </xsl:template>

</xsl:stylesheet>
