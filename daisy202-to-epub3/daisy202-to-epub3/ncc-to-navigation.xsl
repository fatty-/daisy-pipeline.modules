<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:epub="http://www.idpf.org/2011/epub" version="2.0" exclude-result-prefixes="#all">

    <xsl:output indent="yes" include-content-type="no"/>

    <xsl:param name="pub-id" required="yes"/>

    <xsl:template match="/*">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="profile" select="'http://www.idpf.org/epub/30/profile/content/'"/>
            <xsl:apply-templates select="@*[not(name()='xml:base')]|*"/>
        </html>
    </xsl:template>

    <!--xsl:template match="@*|node()"-->
        <!--xsl:copy-->
        <!--xsl:value-of select="concat('ignored ',name(),' | ')"/>
        <xsl:apply-templates select="@*|node()"/-->
        <!--/xsl:copy-->
    <!--/xsl:template-->

    <xsl:template match="*[local-name()='head']">
        <xsl:copy>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <xsl:copy-of select="@*|*[local-name()='title']"/>
            <xsl:if test="$pub-id">
                <meta name="dc:identifier" id="pub-id">
                    <xsl:value-of select="$pub-id"/>
                </meta>
            </xsl:if>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="*[local-name()='body']">
        <body>
            <nav epub:type="toc" id="toc">
                <ol>
                    <xsl:call-template name="make-toc-level">
                        <xsl:with-param name="level" select="'h1'"/>
                        <xsl:with-param name="group" select="child::*"/>
                    </xsl:call-template>
                </ol>
            </nav>
            <xsl:if test="child::*[local-name()='span']">
                <nav epub:type="page-list" style="display:none">
                    <ol>
                        <xsl:for-each select="child::*[local-name()='span']">
                            <li>
                                <a href="{child::*[local-name()='a'][1]/@href}">
                                    <xsl:if test="@id">
                                        <xsl:attribute name="id" select="@id"/>
                                    </xsl:if>
                                    <xsl:value-of select="child::*[local-name()='a'][1]"/>
                                </a>
                            </li>
                        </xsl:for-each>
                    </ol>
                </nav>
            </xsl:if>
            <xsl:if test="child::*[local-name()='div']">
                <nav epub:type="landmarks">
                    <ol>
                        <xsl:for-each select="child::*[local-name()='div']">
                            <li>
                                <a href="{child::*[local-name()='a'][1]/@href}">
                                    <xsl:if test="@id">
                                        <xsl:attribute name="id" select="@id"/>
                                    </xsl:if>
                                    <xsl:value-of select="child::*[local-name()='a'][1]"/>
                                </a>
                            </li>
                        </xsl:for-each>
                    </ol>
                </nav>
            </xsl:if>
        </body>
    </xsl:template>

    <xsl:template name="make-toc-level">
        <xsl:param name="level" required="yes"/>
        <xsl:param name="skipFirst" select="false()"/>
        <xsl:param name="group" required="yes"/>
        <xsl:if test="$level">
            <xsl:for-each-group select="$group" group-starting-with="*[local-name()=$level]">
                <xsl:choose>
                    <xsl:when test="current-group()[1]/local-name()=$level">
                        <li>
                            <xsl:apply-templates select="current-group()[1]"/>
                            <xsl:if test="current-group()[position()>1]">
                                <ol>
                                    <xsl:call-template name="make-toc-level">
                                        <xsl:with-param name="skipFirst" select="true()"/>
                                        <xsl:with-param name="level"
                                            select="if ($level='h1') then 'h2' else if ($level='h2') then 'h3' else if ($level='h3') then 'h4' else if ($level='h4') then 'h5' else 'h6'"/>
                                        <xsl:with-param name="group" select="current-group()[position()>1]"/>
                                    </xsl:call-template>
                                </ol>
                            </xsl:if>
                        </li>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="make-toc-level">
                            <xsl:with-param name="level"
                                select="if ($level='h1') then 'h2' else if ($level='h2') then 'h3' else if ($level='h3') then 'h4' else if ($level='h4') then 'h5' else if ($level='h5') then 'h6' else false()"/>
                            <xsl:with-param name="group" select="current-group()"/>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each-group>
        </xsl:if>
    </xsl:template>

    <xsl:template match="*[local-name()='h1' or local-name()='h2' or local-name()='h3' or local-name()='h4' or local-name()='h5' or local-name()='h6']">
        <xsl:variable name="link-href" select="tokenize(child::*[local-name()='a'][1]/@href,'#')[1]"/>
        <xsl:variable name="link-id" select="if (contains(child::*[local-name()='a'][1]/@href,'#')) then tokenize(child::*[local-name()='a'][1]/@href,'#')[last()] else ''"/>
        <xsl:variable name="self-id" select="ancestor-or-self::*/@id"/>
        <xsl:choose>
            <xsl:when test="not($link-href='') and $link-href='navigation.xhtml' and not($link-id='') and $self-id=$link-id">
                <!-- is link to self; remove it -->
                <span>
                    <xsl:copy-of select="@id"/>
                    <xsl:value-of select="child::*[local-name()='a'][1]"/>
                </span>
            </xsl:when>
            <xsl:otherwise>
                <a href="{child::*[local-name()='a'][1]/@href}">
                    <xsl:copy-of select="@id"/>
                    <xsl:value-of select="child::*[local-name()='a'][1]"/>
                </a>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
