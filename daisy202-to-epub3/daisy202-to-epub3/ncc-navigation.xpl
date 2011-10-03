<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" xmlns:html="http://www.w3.org/1999/xhtml" xmlns:c="http://www.w3.org/ns/xproc-step" type="pxi:daisy202-to-epub3-ncc-navigation"
    name="ncc-navigation" xmlns:pxi="http://www.daisy.org/ns/pipeline/xproc/internal" xmlns:xd="http://www.daisy.org/ns/pipeline/doc" version="1.0">
    
    <p:documentation xd:target="parent">
        <xd:short>Transform the DAISY 2.02 NCC into a EPUB 3 Navigation Document.</xd:short>
    </p:documentation>
    
    <p:input port="ncc">
        <p:documentation>
            <xd:short>The DAISY 2.02 NCC</xd:short>
            <xd:example>
                <html xmlns="http://www.w3.org/1999/xhtml" xml:base="file:/home/user/daisy202/ncc.html">...</html>
            </xd:example>
        </p:documentation>
    </p:input>
    <p:input port="daisy-smil" sequence="true">
        <p:documentation>
            <xd:short>The DAISY 2.02 SMIL-files.</xd:short>
            <xd:example xmlns="">
                <smil xml:base="file:/home/user/daisy202/a.smil">...</smil>
                <smil xml:base="file:/home/user/daisy202/b.smil">...</smil>
                <smil xml:base="file:/home/user/daisy202/c.smil">...</smil>
            </xd:example>
        </p:documentation>
    </p:input>

    <p:output port="result" primary="false">
        <p:documentation>
            <xd:short>An EPUB3 Navigation Document with contents based purely on the DAISY 2.02 NCC.</xd:short>
            <xd:example>
                <html xmlns="http://www.w3.org/1999/xhtml" xml:base="file:/home/user/epub3/epub/Publication/navigation.xhtml" original-base="file:/home/user/daisy202/ncc.html">...</html>
            </xd:example>
        </p:documentation>
        <p:pipe port="result" step="ncc-navigation.result"/>
    </p:output>

    <p:option name="publication-dir" required="true">
        <p:documentation>
            <xd:short>URI to the EPUB3 Publication directory.</xd:short>
            <xd:example>file:/home/user/epub3/epub/Publication/</xd:example>
        </p:documentation>
    </p:option>
    <p:option name="content-dir" required="true">
        <p:documentation>
            <xd:short>URI to the EPUB3 Content directory.</xd:short>
            <xd:example>file:/home/user/epub3/epub/Publication/Content/</xd:example>
        </p:documentation>
    </p:option>

    <p:import href="resolve-links.xpl">
        <p:documentation>De-references links to SMIL-files.</p:documentation>
    </p:import>

    <p:variable name="subdir" select="substring-after($content-dir,$publication-dir)"/>
    <pxi:daisy202-to-epub3-resolve-links>
        <p:input port="source">
            <p:pipe port="ncc" step="ncc-navigation"/>
        </p:input>
        <p:input port="daisy-smil">
            <p:pipe port="daisy-smil" step="ncc-navigation"/>
        </p:input>
    </pxi:daisy202-to-epub3-resolve-links>
    <p:identity name="ncc-navigation.no-navs"/>
    <p:sink/>
    <p:xslt name="ncc-navigation.toc">
        <p:input port="parameters">
            <p:empty/>
        </p:input>
        <p:input port="source">
            <p:pipe port="result" step="ncc-navigation.no-navs"/>
        </p:input>
        <p:input port="stylesheet">
            <p:document href="ncc-to-nav-toc.xsl"/>
        </p:input>
    </p:xslt>
    <p:sink/>
    <p:xslt>
        <p:input port="parameters">
            <p:empty/>
        </p:input>
        <p:input port="source">
            <p:pipe port="result" step="ncc-navigation.no-navs"/>
        </p:input>
        <p:input port="stylesheet">
            <p:document href="ncc-to-nav-page-list.xsl"/>
        </p:input>
    </p:xslt>
    <p:choose>
        <p:when test="count(/*/*)=0">
            <p:identity>
                <p:input port="source">
                    <p:empty/>
                </p:input>
            </p:identity>
        </p:when>
        <p:otherwise>
            <p:identity/>
        </p:otherwise>
    </p:choose>
    <p:identity name="ncc-navigation.page-list"/>
    <p:sink/>
    <p:xslt>
        <p:input port="parameters">
            <p:empty/>
        </p:input>
        <p:input port="source">
            <p:pipe port="result" step="ncc-navigation.no-navs"/>
        </p:input>
        <p:input port="stylesheet">
            <p:document href="ncc-to-nav-landmarks.xsl"/>
        </p:input>
    </p:xslt>
    <p:choose>
        <p:when test="count(/*/*)=0">
            <p:identity>
                <p:input port="source">
                    <p:empty/>
                </p:input>
            </p:identity>
        </p:when>
        <p:otherwise>
            <p:identity/>
        </p:otherwise>
    </p:choose>
    <p:identity name="ncc-navigation.landmarks"/>
    <p:sink/>
    <p:delete match="html:body/*">
        <p:input port="source">
            <p:pipe port="result" step="ncc-navigation.no-navs"/>
        </p:input>
    </p:delete>
    <p:insert match="html:body" position="last-child">
        <p:input port="insertion">
            <p:pipe port="result" step="ncc-navigation.toc"/>
            <p:pipe port="result" step="ncc-navigation.page-list"/>
            <p:pipe port="result" step="ncc-navigation.landmarks"/>
        </p:input>
    </p:insert>
    <p:identity name="ncc-navigation.original-links"/>
    <p:viewport match="html:a[@href and not(matches(@href,'^[^/]+:'))]">
        <p:xslt>
            <p:with-param name="from" select="$publication-dir"/>
            <p:with-param name="to"
                select="concat(if (starts-with(/*/@href,'#'))
                                    then concat($publication-dir,'navigation.xhtml')
                                    else concat($content-dir,replace(tokenize(/*/@href,'#')[1],'^(.*)\.html$','$1.xhtml')),
                               if (contains(/*/@href,'#')) then concat('#',tokenize(/*/@href,'#')[last()]) else '')"/>
            <p:input port="stylesheet">
                <p:document href="ncc-navigation.make-new-hrefs.xsl"/>
            </p:input>
        </p:xslt>
    </p:viewport>
    <p:add-attribute match="/*" attribute-name="original-base">
        <p:with-option name="attribute-value" select="/*/@xml:base"/>
    </p:add-attribute>
    <p:add-attribute match="/*" attribute-name="xml:base">
        <p:with-option name="attribute-value" select="concat($publication-dir,'navigation.xhtml')"/>
    </p:add-attribute>
    <p:identity name="ncc-navigation.result"/>
    <p:sink/>

</p:declare-step>
