<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="#all" version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:mo="http://www.w3.org/ns/SMIL"
    xmlns:epub="http://www.idpf.org/2007/ops"
    xmlns:f="http://www.daisy.org/ns/pipeline/internal-functions">
    <xsl:variable name="base"
        select="f:longest-common-uri(distinct-values(//@xml:base/replace(.,'^(.*/)[^/]*$','$1')))"/>
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="/*">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:attribute name="xml:base" select="$base"/>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="*[@src or @epub:textref]">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:if test="@src">
                <xsl:attribute name="src" select="f:relative-to(@src,$base)"/>
            </xsl:if>
            <xsl:if test="@epub:textref">
                <xsl:attribute name="epub:textref" select="f:relative-to(@epub:textref,$base)"/>
            </xsl:if>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:function name="f:longest-common-uri">
        <xsl:param name="uris"/>
        <xsl:choose>
            <xsl:when test="count($uris)=1">
                <xsl:value-of select="replace($uris[1],'^(.+/)[^/]*$','$1')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="a" select="replace($uris[1],'^(.+/)[^/]*$','$1')"/>
                <xsl:variable name="b" select="replace($uris[2],'^(.+/)[^/]*$','$1')"/>
                <xsl:variable name="longest"
                    select="if (string-length($a) &gt; string-length($b))
                                                then
                                                    substring($a,0,string-length($a)-string-length(substring-after($a,$b))+1)
                                                else
                                                    substring($b,0,string-length($b)-string-length(substring-after($b,$a))+1)"/>
                <xsl:value-of
                    select="f:longest-common-uri(insert-before(subsequence($uris,3),0,$longest))"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    <xsl:function name="f:relative-to">
        <xsl:param name="uri"/>
        <xsl:param name="base"/>
        <xsl:variable name="basedir" select="replace($base,'^(.+/)[^/]*$','$1')"/>
        <xsl:variable name="relative" select="substring($uri,string-length($basedir)+1)"/>
        <xsl:value-of select="$relative"/>
    </xsl:function>
</xsl:stylesheet>
