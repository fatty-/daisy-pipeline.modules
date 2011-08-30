<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" xmlns:px="http://www.daisy.org/ns/pipeline/xproc" xmlns:pxi="http://www.daisy.org/ns/pipeline/xproc/internal"
    xmlns:html="http://www.w3.org/1999/xhtml" xmlns:d="http://www.daisy.org/ns/pipeline/data" xmlns:mo="http://www.w3.org/ns/SMIL" type="pxi:daisy202-to-epub3-mediaoverlay-and-content"
    name="mediaoverlay-and-content" version="1.0">
    
    <p:input port="flow" primary="true"/>
    <p:output port="manifest">
        <p:pipe port="result" step="manifest"/>
    </p:output>
    <p:output port="mediaoverlay" sequence="true">
        <p:pipe port="mediaoverlay" step="mediaoverlay-iterate"/>
    </p:output>
    <p:output port="content" sequence="true">
        <p:pipe port="content" step="content-flow-iterate"/>
    </p:output>
    <p:output port="daisy-smil" sequence="true">
        <p:pipe port="daisy-smil" step="flow-iterate"/>
    </p:output>
    <p:output port="daisy-content" sequence="true">
        <p:pipe port="content-with-original-base" step="content-flow-iterate"/>
    </p:output>
    <p:output port="store-complete" sequence="true">
        <p:pipe port="store-complete" step="content-flow-iterate"/>
        <p:pipe port="store-complete" step="mediaoverlay-iterate"/>
    </p:output>
    
    <p:option name="daisy-dir" required="true"/>
    <p:option name="content-dir" required="true"/>
    <p:option name="include-mediaoverlay" required="true"/>
    <p:option name="pub-id" required="true"/>

    <p:import href="resolve-links.xpl"/>
    <p:import href="http://www.daisy.org/pipeline/modules/fileset-utils/xproc/fileset-library.xpl"/>
    <p:import href="http://www.daisy.org/pipeline/modules/mediaoverlay-utils/join.xpl"/>
    <p:import href="http://www.daisy.org/pipeline/modules/mediaoverlay-utils/upgrade-smil.xpl"/>
    <p:import href="http://www.daisy.org/pipeline/modules/mediaoverlay-utils/rearrange.xpl"/>

    <p:add-xml-base all="true" relative="false"/>
    <p:for-each name="flow-iterate">
        <p:output port="daisy-smil" primary="false" sequence="true">
            <p:pipe port="result" step="flow-iterate.daisy-smil"/>
        </p:output>
        <p:output port="mediaoverlay" primary="false" sequence="true">
            <p:pipe port="result" step="flow-iterate.mediaoverlay"/>
        </p:output>
        <p:output port="content-flow" primary="false" sequence="true">
            <p:pipe port="result" step="flow-iterate.content-flow"/>
        </p:output>
        <p:iteration-source select="/*/*"/>
        <p:variable name="original-uri" select="p:resolve-uri(/*/@href,/*/@xml:base)"/>
        <p:variable name="xml-base" select="/*/@xml:base"/>
        <p:load name="flow-iterate.smils">
            <p:with-option name="href" select="$original-uri"/>
        </p:load>
        <p:add-attribute match="/*" attribute-name="xml:base" name="flow-iterate.daisy-smil">
            <p:with-option name="attribute-value" select="$original-uri"/>
        </p:add-attribute>
        <px:mediaoverlay-upgrade-smil/>
        <p:add-attribute match="/*" attribute-name="xml:base">
            <p:with-option name="attribute-value" select="$original-uri"/>
        </p:add-attribute>
        <p:identity name="flow-iterate.mediaoverlay"/>
        <p:xslt>
            <p:input port="source">
                <p:pipe port="result" step="flow-iterate.daisy-smil"/>
            </p:input>
            <p:with-param name="xml-base" select="$xml-base"/>
            <p:input port="stylesheet">
                <p:document href="http://www.daisy.org/pipeline/modules/mediaoverlay-utils/smil-to-text-fileset.xsl"/>
            </p:input>
        </p:xslt>
        <p:add-attribute match="//d:file" attribute-name="media-type" attribute-value="application/xhtml+xml"/>
        <p:identity name="flow-iterate.content-flow"/>
    </p:for-each>

    <px:fileset-join name="content-flow">
        <p:input port="source">
            <p:pipe port="content-flow" step="flow-iterate"/>
        </p:input>
    </px:fileset-join>

    <p:add-xml-base all="true" relative="false"/>
    <p:for-each name="content-flow-iterate">
        <p:output port="content-with-original-base" primary="false">
            <p:pipe port="result" step="content-flow-iterate.content-with-original-base"/>
        </p:output>
        <p:output port="content" primary="false">
            <p:pipe port="result" step="content-flow-iterate.content-with-result-base"/>
        </p:output>
        <p:output port="store-complete">
            <p:pipe port="result" step="content-flow-iterate.store-content"/>
        </p:output>
        <p:iteration-source select="/*/*"/>
        <p:variable name="original-uri" select="p:resolve-uri(/*/@href,/*/@xml:base)"/>
        <p:variable name="result-uri"
            select="concat($content-dir,substring(
                        p:resolve-uri(
                            if (matches(/*/@href,'\.[^\./]*$'))
                                then
                                    replace(/*/@href,'(.*)\.[^\.]*$','$1.xhtml')
                                else
                                    concat(/*/@href,'.xhtml'),
                            /*/@xml:base
                        ),
                        string-length($daisy-dir)+1
                    ))"/>
        <p:variable name="dbg" select="concat('
                                            concat(',
                                                $content-dir,',',
                                                'substring(',
                                                    'resolve-uri(',
                                                        'if (matches(',/*/@href,',\.[^\./]*$))',
                                                            'then',
                                                               'replace(',/*/@href,',(.*)\.[^\.]*$,$1.xhtml)',
                                                           'else',
                                                                'concat(',/*/@href,',.xhtml),',
                                                        /*/@xml:base,
                                                    '),',
                                                    'string-length(',$daisy-dir,')+1))')"/>
        <p:load>
            <p:with-option name="href" select="$original-uri"/>
        </p:load>
        <p:add-attribute match="/*" attribute-name="xml:base">
            <p:with-option name="attribute-value" select="$original-uri"/>
        </p:add-attribute>
        <pxi:daisy202-to-epub3-resolve-links>
            <p:input port="daisy-smil">
                <p:pipe port="daisy-smil" step="flow-iterate"/>
            </p:input>
        </pxi:daisy202-to-epub3-resolve-links>
        <p:viewport match="html:a[@href and not(matches(@href,'^[^/]+:'))]">
            <p:add-attribute match="/*" attribute-name="href">
                <p:with-option name="attribute-value"
                    select="concat(replace(tokenize(/*/@href,'#')[1],'^(.*)\.html$','$1.xhtml#'),if (contains(/*/@href,'#')) then tokenize(/*/@href,'#')[last()] else '')"/>
            </p:add-attribute>
        </p:viewport>

        <p:delete match="/*/@xml:base"/>
        <p:xslt name="content-flow-iterate.content">
            <p:with-param name="href" select="$result-uri"/>
            <p:with-param name="pub-id" select="$pub-id"/>
            <p:input port="stylesheet">
                <p:document href="daisy202-content-to-epub3-content.xsl"/>
            </p:input>
        </p:xslt>
        <p:store indent="true" name="content-flow-iterate.store-content">
            <p:with-option name="href" select="$result-uri"/>
        </p:store>
        <p:add-attribute match="/*" attribute-name="xml:base" name="content-flow-iterate.content-with-result-base">
            <p:with-option name="attribute-value" select="$result-uri"/>
            <p:input port="source">
                <p:pipe port="result" step="content-flow-iterate.content"/>
            </p:input>
        </p:add-attribute>
        <p:add-attribute match="/*" attribute-name="dbg">
            <p:with-option name="attribute-value" select="$dbg"/>
        </p:add-attribute>
        <p:add-attribute match="/*" attribute-name="xml:base" name="content-flow-iterate.content-with-original-base">
            <p:with-option name="attribute-value" select="$original-uri"/>
        </p:add-attribute>
    </p:for-each>

    <px:mediaoverlay-join name="mediaoverlay-joined">
        <p:input port="source">
            <p:pipe port="mediaoverlay" step="flow-iterate"/>
        </p:input>
    </px:mediaoverlay-join>
    <p:sink/>

    <p:for-each name="mediaoverlay-iterate">
        <p:output port="mediaoverlay" sequence="true">
            <p:pipe port="mediaoverlay" step="mediaoverlay-iterate.choose"/>
        </p:output>
        <p:output port="store-complete" sequence="true">
            <p:pipe port="store-complete" step="mediaoverlay-iterate.choose"/>
        </p:output>
        <p:iteration-source>
            <p:pipe port="content-with-original-base" step="content-flow-iterate"/>
        </p:iteration-source>
        <p:choose name="mediaoverlay-iterate.choose">
            <p:when test="$include-mediaoverlay='true' or true()">
                <p:output port="mediaoverlay" sequence="true">
                    <p:pipe port="result" step="mediaoverlay-iterate.mediaoverlay"/>
                </p:output>
                <p:output port="store-complete" sequence="true">
                    <p:pipe port="result" step="mediaoverlay-iterate.store-mediaoverlay"/>
                </p:output>

                <p:variable name="result-uri"
                    select="concat($content-dir,
                                    substring(
                                            if (matches(/*/@xml:base,'\.[^/]*$'))
                                                then
                                                    replace(/*/@xml:base,'^(.*)\.[^/\.]*$','$1.smil')
                                                else
                                                    concat(/*/@xml:base,'.smil'),
                                            string-length($daisy-dir)+1
                                    )
                                )"/>
                <px:mediaoverlay-rearrange>
                    <p:input port="mediaoverlay">
                        <p:pipe port="result" step="mediaoverlay-joined"/>
                    </p:input>
                </px:mediaoverlay-rearrange>
                <p:add-attribute match="/*" name="mediaoverlay-iterate.mediaoverlay" attribute-name="xml:base">
                    <p:with-option name="attribute-value" select="$result-uri"/>
                </p:add-attribute>
                <p:delete match="//@xml:base"/>
                <p:viewport match="//mo:text">
                    <p:add-attribute match="/*" attribute-name="src" attribute-value="replace(/*/@src,'^(.+)\.[^\.]*#(.*)$','$1.xhtml#$2')"/>
                </p:viewport>
                <p:store indent="true" name="mediaoverlay-iterate.store-mediaoverlay">
                    <p:with-option name="href" select="$result-uri"/>
                </p:store>
            </p:when>
            <p:otherwise>
                <p:output port="mediaoverlay" sequence="true">
                    <p:empty/>
                </p:output>
                <p:output port="store-complete" sequence="true">
                    <p:empty/>
                </p:output>
                <p:sink/>
            </p:otherwise>
        </p:choose>
    </p:for-each>

    <p:for-each name="content-filesets">
        <p:output port="result" sequence="true"/>
        <p:iteration-source>
            <p:pipe port="content" step="content-flow-iterate"/>
        </p:iteration-source>
        <p:variable name="uri" select="/*/@xml:base"/>
        <p:identity>
            <p:input port="source">
                <p:inline>
                    <d:fileset xmlns:d="http://www.daisy.org/ns/pipeline/data">
                        <d:file media-type="application/xhtml+xml"/>
                    </d:fileset>
                </p:inline>
            </p:input>
        </p:identity>
        <p:add-attribute match="/*" attribute-name="xml:base">
            <p:with-option name="attribute-value" select="replace($uri,'(.*/)[^/]*$','$1')"/>
        </p:add-attribute>
        <p:add-attribute match="/*/*" attribute-name="href">
            <p:with-option name="attribute-value" select="replace($uri,'.*/([^/]*)$','$1')"/>
        </p:add-attribute>
    </p:for-each>
    <p:sink/>
    <p:for-each name="mediaoverlay-filesets">
        <p:output port="result" sequence="true"/>
        <p:iteration-source>
            <p:pipe port="mediaoverlay" step="mediaoverlay-iterate"/>
        </p:iteration-source>
        <p:variable name="uri" select="/*/@xml:base"/>
        <p:choose>
            <p:when test="$include-mediaoverlay">
                <p:identity>
                    <p:input port="source">
                        <p:inline>
                            <d:fileset xmlns:d="http://www.daisy.org/ns/pipeline/data">
                                <d:file media-type="application/smil+xml"/>
                            </d:fileset>
                        </p:inline>
                    </p:input>
                </p:identity>
                <p:add-attribute match="/*" attribute-name="xml:base">
                    <p:with-option name="attribute-value" select="replace($uri,'(.*/)[^/]*$','$1')"/>
                </p:add-attribute>
                <p:add-attribute match="/*/*" attribute-name="href">
                    <p:with-option name="attribute-value" select="replace($uri,'.*/([^/]*)$','$1')"/>
                </p:add-attribute>
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
    <p:sink/>
    <px:fileset-join name="manifest">
        <p:input port="source">
            <p:pipe port="result" step="content-filesets"/>
            <p:pipe port="result" step="mediaoverlay-filesets"/>
        </p:input>
    </px:fileset-join>

</p:declare-step>
