<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" xmlns:px="http://www.daisy.org/ns/pipeline/xproc" xmlns:cx="http://xmlcalabash.com/ns/extensions"
    xmlns:d="http://www.daisy.org/ns/pipeline/data" type="px:zedai-to-html-convert"
    name="main" exclude-inline-prefixes="#all" version="1.0">

    <p:documentation>
        Transforms a ZedAI (DAISY 4 XML) document into an EPUB 3 publication.
    </p:documentation>

    <p:input port="fileset.in" primary="true"/>
    <p:input port="in-memory.in" sequence="true"/>

    <p:output port="fileset.out" primary="true">
        <p:pipe port="result" step="fileset.result"/>
    </p:output>
    <p:output port="in-memory.out" sequence="true">
        <p:pipe step="zedai-to-html" port="html-files"/>
    </p:output>

    <p:option name="output-dir" required="true"/>

    <p:import href="http://www.daisy.org/pipeline/modules/fileset-utils/xproc/fileset-library.xpl"/>
    <p:import href="http://xmlcalabash.com/extension/steps/library-1.0.xpl"/>

    <!--=========================================================================-->
    <!-- GET ZEDAI FROM FILESET                                                  -->
    <!--=========================================================================-->

    <p:documentation>Retreive the ZedAI document from the input fileset.</p:documentation>
    <p:group name="zedai-input">
        <p:output port="result" primary="true">
            <p:pipe port="result" step="zedai-input.for-each"/>
        </p:output>
        <p:variable name="fileset-base" select="/*/@xml:base"/>
        <p:for-each name="zedai-input.for-each">
            <p:iteration-source select="/*/*"/>
            <p:output port="result" sequence="true"/>
            <p:choose>
                <p:when test="/*/@media-type = 'application/z3998-auth+xml'">
                    <p:variable name="zedai-base" select="resolve-uri(/*/@href,$fileset-base)"/>
                    <p:split-sequence name="zedai-input.for-each.split">
                        <p:input port="source">
                            <p:pipe port="in-memory.in" step="main"/>
                        </p:input>
                        <p:with-option name="test" select="concat('/*/@xml:base = &quot;',$zedai-base,'&quot;')"/>
                    </p:split-sequence>
                    <p:count/>
                    <p:choose>
                        <p:when test=". &gt; 0">
                            <p:identity>
                                <p:input port="source">
                                    <p:pipe port="matched" step="zedai-input.for-each.split"/>
                                </p:input>
                            </p:identity>
                        </p:when>
                        <p:otherwise>
                            <p:error xmlns:err="http://www.w3.org/ns/xproc-error" code="PEZE00">
                                <!-- TODO: describe the error on the wiki and insert correct error code -->
                                <p:input port="source">
                                    <p:inline>
                                        <message>Found ZedAI document in fileset but not in memory. Please load the ZedAI document into memory before converting it.</message>
                                    </p:inline>
                                </p:input>
                            </p:error>
                        </p:otherwise>
                    </p:choose>
                    <p:delete match="/*/@xml:base"/>
                </p:when>
                <p:otherwise>
                    <p:identity>
                        <p:input port="source">
                            <p:empty/>
                        </p:input>
                    </p:identity>
                </p:otherwise>
            </p:choose>
        </p:for-each>
        <p:count/>
        <p:choose>
            <p:when test=". = 0">
                <p:error xmlns:err="http://www.w3.org/ns/xproc-error" code="PEZE00">
                    <!-- TODO: describe the error on the wiki and insert correct error code -->
                    <p:input port="source">
                        <p:inline>
                            <message>No XML documents with the ZedAI media type ('application/z3998-auth+xml') found in the fileset.</message>
                        </p:inline>
                    </p:input>
                </p:error>
                <p:sink/>
            </p:when>
            <p:when test=". &gt; 1">
                <p:error xmlns:err="http://www.w3.org/ns/xproc-error" code="PEZE00">
                    <!-- TODO: describe the error on the wiki and insert correct error code -->
                    <p:input port="source">
                        <p:inline>
                            <message>More than one XML document with the ZedAI media type ('application/z3998-auth+xml') found in the fileset; there can only
                                be one ZedAI document.</message>
                        </p:inline>
                    </p:input>
                </p:error>
                <p:sink/>
            </p:when>
            <p:otherwise>
                <p:sink/>
            </p:otherwise>
        </p:choose>
    </p:group>

    <!--=========================================================================-->
    <!-- CONVERT TO XHTML                                                        -->
    <!--=========================================================================-->

    <p:documentation>Convert the ZedAI Document into several XHTML Documents</p:documentation>
    <p:group name="zedai-to-html">
        <p:output port="result" primary="true" sequence="true"/>
        <p:output port="html-files" sequence="true">
            <p:pipe port="html-files" step="zedai-to-html.iterate"/>
        </p:output>
        <p:variable name="zedai-basename"
            select="replace(replace(//*[@media-type='application/z3998-auth+xml']/@href,'^.+/([^/]+)$','$1'),'^(.+)\.[^\.]+$','$1')">
            <p:pipe port="fileset.in" step="main"/>
        </p:variable>
        <p:variable name="result-basename" select="concat($output-dir,$zedai-basename,'.html')"/>
        <p:xslt name="zedai-to-html.html-single">
            <!--<p:log port="result" href="file:/tmp/out/log-html-single.xml"></p:log>-->
            <p:input port="source">
                <p:pipe port="result" step="zedai-input"/>
            </p:input>
            <p:input port="stylesheet">
                <p:document href="http://www.daisy.org/pipeline/modules/zedai-to-html/xslt/zedai-to-html.xsl"/>
            </p:input>
            <p:input port="parameters">
                <p:empty/>
            </p:input>
        </p:xslt>
        <p:add-attribute attribute-name="xml:base" match="/*">
            <p:with-option name="attribute-value" select="$result-basename"/>
        </p:add-attribute>
        <p:for-each name="zedai-to-html.iterate">
            <p:output port="fileset" primary="true"/>
            <p:output port="html-files" sequence="true">
                <p:pipe port="result" step="zedai-to-html.iterate.html"/>
            </p:output>
            <p:variable name="result-uri" select="base-uri(/*)"/>
            <p:add-xml-base name="zedai-to-html.iterate.html"/>
            <px:fileset-create>
                <p:with-option name="base" select="$output-dir"/>
            </px:fileset-create>
            <px:fileset-add-entry media-type="application/xhtml+xml">
                <p:with-option name="href" select="$result-uri"/>
            </px:fileset-add-entry>
        </p:for-each>
    </p:group>
    
    <!--=========================================================================-->
    <!-- CONSOLIDATE THE OUTPUT FILESET                                          -->
    <!--=========================================================================-->

    <!--Construct the resources fileset-->
    <p:identity>
        <p:input port="source">
            <p:pipe step="main" port="fileset.in"/>
        </p:input>
    </p:identity>
    <p:group name="resources">
        <p:output port="result"/>
        <p:variable name="fileset-base" select="/*/@xml:base"/>
        <p:variable name="zedai-uri" select="resolve-uri(//d:file[@media-type='application/z3998-auth+xml']/@href,$fileset-base)"/>
        <p:delete match="d:file[@media-type='application/z3998-auth+xml']"/>
        <p:viewport match="/*/*">
            <p:documentation>Make sure that the files in the fileset is relative to the ZedAI file.</p:documentation>
            <p:variable name="original-uri" select="(/*/@original-href, resolve-uri(/*/@href,$fileset-base))[1]"/>
            <p:xslt>
                <p:with-param name="to" select="resolve-uri(/*/@href,$fileset-base)"/>
                <p:with-param name="from" select="$zedai-uri"/>
                <p:input port="stylesheet">
                    <p:inline>
                        <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pf="http://www.daisy.org/ns/pipeline/functions" version="2.0">
                            <xsl:import href="http://www.daisy.org/pipeline/modules/file-utils/xslt/uri-functions.xsl"/>
                            <xsl:param name="to" required="yes"/>
                            <xsl:param name="from" required="yes"/>
                            <xsl:template match="/*">
                                <xsl:copy>
                                    <xsl:copy-of select="@*"/>
                                    <xsl:attribute name="href" select="pf:file-resolve-relative-uri($to,$from)"/>
                                </xsl:copy>
                            </xsl:template>
                        </xsl:stylesheet>
                    </p:inline>
                </p:input>
            </p:xslt>
            <p:identity/>
        </p:viewport>
        <p:add-attribute match="/*" attribute-name="xml:base">
            <p:with-option name="attribute-value" select="$output-dir"/>
        </p:add-attribute>
        <!-- TODO: remove resources from fileset that are not referenced from any of the in-memory files -->
    </p:group>
    
    <px:fileset-join name="package-doc.join-filesets">
        <p:input port="source">
            <p:pipe port="result" step="zedai-to-html"/>
            <p:pipe port="result" step="resources"/>
        </p:input>
    </px:fileset-join>
    
    <p:group name="fileset.result">
        <p:output port="result"/>
        <p:variable name="fileset-base" select="/*/@xml:base"/>
        <p:identity name="fileset.dirty"/>
        <p:wrap-sequence wrapper="wrapper">
            <p:input port="source">
                <p:pipe step="zedai-to-html" port="html-files"/>
            </p:input>
        </p:wrap-sequence>
        <p:delete match="/*/*/*" name="wrapped-in-memory"/>
        <p:identity>
            <p:input port="source">
                <p:pipe port="result" step="fileset.dirty"/>
            </p:input>
        </p:identity>
        <p:viewport match="//d:file">
            <p:variable name="file-href" select="resolve-uri(/*/@href,$fileset-base)"/>
            <p:variable name="file-original" select="if (/*/@original-href) then resolve-uri(/*/@original-href) else ''"/>
            <p:choose>
                <p:xpath-context>
                    <p:pipe port="result" step="wrapped-in-memory"/>
                </p:xpath-context>
                <p:when test="not($file-original) and not(/*/*[resolve-uri(@xml:base) = $file-href])">
                    <!-- Fileset contains file reference to a file that is neither stored on disk nor in memory; discard it -->
                    <p:sink/>
                    <p:identity>
                        <p:input port="source">
                            <p:empty/>
                        </p:input>
                    </p:identity>
                    <cx:message>
                        <p:with-option name="message" select="concat('skipping ',$file-href)"/>
                    </cx:message>
                </p:when>
                <p:otherwise>
                    <!-- File refers to a document on disk or in memory; keep it -->
                    <p:identity/>
                </p:otherwise>
            </p:choose>
        </p:viewport>
    </p:group>

</p:declare-step>
