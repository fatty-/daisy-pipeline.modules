<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" xmlns:pxi="http://www.daisy.org/ns/pipeline/xproc/internal" xmlns:html="http://www.w3.org/1999/xhtml"
    xmlns:xd="http://www.daisy.org/ns/pipeline/doc" xmlns:cx="http://xmlcalabash.com/ns/extensions" type="pxi:daisy202-to-epub3-resolve-links"
    name="resolve-links" version="1.0">

    <p:documentation xd:target="parent">
        <xd:short>De-references links in content documents.</xd:short>
        <xd:detail>In DAISY 2.02, links point to other locations in the book via the SMIL files. For instance, a link in ncc.html might point to
            content.smil#fragment, and the SMIL clip at content.smil#fragment might point to content.html#id. This step would change the original link from
            content.smil#fragment to content.html#id.</xd:detail>
    </p:documentation>

    <p:input port="source" primary="true">
        <p:documentation>
            <xd:short>A DAISY 2.02 content document.</xd:short>
            <xd:example>
                <html xmlns="http://www.w3.org/1999/xhtml" xml:base="file:/home/user/daisy202/ncc.html">
                    <head>...</head>
                    <body> ... <a href="a.smil#fragment"/> ... </body>
                </html>
            </xd:example>
        </p:documentation>
    </p:input>
    <p:input port="resolve-links-mapping">
        <p:documentation>
            <xd:short>A map of all the links in the SMIL files.</xd:short>
            <xd:example>
                <di:mapping xmlns:di="http://www.daisy.org/ns/pipeline/tmp">
                    <di:smil xml:base="file:/home/user/a.smil">
                        <di:text par-id="fragment1" text-id="frg1" src="a.html#txt1"/>
                        <di:text par-id="fragment2" text-id="frg2" src="a.html#txt2"/>
                    </di:smil>
                    <di:smil xml:base="file:/home/user/b.smil">
                        <di:text par-id="fragment1" text-id="frg1" src="b.html#txt1"/>
                        <di:text par-id="fragment2" text-id="frg2" src="b.html#txt2"/>
                    </di:smil>
                </di:mapping>
            </xd:example>
        </p:documentation>
    </p:input>
    <p:output port="result">
        <p:documentation>
            <xd:short>The resulting DAISY 2.02 content document.</xd:short>
            <xd:example>
                <html xmlns="http://www.w3.org/1999/xhtml" xml:base="file:/home/user/daisy202/ncc.html">
                    <head>...</head>
                    <body> ... <a href="a.html#id"/> ... </body>
                </html>
            </xd:example>
        </p:documentation>
    </p:output>

    <p:import href="http://xmlcalabash.com/extension/steps/library-1.0.xpl">
        <p:documentation>Calabash extension steps.</p:documentation>
    </p:import>

    <p:variable name="content-base" select="/*/@xml:base"/>

    <p:documentation>For each 'a'-link</p:documentation>
    <p:viewport match="//html:a">
        <p:variable name="original-uri" select="resolve-uri(tokenize(/*/@href,'#')[1],$content-base)"/>
        <p:variable name="original-fragment" select="if (contains(/*/@href,'#')) then tokenize(/*/@href,'#')[last()] else ''"/>
        <p:variable name="result" select="/*/*[@xml:base=$original-uri]/*[(@par-id,@text-id)=$original-fragment]/@src">
            <p:pipe port="resolve-links-mapping" step="resolve-links"/>
        </p:variable>

        <p:choose>
            <p:when test="$result != ''">
                <p:xslt>
                    <p:with-param name="from" select="$content-base"/>
                    <p:with-param name="to" select="$result"/>
                    <p:input port="stylesheet">
                        <p:inline>
                            <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pf="http://www.daisy.org/ns/pipeline/functions" version="2.0">
                                <xsl:import href="http://www.daisy.org/pipeline/modules/file-utils/xslt/uri-functions.xsl"/>
                                <xsl:param name="from" required="yes"/>
                                <xsl:param name="to" required="yes"/>
                                <xsl:template match="/*">
                                    <xsl:copy>
                                        <xsl:copy-of select="@*"/>
                                        <xsl:attribute name="href" select="pf:relativize-uri($to,$from)"/>
                                        <xsl:copy-of select="node()"/>
                                    </xsl:copy>
                                </xsl:template>
                            </xsl:stylesheet>
                        </p:inline>
                    </p:input>
                </p:xslt>
            </p:when>
            <p:otherwise>
                <p:identity/>
            </p:otherwise>
        </p:choose>
        <p:delete match="/*/@xml:base"/>
    </p:viewport>
    <cx:message>
        <p:with-option name="message" select="concat('dereferenced all links in ',$content-base)"/>
    </cx:message>
    <p:xslt>
        <p:input port="parameters">
            <p:empty/>
        </p:input>
        <p:input port="stylesheet">
            <p:document href="nav-unwrap-untitled-toc-levels.xsl"/>
        </p:input>
    </p:xslt>
    <p:xslt>
        <p:input port="parameters">
            <p:empty/>
        </p:input>
        <p:input port="stylesheet">
            <p:document href="resolve-links.xsl"/>
        </p:input>
    </p:xslt>

</p:declare-step>
