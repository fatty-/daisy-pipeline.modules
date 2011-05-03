<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:dtb="http://www.daisy.org/z3986/2005/dtbook/"
    exclude-result-prefixes="dtb" version="2.0"
    xmlns:f="http://www.daisy.org/ns/pipeline/internal-function">
    
    <!--
        Move target element out and split the element(s) that used to contain it.
        Input:
            doc: The document root
            valid-parents: elements that are allowed to be parents for the target element (a tokenized list of local name values)
            target-element: the element that will be moved (local name value)
        
    -->
    
    <xsl:import href="moveout-template.xsl"/>
    
    <xsl:output indent="yes" method="xml"/>
    
    <!-- recursive -->
    <xsl:template name="test-and-move">
        
        <xsl:param name="target-element" tunnel="yes"/>
        <xsl:param name="valid-parents" tunnel="yes"/>
        <xsl:param name="doc"/>
        
        <xsl:message>moveout-generic.xsl: Recursively testing validity and possibly moving out an element...</xsl:message>
        
        <xsl:choose>
            
            <xsl:when test="f:test-valid($doc, $target-element, $valid-parents) = true()">
                <xsl:message>Document is valid with regards to the given target element.</xsl:message>
                <xsl:copy-of select="$doc"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:message>Document is invalid.  An element must be moved out of its current parent.</xsl:message>
                <xsl:variable name="result">
                    <!-- TODO: sometimes the first option doesn't work, although it is better for utfx testing.  See dtbook-tests/dtbook-code.xml. -->
                    <!--<xsl:apply-templates select="$doc/*[1]"/>-->
                    <xsl:apply-templates select="$doc"/>
                </xsl:variable>
                
                <!-- the recursive call -->
                <xsl:call-template name="test-and-move">
                    <xsl:with-param name="doc" select="$result//dtb:dtbook[1]"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:function name="f:test-valid">
        <!-- TODO: is this the correct type? -->
        <xsl:param name="elem" as="element()"/>
        <xsl:param name="target-element"/>
        <xsl:param name="valid-parents"/>
        
        <xsl:message>moveout-generic.xsl: Testing validity...</xsl:message>
        
        <!-- select all target element descendants whose parents are not in the list of valid parent names -->
        <xsl:variable name="invalid-target-elements"
            select="$elem/descendant::*[local-name() = $target-element][not(local-name(parent::node()) = $valid-parents)]"/>
        
        
        <!-- test if there is a target element whose parent is not in the set of valid parents -->
        <xsl:value-of select="empty($invalid-target-elements)"/>
    </xsl:function>
    
    
    <xsl:template match="@*">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <!-- match invalid element parents that actually have an invalid element child -->
    <xsl:template match="node()">
        <xsl:param name="valid-parents" tunnel="yes"/>
        <xsl:param name="target-element" tunnel="yes"/>
        
        <xsl:choose>
            <xsl:when
                test="not(local-name() = $valid-parents) and (child::*/local-name() = $target-element)">
                <xsl:message>Found unsuitable parent: name = <xsl:value-of select="local-name()"/> id = <xsl:value-of select="@id"/></xsl:message>
                <xsl:call-template name="process-invalid-target-element-parent"/>
            </xsl:when>
            <xsl:otherwise>
                <!-- identity template -->
                <xsl:copy>
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- this template handles an element that has one or more target element child -->
    <xsl:template name="process-invalid-target-element-parent">
        <xsl:param name="valid-parents" tunnel="yes"/>
        <xsl:param name="target-element" tunnel="yes"/>
        
        <xsl:variable name="cannot-split" select="tokenize('h1,h2,h3,h4,h5,h6,hd', ',')"/>
        
        <xsl:choose>
            <xsl:when test="not(local-name() = $valid-parents)">
                <xsl:choose>
                    <!-- when this is an element that cannot be split into duplicates of itself -->
                    <xsl:when test="local-name() = $cannot-split">
                        <xsl:call-template name="move-elem-out">
                            <xsl:with-param name="elem-name-to-move" select="$target-element"/>
                            <xsl:with-param name="split-into-elem" select="'p'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="move-elem-out">
                            <xsl:with-param name="elem-name-to-move" select="$target-element"/>
                            <xsl:with-param name="split-into-elem" select="local-name()"/>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>
