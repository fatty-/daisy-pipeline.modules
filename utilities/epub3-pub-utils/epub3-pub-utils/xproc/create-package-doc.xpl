<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step type="px:epub3-pub-create-package-doc" name="main" xmlns:opf="http://www.idpf.org/2007/opf" xmlns:p="http://www.w3.org/ns/xproc" xmlns:px="http://www.daisy.org/ns/pipeline/xproc"
    xmlns:c="http://www.w3.org/ns/xproc-step" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:d="http://www.daisy.org/ns/pipeline/data" xmlns:html="http://www.w3.org/1999/xhtml"
    xmlns:epub="http://www.idpf.org/2007/ops" xmlns:f="http://www.daisy.org/ns/pipeline/internal-functions" version="1.0">

    <!-- Note: all URIs in options and xml:base attributes must be absolute. -->
    <p:log port="result" href="file:/tmp/xproc/opf.xml"/>
    <p:input port="spine-filesets" sequence="true" primary="true"/>
    <p:input port="publication-resources">
        <p:inline>
            <d:fileset/>
        </p:inline>
    </p:input>
    <p:input port="metadata"/>
    <p:input port="bindings" sequence="true">
        <p:empty/>
    </p:input>
    <p:input port="content-docs" sequence="true"/>
    <p:input port="mediaoverlays" sequence="true">
        <p:empty/>
    </p:input>
    <p:option name="nav-uri" select="''"/>
    <p:option name="cover-image" required="false" select="''"/>
    <p:option name="compatibility-mode" required="false" select="'true'"/>
    <p:option name="detect-properties" required="false" select="'true'"/>
    <p:option name="result-uri" required="true"/>
    <p:output port="result" primary="true" sequence="true"/>
    <p:output port="dbg" sequence="true">
        <p:pipe port="dbg" step="manifest"/>
        <p:pipe port="mediaoverlays" step="main"/>
    </p:output>

    <p:import href="http://www.daisy.org/pipeline/modules/fileset-utils/xproc/fileset-library.xpl"/>

    <p:group name="nav-doc">
        <p:output port="result"/>
        <p:split-sequence>
            <p:with-option name="test"
                select="if (not($nav-uri='')) then concat('/*/@xml:base=&quot;',p:resolve-uri($nav-uri),'&quot;') else '//html:nav/@*[name()=&quot;epub:type&quot;]=&quot;toc&quot;'">
                <p:empty/>
            </p:with-option>
            <p:input port="source">
                <p:pipe port="content-docs" step="main"/>
            </p:input>
        </p:split-sequence>
        <p:split-sequence test="position()=1" name="nav-doc.nav-doc"/>
        <p:count/>
        <p:choose>
            <p:when test="/*=1">
                <p:identity>
                    <p:input port="source">
                        <p:pipe port="matched" step="nav-doc.nav-doc"/>
                    </p:input>
                </p:identity>
            </p:when>
            <p:otherwise>
                <p:error code="PEPU14">
                    <p:input port="source">
                        <p:inline>
                            <c:message>Could not find a Navigation Document on the "content-docs"-port.</c:message>
                        </p:inline>
                    </p:input>
                </p:error>
            </p:otherwise>
        </p:choose>
    </p:group>
    <p:sink/>

    <p:group name="metadata">
        <p:output port="result"/>
        <p:identity>
            <p:input port="source">
                <p:pipe port="metadata" step="main"/>
            </p:input>
        </p:identity>
        <p:choose>
            <p:when test="/opf:metadata/dc:identifier/@id">
                <p:identity/>
            </p:when>
            <p:when test="//@id='pub-id'">
                <p:xslt>
                    <p:input port="parameters">
                        <p:empty/>
                    </p:input>
                    <p:input port="stylesheet">
                        <p:document href="create-package-doc.generate-identifier.xsl"/>
                    </p:input>
                </p:xslt>
            </p:when>
            <p:otherwise>
                <p:add-attribute match="/opf:metadata/dc:identifier" attribute-name="id" attribute-value="pub-id"/>
            </p:otherwise>
        </p:choose>
        <p:xslt>
            <p:input port="parameters">
                <p:empty/>
            </p:input>
            <p:input port="stylesheet">
                <p:document href="create-package-doc.generate-dcterms-modified.xsl"/>
            </p:input>
        </p:xslt>
        <p:delete match="opf:meta[@property='media:duration']"/>
        <p:identity name="metadata.without-duration"/>
        <p:sink/>

        <p:for-each name="metadata.durations">
            <p:output port="result" sequence="true"/>
            <p:iteration-source>
                <p:pipe port="mediaoverlays" step="main"/>
            </p:iteration-source>
            <p:variable name="base" select="/*/@xml:base"/>
            <p:xslt>
                <p:input port="parameters">
                    <p:empty/>
                </p:input>
                <p:input port="stylesheet">
                    <p:document href="create-package-doc.estimate-mediaoverlay-duration.xsl"/>
                </p:input>
            </p:xslt>
            <p:add-attribute match="/*" attribute-name="refines">
                <p:with-option name="attribute-value" select="concat('#',/*/d:file[replace(resolve-uri(@href,/*/@xml:base),'/+','/') = replace($base,'/+','/')]/@id)">
                    <p:pipe port="fileset" step="manifest"/>
                </p:with-option>
            </p:add-attribute>
        </p:for-each>
        <p:sink/>

        <p:group name="metadata.total-duration">
            <p:output port="result" sequence="true"/>
            <p:count>
                <p:input port="source">
                    <p:pipe port="result" step="metadata.durations"/>
                </p:input>
            </p:count>
            <p:choose>
                <p:when test="/*=0">
                    <p:identity>
                        <p:input port="source">
                            <p:empty/>
                        </p:input>
                    </p:identity>
                </p:when>
                <p:otherwise>
                    <p:wrap-sequence wrapper="wrapper">
                        <p:input port="source">
                            <p:pipe port="result" step="metadata.durations"/>
                        </p:input>
                    </p:wrap-sequence>
                    <p:xslt>
                        <p:input port="parameters">
                            <p:empty/>
                        </p:input>
                        <p:input port="stylesheet">
                            <p:document href="create-package-doc.sum-mediaoverlay-durations.xsl"/>
                        </p:input>
                    </p:xslt>
                </p:otherwise>
            </p:choose>
        </p:group>
        <p:sink/>

        <p:insert match="/*" position="last-child">
            <p:input port="source">
                <p:pipe port="result" step="metadata.without-duration"/>
            </p:input>
            <p:input port="insertion">
                <p:pipe port="result" step="metadata.durations"/>
                <p:pipe port="result" step="metadata.total-duration"/>
            </p:input>
        </p:insert>

        <p:choose>
            <p:when test="$compatibility-mode='true'">
                <p:xslt>
                    <p:input port="parameters">
                        <p:empty/>
                    </p:input>
                    <p:input port="stylesheet">
                        <p:document href="create-package-doc.backwards-compatible-metadata.xsl"/>
                    </p:input>
                </p:xslt>
            </p:when>
            <p:otherwise>
                <p:identity/>
            </p:otherwise>
        </p:choose>
    </p:group>
    <p:sink/>

    <p:group name="manifest">
        <p:output port="fileset" primary="true">
            <p:pipe port="fileset" step="manifest.out"/>
        </p:output>
        <p:output port="manifest">
            <p:pipe port="manifest" step="manifest.out"/>
        </p:output>
        <p:output port="dbg" sequence="true">
            <p:pipe port="dbg" step="manifest.mediaoverlays"/>
        </p:output>

        <p:group name="manifest.bindings">
            <p:output port="result" sequence="true"/>
            <p:count>
                <p:input port="source">
                    <p:pipe port="bindings" step="main"/>
                </p:input>
            </p:count>
            <p:choose>
                <p:when test="/*=0">
                    <p:identity>
                        <p:input port="source">
                            <p:empty/>
                        </p:input>
                    </p:identity>
                </p:when>
                <p:when test="/*=1">
                    <p:set-attributes match="d:file">
                        <p:input port="source">
                            <p:pipe port="bindings" step="main"/>
                        </p:input>
                        <p:input port="attributes">
                            <p:inline>
                                <d:file media-type="application/xhtml+xml"/>
                            </p:inline>
                        </p:input>
                    </p:set-attributes>
                </p:when>
                <p:otherwise>
                    <p:error code="PEPUTODO">
                        <p:input port="source">
                            <p:inline>
                                <c:message>There can be at most one set of bindings.</c:message>
                            </p:inline>
                        </p:input>
                    </p:error>
                </p:otherwise>
            </p:choose>
        </p:group>
        <p:sink/>

        <p:for-each name="manifest.content-docs">
            <p:output port="result" sequence="true"/>
            <p:iteration-source>
                <p:pipe port="content-docs" step="main"/>
            </p:iteration-source>
            <p:variable name="doc-base" select="p:base-uri(/*)"/>
            <p:identity name="manifest.content-docs.current"/>
            <px:fileset-create>
                <p:with-option name="base" select="$result-uri"/>
            </px:fileset-create>
            <px:fileset-add-entry>
                <p:with-option name="href" select="$doc-base"/>
                <p:with-option name="media-type" select="'application/xhtml+xml'"/>
            </px:fileset-add-entry>
            <p:choose>
                <p:when test="$detect-properties='true'">
                    <p:add-attribute attribute-name="mathml" match="/*/*">
                        <p:with-option name="attribute-value" select="distinct-values(//namespace::*)='http://www.w3.org/1998/Math/MathML'">
                            <p:pipe port="result" step="manifest.content-docs.current"/>
                        </p:with-option>
                    </p:add-attribute>
                    <p:add-attribute attribute-name="svg" match="/*/*">
                        <p:with-option name="attribute-value"
                            select="(//html:embed|//html:iframe)/@src/ends-with(.,'.svg') or (//html:embed|//html:object)/@type='image/svg+xml' or distinct-values(//namespace::*)='http://www.w3.org/2000/svg'">
                            <p:pipe port="result" step="manifest.content-docs.current"/>
                        </p:with-option>
                    </p:add-attribute>
                    <p:add-attribute attribute-name="scripted" match="/*/*">
                        <p:with-option name="attribute-value"
                            select="
                                              count(//*/@href[starts-with(.,'javascript:')]) &gt; 0 or
                                              //html:script/@type=('','text/javascript','text/ecmascript','text/javascript1.0','text/javascript1.1',
                                                                  'text/javascript1.2','text/javascript1.3','text/javascript1.4','text/javascript1.5',
                                                                  'text/jscript','text/livescript','text/x-javascript','text/x-ecmascript',
                                                                  'application/x-javascript','application/x-ecmascript','application/javascript',
                                                                  'application/ecmascript') or
                                              //*/@*/name()=('onabort','onafterprint','onbeforeprint','onbeforeunload','onblur','oncanplay','oncanplaythrough','onchange','onclick','oncontextmenu',
                                                              'oncuechange','ondblclick','ondrag','ondragend','ondragenter','ondragleave','ondragover','ondragstart','ondrop','ondurationchange',
                                                              'onemptied','onended','onerror','onfocus','onhashchange','oninput','oninvalid','onkeydown','onkeypress','onkeyup','onload','onloadeddata',
                                                              'onloadedmetadata','onloadstart','onmessage','onmousedown','onmousemove','onmouseout','onmouseover','onmouseup','onmousewheel','onoffline',
                                                              'ononline','onpagehide','onpageshow','onpause','onplay','onplaying','onpopstate','onprogress','onratechange','onreset','onresize','onscroll',
                                                              'onseeked','onseeking','onselect','onshow','onstalled','onstorage','onsubmit','onsuspend','ontimeupdate','onunload','onvolumechange','onwaiting')
                                            ">
                            <p:pipe port="result" step="manifest.content-docs.current"/>
                        </p:with-option>
                    </p:add-attribute>
                    <p:add-attribute attribute-name="switch" match="/*/*">
                        <p:with-option name="attribute-value" select="count(//epub:switch) &gt; 0">
                            <p:pipe port="result" step="manifest.content-docs.current"/>
                        </p:with-option>
                    </p:add-attribute>
                    <p:add-attribute attribute-name="remote-resources" match="/*/*">
                        <p:with-option name="attribute-value" select="count((//*/@src|//*/@href)[contains(tokenize(.,'/')[1],':')][1]) &gt; 0">
                            <p:pipe port="result" step="manifest.content-docs.current"/>
                        </p:with-option>
                    </p:add-attribute>
                    <p:add-attribute attribute-name="nav" match="/*/*">
                        <p:with-option name="attribute-value" select="/*/@xml:base=$doc-base">
                            <p:pipe port="result" step="nav-doc"/>
                        </p:with-option>
                    </p:add-attribute>
                </p:when>
                <p:otherwise>
                    <p:identity/>
                </p:otherwise>
            </p:choose>
        </p:for-each>
        <p:sink/>

        <p:for-each name="manifest.mediaoverlays">
            <p:output port="result" sequence="true" primary="true"/>
            <p:output port="dbg" sequence="true">
                <p:pipe port="result" step="dbg-2"/>
            </p:output>
            <p:iteration-source>
                <p:pipe port="mediaoverlays" step="main"/>
            </p:iteration-source>
            <p:variable name="doc-base" select="/*/@xml:base"/>
            <p:identity name="dbg-2"/>
            <px:fileset-create>
                <p:with-option name="base" select="$result-uri"/>
            </px:fileset-create>
            <px:fileset-add-entry>
                <p:with-option name="href" select="$doc-base"/>
                <p:with-option name="media-type" select="'application/smil+xml'"/>
            </px:fileset-add-entry>
        </p:for-each>
        <p:sink/>

        <px:fileset-join>
            <p:input port="source">
                <!-- TODO: test to make sure that the resulting URIs turns out as relative to $result-uri -->
                <p:pipe port="result" step="manifest.content-docs"/>
                <p:pipe port="spine-filesets" step="main"/>
                <p:pipe port="result" step="manifest.mediaoverlays"/>
                <p:pipe port="publication-resources" step="main"/>
                <p:pipe port="result" step="manifest.bindings"/>
            </p:input>
        </px:fileset-join>
        <p:group name="manifest.ids">
            <p:output port="result"/>
            <p:variable name="manifest-uri" select="/*/@xml:base"/>
            <p:viewport match="d:file">
                <p:add-attribute match="/*" attribute-name="href">
                    <p:with-option name="attribute-value" select="p:resolve-uri(/*/@href,$manifest-uri)"/>
                </p:add-attribute>
                <p:add-attribute match="/*" attribute-name="id">
                    <p:with-option name="attribute-value" select="concat('item_',p:iteration-position())"/>
                </p:add-attribute>
                <p:add-attribute match="/*" attribute-name="cover-image">
                    <p:with-option name="attribute-value" select="p:resolve-uri(/*/@href,$manifest-uri)=p:resolve-uri($cover-image,$result-uri)"/>
                </p:add-attribute>
            </p:viewport>
        </p:group>
        <p:sink/>

        <p:wrap-sequence wrapper="fallback">
            <p:input port="source">
                <p:pipe port="spine-filesets" step="main"/>
            </p:input>
        </p:wrap-sequence>
        <p:xslt>
            <p:input port="parameters">
                <p:empty/>
            </p:input>
            <p:input port="stylesheet">
                <p:document href="create-package-doc.fileset-resolve.xsl"/>
            </p:input>
        </p:xslt>
        <p:insert match="/*" position="first-child">
            <p:input port="insertion">
                <p:pipe port="result" step="manifest.ids"/>
            </p:input>
        </p:insert>
        <p:xslt name="manifest.fallbacks">
            <p:input port="parameters">
                <p:empty/>
            </p:input>
            <p:input port="stylesheet">
                <p:document href="create-package-doc.manifest-fallbacks.xsl"/>
            </p:input>
        </p:xslt>
        <p:sink/>

        <px:fileset-join>
            <p:input port="source">
                <p:pipe port="result" step="manifest.ids"/>
            </p:input>
        </px:fileset-join>
        <p:group name="manifest.out">
            <p:output port="fileset">
                <p:pipe port="result" step="manifest.out.fileset"/>
            </p:output>
            <p:output port="manifest">
                <p:pipe port="result" step="manifest.out.manifest"/>
            </p:output>
            <p:variable name="manifest-base" select="/*/@xml:base"/>
            <p:viewport match="//d:file" name="manifest.out.fileset">
                <p:output port="result"/>
                <p:variable name="href" select="resolve-uri(/*/@href,$manifest-base)"/>
                <p:choose>
                    <p:xpath-context>
                        <p:pipe port="result" step="manifest.fallbacks"/>
                    </p:xpath-context>
                    <p:when test="/*/d:file[resolve-uri(@href,/*/@xml:base)=$href]/@fallback">
                        <p:add-attribute match="/*" attribute-name="fallback">
                            <p:with-option name="attribute-value" select="/*/d:file[resolve-uri(@href,/*/@xml:base)=$href]/@fallback">
                                <p:pipe port="result" step="manifest.fallbacks"/>
                            </p:with-option>
                        </p:add-attribute>
                    </p:when>
                    <p:otherwise>
                        <p:identity/>
                    </p:otherwise>
                </p:choose>
            </p:viewport>
            <p:xslt name="manifest.out.manifest">
                <p:with-param name="result-uri" select="$result-uri"/>
                <p:input port="stylesheet">
                    <p:document href="create-package-doc.fileset-to-manifest.xsl"/>
                </p:input>
            </p:xslt>
            <p:sink/>
        </p:group>
    </p:group>
    <p:sink/>

    <p:group name="spine">
        <p:output port="result"/>
        <p:identity>
            <p:input port="source">
                <p:pipe port="spine-filesets" step="main"/>
            </p:input>
        </p:identity>
        <p:for-each>
            <p:delete match="/*/*[position() &gt; 1]"/>
        </p:for-each>
        <px:fileset-join/>
        <p:group>
            <p:variable name="base" select="/*/@xml:base"/>
            <p:viewport match="/*/d:file">
                <p:variable name="file-uri" select="resolve-uri(/*/@href,$base)"/>
                <p:add-attribute match="/*" attribute-name="idref">
                    <p:with-option name="attribute-value" select="/*/d:file[replace(resolve-uri(@href,/*/@xml:base),'/+','/') = replace($file-uri,'/+','/')]/@id">
                        <p:pipe port="fileset" step="manifest"/>
                    </p:with-option>
                </p:add-attribute>
            </p:viewport>
        </p:group>
        <p:xslt>
            <p:input port="parameters">
                <p:empty/>
            </p:input>
            <p:input port="stylesheet">
                <p:document href="create-package-doc.idref-fileset-to-spine.xsl"/>
            </p:input>
        </p:xslt>
        <p:choose>
            <p:xpath-context>
                <p:pipe port="fileset" step="manifest"/>
            </p:xpath-context>
            <p:when test="$compatibility-mode='true' and //@media-type='application/x-dtbncx+xml'">
                <p:add-attribute match="/*" attribute-name="toc">
                    <p:with-option name="attribute-value" select="//*[@media-type='application/x-dtbncx+xml']/@id">
                        <p:pipe port="fileset" step="manifest"/>
                    </p:with-option>
                </p:add-attribute>
            </p:when>
            <p:otherwise>
                <p:identity/>
            </p:otherwise>
        </p:choose>
    </p:group>
    <p:sink/>

    <p:documentation>If the navigation document contains landmarks and compatibility-mode is enabled; generate the guide element based on the landmarks.</p:documentation>
    <p:group name="guide">
        <p:output port="result" sequence="true"/>
        <p:identity>
            <p:input port="source">
                <p:pipe port="result" step="nav-doc"/>
            </p:input>
        </p:identity>
        <p:for-each>
            <p:iteration-source select="//html:nav[@*[name()='epub:type']='landmarks']"/>
            <p:identity/>
        </p:for-each>
        <p:identity name="guide.landmarks"/>
        <p:count name="guide.count"/>
        <p:identity>
            <p:input port="source">
                <p:pipe port="result" step="guide.landmarks"/>
            </p:input>
        </p:identity>
        <p:choose>
            <p:when test="/*=0 or not($compatibility-mode='true')">
                <p:xpath-context>
                    <p:pipe port="result" step="guide.count"/>
                </p:xpath-context>
                <p:identity>
                    <p:input port="source">
                        <p:empty/>
                    </p:input>
                </p:identity>
            </p:when>
            <p:otherwise>
                <p:xslt>
                    <p:input port="parameters">
                        <p:empty/>
                    </p:input>
                    <p:input port="stylesheet">
                        <p:document href="http://www.daisy.org/pipeline/modules/epub3-nav-utils/nav-to-guide.xsl"/>
                    </p:input>
                </p:xslt>
            </p:otherwise>
        </p:choose>
    </p:group>
    <p:sink/>

    <p:group name="bindings">
        <p:output port="result" sequence="true"/>
        <p:count>
            <p:input port="source">
                <p:pipe port="bindings" step="main"/>
            </p:input>
        </p:count>
        <p:choose>
            <p:when test="/* = 0 or not($compatibility-mode='true')">
                <p:identity>
                    <p:input port="source">
                        <p:empty/>
                    </p:input>
                </p:identity>
            </p:when>
            <p:otherwise>
                <p:identity>
                    <p:input port="source">
                        <p:pipe port="bindings" step="main"/>
                    </p:input>
                </p:identity>
                <p:group>
                    <p:variable name="base" select="/*/@xml:base"/>
                    <p:viewport match="/*/d:file">
                        <p:variable name="file-uri" select="resolve-uri(/*/@href,$base)"/>
                        <p:add-attribute match="/*" attribute-name="handler">
                            <p:with-option name="attribute-value" select="concat('#',/*/d:file[replace(resolve-uri(@href,/*/@xml:base),'/+','/') = replace($file-uri,'/+','/')]/@id)">
                                <p:pipe port="fileset" step="manifest"/>
                            </p:with-option>
                        </p:add-attribute>
                    </p:viewport>
                </p:group>
                <p:xslt>
                    <p:input port="parameters">
                        <p:empty/>
                    </p:input>
                    <p:input port="stylesheet">
                        <p:document href="create-package-doc.handler-fileset-to-bindings.xsl"/>
                    </p:input>
                </p:xslt>
            </p:otherwise>
        </p:choose>
    </p:group>
    <p:sink/>

    <p:insert match="/*" position="last-child">
        <p:input port="source">
            <p:inline exclude-inline-prefixes="#all">
                <package xmlns="http://www.idpf.org/2007/opf" version="3.0"/>
            </p:inline>
        </p:input>
        <p:input port="insertion">
            <p:pipe port="result" step="metadata"/>
            <p:pipe port="manifest" step="manifest"/>
            <p:pipe port="result" step="spine"/>
            <p:pipe port="result" step="guide"/>
            <p:pipe port="result" step="bindings"/>
        </p:input>
    </p:insert>
    <p:add-attribute match="/*" attribute-name="unique-identifier">
        <p:with-option name="attribute-value" select="/opf:package/opf:metadata/dc:identifier/@id"/>
    </p:add-attribute>
    <p:xslt>
        <p:input port="parameters">
            <p:empty/>
        </p:input>
        <p:input port="stylesheet">
            <p:document href="create-package-doc.remove-unused-namespaces.xsl"/>
        </p:input>
    </p:xslt>

</p:declare-step>
