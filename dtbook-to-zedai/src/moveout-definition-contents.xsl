<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:dtb="http://www.daisy.org/z3986/2005/dtbook/" exclude-result-prefixes="dtb" version="2.0">


    <!--Move target element out into the parent 'item' and split the 'dd' element that used
            to contain it. 
            
        These cases are handled separately from the rest of the moveout-* transformations because
        these are not recursive.  We are always assured of an <item> parent which can take the unallowed child element.
    -->

    <xsl:output indent="yes" method="xml"/>

    <xsl:include href="moveout-template.xsl"/>

    <xsl:template match="/">
        <xsl:message>Normalize definitions in definition lists by moving out certain child elements.</xsl:message>
        <xsl:apply-templates/>
        <xsl:message>--Done</xsl:message>
    </xsl:template>

    <!-- identity template -->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="dtb:item/dtb:dd[dtb:list]">
        <xsl:message>Found unsuitable parent: {<xsl:value-of select="name()"/>}, id={<xsl:value-of
                select="@id"/>}</xsl:message>
        <xsl:call-template name="move-elem-out">
            <xsl:with-param name="elem-to-move-name">list</xsl:with-param>
            <xsl:with-param name="split-into-elem-name">dd</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="dtb:item/dtb:dd[dtb:dl]">
        <xsl:message>Found unsuitable parent: {<xsl:value-of select="name()"/>}, id={<xsl:value-of
                select="@id"/>}</xsl:message>
        <xsl:call-template name="move-elem-out">
            <xsl:with-param name="elem-to-move-name">dl</xsl:with-param>
            <xsl:with-param name="split-into-elem-name">dd</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="dtb:item/dtb:dd[dtb:div]">
        <xsl:message>Found unsuitable parent: {<xsl:value-of select="name()"/>}, id={<xsl:value-of
                select="@id"/>}</xsl:message>
        <xsl:call-template name="move-elem-out">
            <xsl:with-param name="elem-to-move-name">div</xsl:with-param>
            <xsl:with-param name="split-into-elem-name">dd</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="dtb:item/dtb:dd[dtb:poem]">
        <xsl:message>Found unsuitable parent: {<xsl:value-of select="name()"/>}, id={<xsl:value-of
                select="@id"/>}</xsl:message>
        <xsl:call-template name="move-elem-out">
            <xsl:with-param name="elem-to-move-name">poem</xsl:with-param>
            <xsl:with-param name="split-into-elem-name">dd</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="dtb:item/dtb:dd[dtb:linegroup]">
        <xsl:message>Found unsuitable parent: {<xsl:value-of select="name()"/>}, id={<xsl:value-of
                select="@id"/>}</xsl:message>
        <xsl:call-template name="move-elem-out">
            <xsl:with-param name="elem-to-move-name">linegroup</xsl:with-param>
            <xsl:with-param name="split-into-elem-name">dd</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="dtb:item/dtb:dd[dtb:table]">
        <xsl:message>Found unsuitable parent: {<xsl:value-of select="name()"/>}, id={<xsl:value-of
                select="@id"/>}</xsl:message>
        <xsl:call-template name="move-elem-out">
            <xsl:with-param name="elem-to-move-name">table</xsl:with-param>
            <xsl:with-param name="split-into-elem-name">dd</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="dtb:item/dtb:dd[dtb:sidebar]">
        <xsl:message>Found unsuitable parent: {<xsl:value-of select="name()"/>}, id={<xsl:value-of
                select="@id"/>}</xsl:message>
        <xsl:call-template name="move-elem-out">
            <xsl:with-param name="elem-to-move-name">sidebar</xsl:with-param>
            <xsl:with-param name="split-into-elem-name">dd</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="dtb:item/dtb:dd[dtb:note]">
        <xsl:message>Found unsuitable parent: {<xsl:value-of select="name()"/>}, id={<xsl:value-of
                select="@id"/>}</xsl:message>
        <xsl:call-template name="move-elem-out">
            <xsl:with-param name="elem-to-move-name">note</xsl:with-param>
            <xsl:with-param name="split-into-elem-name">dd</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="dtb:item/dtb:dd[dtb:epigraph]">
        <xsl:message>Found unsuitable parent: {<xsl:value-of select="name()"/>}, id={<xsl:value-of
                select="@id"/>}</xsl:message>
        <xsl:call-template name="move-elem-out">
            <xsl:with-param name="elem-to-move-name">epigraph</xsl:with-param>
            <xsl:with-param name="split-into-elem-name">dd</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="dtb:item/dtb:dd[dtb:annotation]">
        <xsl:message>Found unsuitable parent: {<xsl:value-of select="name()"/>}, id={<xsl:value-of
            select="@id"/>}</xsl:message>
        <xsl:call-template name="move-elem-out">
            <xsl:with-param name="elem-to-move-name">annotation</xsl:with-param>
            <xsl:with-param name="split-into-elem-name">dd</xsl:with-param>
        </xsl:call-template>
    </xsl:template>


</xsl:stylesheet>
