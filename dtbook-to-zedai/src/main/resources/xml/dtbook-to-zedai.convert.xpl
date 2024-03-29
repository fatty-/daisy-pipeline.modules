<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step version="1.0" name="dtbook-to-zedai.convert" type="px:dtbook-to-zedai-convert"
    xmlns:p="http://www.w3.org/ns/xproc" xmlns:c="http://www.w3.org/ns/xproc-step"
    xmlns:cx="http://xmlcalabash.com/ns/extensions"
    xmlns:cxo="http://xmlcalabash.com/ns/extensions/osutils"
    xmlns:px="http://www.daisy.org/ns/pipeline/xproc"
    xmlns:pxi="http://www.daisy.org/ns/pipeline/xproc/internal"
    xmlns:tmp="http://www.daisy.org/ns/pipeline/tmp"
    xmlns:z="http://www.daisy.org/ns/z3998/authoring/"
    xmlns:d="http://www.daisy.org/ns/pipeline/data"
    exclude-inline-prefixes="#all">

    <p:documentation>
        Transforms DTBook XML into ZedAI XML.
    </p:documentation>

    <p:input port="fileset.in" primary="true">
        <p:documentation>
            A fileset containing references to all the DTBook files and any resources they reference (images etc.). 
            The xml:base is also set with an absolute URI for each file, and is intended to represent the "original file", while the href can change during
            conversions to reflect the path and filename of the resource in the output fileset.
        </p:documentation>
    </p:input>

    <p:input port="in-memory.in" sequence="true">
        <p:documentation xmlns="http://www.w3.org/1999/xhtml">
            One or more DTBook documents to be transformed. In the case of multiple documents, a merge will be performed.
            While all resources are referenced in the fileset on the `fileset` output port, the `in-memory`-port can contain pre-loaded documents so that they won't
            have to be loaded from disk. This means that the input documents does not have to be stored to disk - 
            they could have been generated by a preceding conversion, allowing for easy chaining of scripts.
        </p:documentation>
    </p:input>

    <p:output port="fileset.out" primary="true">
        <p:documentation>
            A fileset containing references to the DTBook file and any resources it references
            (images etc.). For each file that is not stored in memory, the xml:base is set with
            an absolute URI pointing to the location on disk where it is stored. This lets the
            href reflect the path and filename of the resulting resource without having to store
            it. This is useful for chaining conversions.
        </p:documentation>
        <p:pipe port="result" step="result.fileset"/>
    </p:output>

    <p:output port="in-memory.out" sequence="true">
        <p:documentation>The ZedAI and MODS metadata documents.</p:documentation>
        <p:pipe port="result" step="result.in-memory"/>
    </p:output>

    <p:option name="opt-output-dir" required="true" px:dir="output" px:type="anyDirURI">
        <p:documentation>
            The directory to store the generated files in.
        </p:documentation>
    </p:option>

    <p:option name="opt-zedai-filename" required="false" px:dir="output" px:type="string"
        select="''">
        <p:documentation>
            Filename for the generated ZedAI file
        </p:documentation>
    </p:option>
    <p:option name="opt-mods-filename" required="false" px:dir="output" px:type="string" select="''">
        <p:documentation>
            Filename for the generated MODS file
        </p:documentation>
    </p:option>
    <p:option name="opt-css-filename" required="false" px:dir="output" px:type="string" select="''">
        <p:documentation>
            Filename for the generated CSS file
        </p:documentation>
    </p:option>
    <p:option name="opt-lang" required="false" px:dir="output" px:type="string" select="''">
        <p:documentation>
            Language code of the input document.
        </p:documentation>
    </p:option>
    <p:option name="opt-assert-valid" required="false" px:type="boolean" select="'true'">
        <p:documentation>
            Whether to stop processing and raise an error on validation issues.
        </p:documentation>
    </p:option>

    <p:import href="http://xmlcalabash.com/extension/steps/library-1.0.xpl">
        <p:documentation>
            Calabash extension steps.
        </p:documentation>
    </p:import>
    <p:import href="dtbook2005-3-to-zedai.xpl">
        <p:documentation>
            Converts DTBook 2005-3 to ZedAI
        </p:documentation>
    </p:import>

    <!-- for use with the pipeline framework -->
    <p:import href="http://www.daisy.org/pipeline/modules/metadata-utils/metadata-utils-library.xpl">
        <p:documentation>
            Collection of utilities for generating metadata.
        </p:documentation>
    </p:import>

    <p:import href="http://www.daisy.org/pipeline/modules/dtbook-utils/dtbook-utils-library.xpl">
        <p:documentation>
            Collection of utilities for merging and upgrading DTBook files.
        </p:documentation>
    </p:import>

    <p:import href="http://www.daisy.org/pipeline/modules/fileset-utils/xproc/fileset-library.xpl">
        <p:documentation>
            For manipulating filesets.
        </p:documentation>
    </p:import>

    <p:import href="http://www.daisy.org/pipeline/modules/mediatype-utils/mediatype.xpl">
        <p:documentation>
            For determining the media type of files.
        </p:documentation>
    </p:import>

    <p:import href="http://www.daisy.org/pipeline/modules/validation-utils/validation-utils-library.xpl">
        <p:documentation>
            Collection of utilities for validation and reporting.
        </p:documentation>
    </p:import>

    <p:variable name="output-dir"
        select="resolve-uri(
                    if (ends-with($opt-output-dir, '/')) then $opt-output-dir 
                                                         else concat($opt-output-dir, '/')
                )"/>

    <p:variable name="default-zedai-filename" select="'zedai.xml'"/>
    <p:variable name="default-mods-filename" select="'zedai-mods.xml'"/>
    <p:variable name="default-css-filename" select="'zedai-css.css'"/>

    <p:variable name="zedai-filename"
        select="if (string-length($opt-zedai-filename) > 0) 
                    then $opt-zedai-filename
                    else $default-zedai-filename"/>

    <p:variable name="mods-filename"
        select="if (string-length($opt-mods-filename) > 0) 
                    then $opt-mods-filename 
                    else $default-mods-filename"/>

    <p:variable name="css-filename"
        select="if (string-length($opt-css-filename) > 0)
                    then $opt-css-filename
                    else $default-css-filename"/>

    <p:variable name="zedai-file" select="concat($output-dir, $zedai-filename)"/>
    <p:variable name="mods-file" select="concat($output-dir, $mods-filename)"/>
    <p:variable name="css-file" select="concat($output-dir, $css-filename)"/>

    <cx:message>
        <p:with-option name="message" select="concat('ZedAI file name: ',$zedai-filename)"/>
    </cx:message>
    <cx:message>
        <p:with-option name="message" select="concat('MODS file name: ',$mods-filename)"/>
    </cx:message>
    <cx:message>
        <p:with-option name="message" select="concat('CSS file name: ',$css-filename)"/>
    </cx:message>

    <!-- =============================================================== -->
    <!-- LOAD INPUT DTBOOKS -->
    <!-- =============================================================== -->
    <p:group name="dtbook-input">
        <p:output port="result" primary="true" sequence="true">
            <p:pipe port="result" step="dtbook-input.for-each"/>
        </p:output>
        <p:variable name="fileset-base" select="base-uri(/*)"/>
        <p:for-each name="dtbook-input.for-each">
            <p:iteration-source select="/*/*"/>
            <p:output port="result" sequence="true"/>
            <p:choose>
                <p:when test="/*/@media-type = 'application/x-dtbook+xml'">
                    <p:variable name="dtbook-base" select="resolve-uri(/*/@href,$fileset-base)"/>
                    <p:split-sequence name="dtbook-input.for-each.split">
                        <p:input port="source">
                            <p:pipe port="in-memory.in" step="dtbook-to-zedai.convert"/>
                        </p:input>
                        <p:with-option name="test"
                            select="concat('base-uri(/*) = &quot;',$dtbook-base,'&quot;')"/>
                    </p:split-sequence>
                    <p:count/>
                    <p:choose>
                        <p:when test=". &gt; 0">
                            <p:identity>
                                <p:input port="source">
                                    <p:pipe port="matched" step="dtbook-input.for-each.split"/>
                                </p:input>
                            </p:identity>
                        </p:when>
                        <p:otherwise>
                            <cx:message>
                                <p:with-option name="message"
                                    select="concat('Input DTBook not in memory, loading from disk: ', $dtbook-base)"
                                />
                            </cx:message>
                            <p:load>
                                <p:with-option name="href" select="$dtbook-base"/>
                            </p:load>
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
                <p:error xmlns:err="http://www.w3.org/ns/xproc-error" code="PEDZ00">
                    <!-- TODO: describe the error on the wiki and insert correct error code -->
                    <p:input port="source">
                        <p:inline>
                            <message>No XML documents with the DTBook media type
                                ('application/x-dtbook+xml') found in the fileset.</message>
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

    <!-- =============================================================== -->
    <!-- UPGRADE -->
    <!-- =============================================================== -->
    <p:documentation>Upgrade the DTBook document(s) to 2005-3</p:documentation>
    <p:for-each name="upgrade-dtbook">
        <p:output port="result"/>
        <px:upgrade-dtbook>
            <p:input port="parameters">
                <p:empty/>
            </p:input>
            <p:with-option name="assert-valid" select="$opt-assert-valid">
                <p:empty/>
            </p:with-option>
        </px:upgrade-dtbook>
    </p:for-each>

    <!-- =============================================================== -->
    <!-- MERGE -->
    <!-- =============================================================== -->
    <p:documentation>If there is more than one input DTBook document, merge them into a single
        document.</p:documentation>
    <p:count name="num-input-documents" limit="2"/>

    <p:choose name="choose-to-merge-dtbook-files">
        <p:when test=".//c:result[. > 1]">
            <p:output port="result"/>
            <px:merge-dtbook>
                <p:input port="parameters">
                    <p:empty/>
                </p:input>
                <p:input port="source">
                    <p:pipe port="result" step="upgrade-dtbook"/>
                </p:input>
                <p:with-option name="assert-valid" select="$opt-assert-valid"/>
            </px:merge-dtbook>
        </p:when>
        <p:otherwise>
            <p:output port="result"/>
            <p:identity>
                <p:input port="source">
                    <p:pipe port="result" step="upgrade-dtbook"/>
                </p:input>
            </p:identity>
        </p:otherwise>
    </p:choose>

    <!-- =============================================================== -->
    <!-- CREATE ZEDAI -->
    <!-- =============================================================== -->
    <p:documentation>Validate the DTBook input</p:documentation>
    <px:validate-with-relax-ng-and-report name="validate-dtbook">
        <p:input port="schema">
            <p:document href="./schema/dtbook-2005-3.rng"/>
        </p:input>
        <p:with-option name="assert-valid" select="$opt-assert-valid"/>
    </px:validate-with-relax-ng-and-report>

    <p:documentation>Transform to ZedAI</p:documentation>
    <pxi:dtbook2005-3-to-zedai name="transform-to-zedai"/>

    <!-- =============================================================== -->
    <!-- CSS -->
    <!-- =============================================================== -->
    <!-- This is a step here instead of being an external library, because the following properties are required for generating CSS:
        * elements are stable (no more moving them around and potentially changing their IDs)
        * CSS information is still available (via @tmp:* attributes)
    -->
    <p:documentation>Generate CSS from the visual property attributes in the ZedAI
        document</p:documentation>
    <p:xslt name="generate-css">
        <p:with-param name="css-file" select="$css-file"/>
        <p:input port="stylesheet">
            <p:inline>
                <!-- This is a wrapper to XML-ify the raw CSS output.  XProc will only accept it this way. -->
                <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
                    xmlns:tmp="http://www.daisy.org/ns/pipeline/tmp">
                    <xsl:import href="generate-css.xsl"/>
                    <xsl:param name="css-file" required="yes"/>
                    <xsl:template match="/">
                        <tmp:wrapper xml:base="{$css-file}">
                            <xsl:apply-imports/>
                        </tmp:wrapper>
                    </xsl:template>
                </xsl:stylesheet>
            </p:inline>
        </p:input>
    </p:xslt>

    <p:documentation>If CSS was generated, add a reference to the ZedAI document</p:documentation>
    <p:choose name="add-css-reference">
        <p:xpath-context>
            <p:pipe port="result" step="generate-css"/>
        </p:xpath-context>
        <p:when test="//tmp:wrapper/text()">
            <p:output port="result"/>

            <p:xslt name="add-css-reference-xslt">

                <p:input port="source">
                    <p:pipe step="transform-to-zedai" port="result"/>
                </p:input>
                <p:with-param name="css" select="$css-filename"/>
                <p:input port="stylesheet">
                    <p:inline>
                        <!-- This adds a processing instruction to reference the CSS file.  In the end, it's easier than using XProc's p:insert. -->
                        <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                            version="2.0">
                            <xsl:output indent="yes" method="xml"/>
                            <xsl:param name="css"/>

                            <xsl:template match="/">
                                <xsl:message>Adding CSS PI</xsl:message>
                                <xsl:processing-instruction name="xml-stylesheet">
                                        href="<xsl:value-of select="$css"/>" </xsl:processing-instruction>
                                <xsl:apply-templates/>
                            </xsl:template>
                            <!-- identity template -->
                            <xsl:template match="@*|node()">
                                <xsl:copy>
                                    <xsl:apply-templates select="@*|node()"/>
                                </xsl:copy>
                            </xsl:template>
                        </xsl:stylesheet>
                    </p:inline>
                </p:input>
            </p:xslt>
        </p:when>
        <p:otherwise>
            <p:output port="result"/>
            <p:identity name="not-adding-css-PI">
                <p:input port="source">
                    <p:pipe port="result" step="transform-to-zedai"/>
                </p:input>
            </p:identity>
        </p:otherwise>
    </p:choose>


    <!-- this step should remove the 'tmp' prefix (it is no longer needed after this point) but it doesn't! -->
    <p:documentation>Strip temporary attributes from the ZedAI
        document.</p:documentation>
    <p:xslt name="remove-css-attributes">
        <p:input port="parameters">
            <p:empty/>
        </p:input>
        <p:input port="stylesheet">
            <p:document href="remove-tmp-attributes.xsl"/>
        </p:input>
        <p:input port="source">
            <p:pipe step="add-css-reference" port="result"/>
        </p:input>
    </p:xslt>


    <!-- =============================================================== -->
    <!-- METADATA -->
    <!-- =============================================================== -->
    <p:documentation>Generate MODS metadata</p:documentation>
    <px:dtbook-to-mods-meta>
        <p:input port="parameters">
            <p:empty/>
        </p:input>
        <p:input port="source">
            <p:pipe step="validate-dtbook" port="result"/>
        </p:input>
        <p:with-option name="assert-valid" select="$opt-assert-valid"/>
    </px:dtbook-to-mods-meta>
    <p:add-attribute name="generate-mods-metadata" match="/*" attribute-name="xml:base">
        <p:with-option name="attribute-value" select="$mods-file"/>
    </p:add-attribute>

    <p:documentation>Generate ZedAI metadata</p:documentation>
    <px:dtbook-to-zedai-meta name="generate-zedai-metadata">
        <p:input port="parameters">
            <p:empty/>
        </p:input>
        <p:input port="source">
            <p:pipe step="validate-dtbook" port="result"/>
        </p:input>
        <p:with-option name="assert-valid" select="$opt-assert-valid"/>
    </px:dtbook-to-zedai-meta>

    <p:group name="insert-zedai-meta">
        <p:output port="result"/>
        <p:documentation>Insert metadata into the head of ZedAI</p:documentation>
        <p:insert match="/z:document/z:head" position="last-child">
            <p:input port="insertion">
                <p:pipe port="result" step="generate-zedai-metadata"/>
            </p:input>
            <p:input port="source">
                <p:pipe port="result" step="remove-css-attributes"/>
            </p:input>
        </p:insert>
        <p:documentation>Generate UUID for ZedAI identifier</p:documentation>
        <p:uuid match="/z:document/z:head//z:meta[@property='dc:identifier']/@content"/>
    </p:group>

    <p:documentation>Create a meta element for the MODS file reference</p:documentation>
    <p:string-replace match="//z:meta/@resource | //z:meta/@about" name="create-mods-ref-meta">
        <p:input port="source">
            <p:inline>
                <meta rel="z3998:meta-record" resource="@@"
                    xmlns="http://www.daisy.org/ns/z3998/authoring/">
                    <meta property="z3998:meta-record-type" about="@@" content="z3998:mods"
                        xmlns="http://www.daisy.org/ns/z3998/authoring/"/>
                    <meta property="z3998:meta-record-version" about="@@" content="3.3"
                        xmlns="http://www.daisy.org/ns/z3998/authoring/"/>
                </meta>
            </p:inline>
        </p:input>
        <p:with-option name="replace" select="concat('&quot;',$mods-filename,'&quot;')"/>
    </p:string-replace>

    <p:documentation>Insert the MODS file reference metadata into the head of
        ZedAI</p:documentation>
    <p:insert match="//z:head" position="first-child">
        <p:input port="source">
            <p:pipe port="result" step="insert-zedai-meta"/>
        </p:input>
        <p:input port="insertion">
            <p:pipe port="result" step="create-mods-ref-meta"/>
        </p:input>
    </p:insert>

    <!-- unwrap the meta list that was wrapped with tmp:wrapper -->
    <p:unwrap name="unwrap-meta-list" match="//z:head/tmp:wrapper"/>

    <!-- add xml:lang if not already present AND if specified by the opt-lang option -->
    <p:documentation>Add the xml:lang attribute</p:documentation>
    <p:choose>
        <p:when test="//z:document/@xml:lang">
            <p:identity/>
        </p:when>
        <p:otherwise>
            <p:choose>
                <p:when test="string-length($opt-lang) > 0">
                    <p:add-attribute match="//z:document">
                        <p:with-option name="attribute-name" select="'xml:lang'"/>
                        <p:with-option name="attribute-value" select="$opt-lang"/>
                    </p:add-attribute>
                </p:when>
                <p:otherwise>
                    <cx:message
                        message="WARNING: required xml:lang attribute not found, and no 'lang' option was passed to the converter."/>
                    <p:identity/>
                </p:otherwise>
            </p:choose>
        </p:otherwise>
    </p:choose>

    <!-- =============================================================== -->
    <!-- VALIDATE FINAL OUTPUT -->
    <!-- =============================================================== -->
    <p:documentation>Validate the final ZedAI output.</p:documentation>
    <cx:message message="Validating ZedAI"/>
    <px:validate-with-relax-ng-and-report name="validate-zedai" assert-valid="true">
        <p:input port="schema">
            <p:document href="./schema/z3998-book-1.0-latest/z3998-book.rng"/>
        </p:input>
    </px:validate-with-relax-ng-and-report>
    
    <cx:message message="Conversion complete."/>
    <p:sink/>


    <!-- =============================================================== -->
    <!-- COMPILE RESULT FILESET -->
    <!-- =============================================================== -->
    <p:group name="result.fileset">
        <p:output port="result"/>
        <p:variable name="dtbook-base"
            select="replace(//d:file[@media-type = 'application/x-dtbook+xml'][1]/resolve-uri(@href,base-uri(.)),'^(.*/)[^/]*$','$1')">
            <p:pipe port="fileset.in" step="dtbook-to-zedai.convert"/>
        </p:variable>
        
        <p:documentation>Add the ZedAI document to the fileset.</p:documentation>
        <px:fileset-create>
            <p:with-option name="base" select="$output-dir"/>
        </px:fileset-create>
        <px:fileset-add-entry name="result.fileset.zedai">
            <p:with-option name="href" select="$zedai-file"/>
            <p:with-option name="media-type" select="'application/z3998-auth+xml'"/>
        </px:fileset-add-entry>

        <p:documentation>Add all the auxiliary resources to the fileset.</p:documentation>
        <p:for-each name="result.fileset.resources">
            <p:output port="result" sequence="true"/>
            <p:iteration-source select="//*[@src]">
                <p:pipe step="validate-zedai" port="result"/>
            </p:iteration-source>
            <p:variable name="src" select="/*/@src"/>
            <p:variable name="dtbook-source-uri" select="resolve-uri($src, $dtbook-base)"/>
            <p:variable name="source-uri"
                select="(//d:file[resolve-uri(@href,base-uri(.)) = $dtbook-source-uri]/@original-href, $dtbook-source-uri)[1]">
                <p:pipe port="fileset.in" step="dtbook-to-zedai.convert"/>
            </p:variable>
            <p:variable name="result-uri" select="resolve-uri($src, $output-dir)"/>

            <cx:message>
                <p:with-option name="message" select="concat($source-uri,' --> ',$result-uri)"/>
            </cx:message>
            <p:sink/>

            <px:fileset-create>
                <p:with-option name="base" select="$output-dir"/>
            </px:fileset-create>
            <px:fileset-add-entry>
                <p:with-option name="href" select="resolve-uri($src,$zedai-file)"/>
            </px:fileset-add-entry>
            <p:add-attribute match="/*/*" attribute-name="original-href">
                <p:with-option name="attribute-value" select="$source-uri"/>
            </p:add-attribute>
        </p:for-each>

        <p:documentation>If CSS was generated: Add it to the fileset.</p:documentation>
        <p:choose name="result.fileset.generated-css">
            <p:xpath-context>
                <p:pipe port="result" step="generate-css"/>
            </p:xpath-context>

            <p:when test="//tmp:wrapper/text()">
                <p:output port="result"/>
                <px:fileset-create>
                    <p:with-option name="base" select="$output-dir">
                        <p:empty/><!--required since the XPath context can be a sequence here, causing err:XD0008 -->
                    </p:with-option>
                </px:fileset-create>
                <px:fileset-add-entry>
                    <p:with-option name="href" select="$css-file"/>
                    <p:with-option name="media-type" select="'text/css'"/>
                </px:fileset-add-entry>
            </p:when>
            <p:otherwise>
                <p:output port="result"/>
                <p:identity>
                    <p:input port="source">
                        <p:empty/>
                    </p:input>
                </p:identity>
            </p:otherwise>
        </p:choose>

        <p:documentation>Add the MODS document to the fileset.</p:documentation>
        <px:fileset-create>
            <p:with-option name="base" select="$output-dir"/>
        </px:fileset-create>
        <px:fileset-add-entry name="result.fileset.mods">
            <p:with-option name="href" select="$mods-file"/>
            <p:with-option name="media-type" select="'application/mods+xml'"/>
        </px:fileset-add-entry>

        <px:fileset-join>
            <p:input port="source">
                <p:pipe port="result" step="result.fileset.zedai"/>
                <p:pipe port="result" step="result.fileset.resources"/>
                <p:pipe port="result" step="result.fileset.generated-css"/>
                <p:pipe port="result" step="result.fileset.mods"/>
            </p:input>
        </px:fileset-join>
        <px:mediatype-detect/>
    </p:group>

    <p:add-attribute match="/*" attribute-name="xml:base" name="result.zedai">
        <p:input port="source">
            <p:pipe step="validate-zedai" port="result"/>
        </p:input>
        <p:with-option name="attribute-value" select="$zedai-file"/>
    </p:add-attribute>
    <p:for-each name="result.in-memory">
        <p:output port="result" sequence="true"/>
        <p:iteration-source>
            <p:pipe port="result" step="result.zedai"/>
            <p:pipe port="result" step="generate-css"/>
            <p:pipe step="generate-mods-metadata" port="result"/>
        </p:iteration-source>
        <p:variable name="in-memory-base" select="base-uri(/*)"/>
        <p:variable name="fileset-base" select="base-uri(/*)">
            <p:pipe port="result" step="result.fileset"/>
        </p:variable>
        <p:choose>
            <p:xpath-context>
                <p:pipe port="result" step="result.fileset"/>
            </p:xpath-context>
            <p:when test="//d:file[resolve-uri(@href,$fileset-base) = resolve-uri($in-memory-base)]">
                <!-- document is in the fileset; keep it -->
                <p:identity/>
            </p:when>
            <p:otherwise>
                <!-- document is not in the fileset; discard it -->
                <p:sink/>
                <p:identity>
                    <p:input port="source">
                        <p:empty/>
                    </p:input>
                </p:identity>
            </p:otherwise>
        </p:choose>
    </p:for-each>

</p:declare-step>
