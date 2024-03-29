<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" xmlns:px="http://www.daisy.org/ns/pipeline/xproc" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:cx="http://xmlcalabash.com/ns/extensions"
    xmlns:pxi="http://www.daisy.org/ns/pipeline/xproc/internal" xmlns:html="http://www.w3.org/1999/xhtml" type="px:daisy202-to-epub3" version="1.0">

    <p:documentation xmlns="http://www.w3.org/1999/xhtml">
        <h1 px:role="name">DAISY 2.02 to EPUB3</h1>
        <p px:role="desc">Transforms a DAISY 2.02 publication into an EPUB3 publication.</p>
        <dl px:role="author maintainer">
            <dt>Name:</dt>
            <dd px:role="name">Jostein Austvik Jacobsen</dd>
            <dt>E-mail:</dt>
            <dd><a px:role="contact" href="mailto:josteinaj@gmail.com">josteinaj@gmail.com</a></dd>
            <dt>Organization:</dt>
            <dd px:role="organization">NLB</dd>
        </dl>
        <p>Homepage: <a px:role="homepage" href="http://code.google.com/p/daisy-pipeline/wiki/DAISY202ToEPUB3">http://code.google.com/p/daisy-pipeline/wiki/DAISY202ToEPUB3</a>.</p>
    </p:documentation>

    <p:option name="href" required="true" px:type="anyFileURI" px:media-type="application/xhtml+xml text/html">
        <p:documentation xmlns="http://www.w3.org/1999/xhtml">
            <h2 px:role="name">href</h2>
            <p px:role="desc">Input NCC.</p>
            <pre><code class="example">file:/home/user/daisy202/ncc.html</code></pre>
        </p:documentation>
    </p:option>
    <p:option name="output" required="true" px:output="result" px:type="anyDirURI">
        <p:documentation xmlns="http://www.w3.org/1999/xhtml">
            <h2 px:role="name">output</h2>
            <p px:role="desc">Output directory for the EPUB.</p>
            <pre><code class="example">file:/home/user/epub3/</code></pre>
        </p:documentation>
    </p:option>
    <p:option name="mediaoverlay" required="false" select="'true'" px:type="boolean">
        <p:documentation xmlns="http://www.w3.org/1999/xhtml">
            <h2 px:role="name">mediaoverlay</h2>
            <p px:role="desc">Whether or not to include media overlays and associated audio files (true or false).</p>
        </p:documentation>
    </p:option>
    <p:option name="compatibility-mode" required="false" select="'true'" px:type="boolean">
        <p:documentation xmlns="http://www.w3.org/1999/xhtml">
            <h2 px:role="name">compatibility-mode</h2>
            <p px:role="desc">Whether or not to include NCX-file, OPF guide element and ASCII filenames (true or false).</p>
        </p:documentation>
    </p:option>

    <p:import href="http://xmlcalabash.com/extension/steps/library-1.0.xpl">
        <p:documentation xmlns="http://www.w3.org/1999/xhtml"><p px:role="desc">Calabash extension steps.</p></p:documentation>
    </p:import>
    <p:import href="ncc.xpl">
        <p:documentation xmlns="http://www.w3.org/1999/xhtml"><p px:role="desc">For loading the NCC.</p></p:documentation>
    </p:import>
    <p:import href="resolve-links.create-mapping.xpl">
        <p:documentation xmlns="http://www.w3.org/1999/xhtml"><p px:role="desc">For creating a map of all links in the SMIL files.</p></p:documentation>
    </p:import>
    <p:import href="ncc-navigation.xpl">
        <p:documentation xmlns="http://www.w3.org/1999/xhtml"><p px:role="desc">For making a Navigation Document based on the NCC.</p></p:documentation>
    </p:import>
    <p:import href="navigation.xpl">
        <p:documentation xmlns="http://www.w3.org/1999/xhtml"><p px:role="desc">For making a more complete Navigation Document based on all the Content Documents.</p></p:documentation>
    </p:import>
    <p:import href="load-smil-flow.xpl">
        <p:documentation xmlns="http://www.w3.org/1999/xhtml"><p px:role="desc">For loading the SMIL flow.</p></p:documentation>
    </p:import>
    <p:import href="content.xpl">
        <p:documentation xmlns="http://www.w3.org/1999/xhtml"><p px:role="desc">For processing the content.</p></p:documentation>
    </p:import>
    <p:import href="media-overlay.xpl">
        <p:documentation xmlns="http://www.w3.org/1999/xhtml"><p px:role="desc">For processing the SMILs.</p></p:documentation>
    </p:import>
    <p:import href="resources.xpl">
        <p:documentation xmlns="http://www.w3.org/1999/xhtml"><p px:role="desc">For processing auxiliary resources.</p></p:documentation>
    </p:import>
    <p:import href="package.xpl">
        <p:documentation xmlns="http://www.w3.org/1999/xhtml"><p px:role="desc">For making the package document.</p></p:documentation>
    </p:import>
    <p:import href="http://www.daisy.org/pipeline/modules/epub3-ocf-utils/xproc/epub3-ocf-library.xpl">
        <p:documentation xmlns="http://www.w3.org/1999/xhtml"><p px:role="desc">For putting it all into a ZIP container.</p></p:documentation>
    </p:import>

    <p:variable name="daisy-dir" select="replace($href,'[^/]+$','')"/>
    <p:variable name="output-dir" select="if (ends-with($output,'/')) then $output else concat($output,'/')"/>
    <p:variable name="epub-dir" select="concat($output-dir,'epub/')"/>
    <p:variable name="publication-dir" select="concat($epub-dir,'Publication/')"/>
    <p:variable name="content-dir" select="concat($publication-dir,'Content/')"/>

    <p:in-scope-names name="vars"/>
    <p:identity>
        <p:input port="source">
            <p:inline>
                <dummy-doc-for-p-template/>
            </p:inline>
        </p:input>
    </p:identity>
    <p:choose>
        <p:when test="not(matches($href,'\w+:/'))">
            <p:template>
                <p:input port="template">
                    <p:inline exclude-inline-prefixes="#all">
                        <message>href: "{$href}" is not a valid URI. You probably either forgot to prefix the path with file:/, or if you're using Windows, remember to replace all directory separators (\) with forward slashes (/).</message>
                    </p:inline>
                </p:input>
                <p:input port="parameters">
                    <p:pipe step="vars" port="result"/>
                </p:input>
            </p:template>
            <p:error code="PDE01"/>
        </p:when>
        <p:when test="not(matches($output,'\w+:/'))">
            <p:template>
                <p:input port="template">
                    <p:inline exclude-inline-prefixes="#all">
                        <message>output: "{$output}" is not a valid URI. You probably either forgot to prefix the path with file:/, or if you're using Windows, remember to replace all directory separators (\) with forward slashes (/).</message>
                    </p:inline>
                </p:input>
                <p:input port="parameters">
                    <p:pipe step="vars" port="result"/>
                </p:input>
            </p:template>
            <p:error code="PDE02"/>
        </p:when>
        <p:when test="not($mediaoverlay='true' or $mediaoverlay='false')">
            <p:template>
                <p:input port="template">
                    <p:inline exclude-inline-prefixes="#all">
                        <message>mediaoverlay: "{$mediaoverlay}" is not a valid value. When given, mediaoverlay must be either "true" (default) or "false".</message>
                    </p:inline>
                </p:input>
                <p:input port="parameters">
                    <p:pipe step="vars" port="result"/>
                </p:input>
            </p:template>
            <p:error code="PDE03"/>
        </p:when>
        <p:when test="not($compatibility-mode='true' or $compatibility-mode='false')">
            <p:template>
                <p:input port="template">
                    <p:inline exclude-inline-prefixes="#all">
                        <message>compatibility-mode: "{$compatibility-mode}" is not a valid value. When given, compatibility-mode must be either "true" (default) or "false".</message>
                    </p:inline>
                </p:input>
                <p:input port="parameters">
                    <p:pipe step="vars" port="result"/>
                </p:input>
            </p:template>
            <p:error code="PDE04"/>
        </p:when>
        <p:otherwise>
            <p:identity>
                <p:input port="source">
                    <p:empty/>
                </p:input>
            </p:identity>
        </p:otherwise>
    </p:choose>
    <p:sink/>

    <pxi:daisy202-to-epub3-ncc name="ncc">
        <p:documentation xmlns="http://www.w3.org/1999/xhtml"><p px:role="desc">Load the DAISY 2.02 NCC.</p></p:documentation>
        
        <p:with-option name="href" select="concat($daisy-dir,replace($href,'^.*/([^/]*)$','$1'))"/>
    </pxi:daisy202-to-epub3-ncc>

    <pxi:daisy202-to-epub3-load-smil-flow name="flow">
        <p:documentation xmlns="http://www.w3.org/1999/xhtml"><p px:role="desc">Load the SMIL-files.</p></p:documentation>
        
        <p:input port="flow">
            <p:pipe port="flow" step="ncc"/>
        </p:input>
    </pxi:daisy202-to-epub3-load-smil-flow>

    <pxi:daisy202-to-epub3-resolve-links-create-mapping name="resolve-links-mapping">
        <p:documentation xmlns="http://www.w3.org/1999/xhtml"><p px:role="desc">Make a map of all links from the SMIL files to the content files</p></p:documentation>
        
        <p:input port="daisy-smil">
            <p:pipe port="daisy-smil" step="flow"/>
        </p:input>
    </pxi:daisy202-to-epub3-resolve-links-create-mapping>

    <pxi:daisy202-to-epub3-ncc-navigation name="ncc-navigation">
        <p:documentation xmlns="http://www.w3.org/1999/xhtml"><p px:role="desc">Makes a Navigation Document directly from the DAISY 2.02 NCC.</p></p:documentation>
        
        <p:with-option name="publication-dir" select="$publication-dir"/>
        <p:with-option name="content-dir" select="$content-dir"/>
        <p:input port="ncc">
            <p:pipe port="ncc" step="ncc"/>
        </p:input>
        <p:input port="resolve-links-mapping">
            <p:pipe port="result" step="resolve-links-mapping"/>
        </p:input>
    </pxi:daisy202-to-epub3-ncc-navigation>

    <pxi:daisy202-to-epub3-content name="content-without-full-navigation">
        <p:documentation xmlns="http://www.w3.org/1999/xhtml"><p px:role="desc">Convert and store the content files.</p></p:documentation>
        
        <p:with-option name="daisy-dir" select="$daisy-dir"/>
        <p:with-option name="publication-dir" select="$publication-dir"/>
        <p:with-option name="content-dir" select="$content-dir"/>
        <p:input port="resolve-links-mapping">
            <p:pipe port="result" step="resolve-links-mapping"/>
        </p:input>
        <p:input port="content-flow">
            <p:pipe port="content-flow" step="flow"/>
        </p:input>
        <p:input port="ncc-navigation">
            <p:pipe port="result" step="ncc-navigation"/>
        </p:input>
    </pxi:daisy202-to-epub3-content>

    <pxi:daisy202-to-epub3-navigation name="navigation">
        <p:documentation xmlns="http://www.w3.org/1999/xhtml"><p px:role="desc">Compile and store the EPUB 3 Navigation Document based on all the Content Documents (including the Navigation Document).</p></p:documentation>
        
        <p:with-option name="publication-dir" select="$publication-dir"/>
        <p:with-option name="content-dir" select="$content-dir"/>
        <p:with-option name="compatibility-mode" select="$compatibility-mode"/>
        <p:input port="ncc-navigation">
            <p:pipe port="result" step="ncc-navigation"/>
        </p:input>
        <p:input port="content">
            <p:pipe port="content" step="content-without-full-navigation"/>
        </p:input>
    </pxi:daisy202-to-epub3-navigation>

    <pxi:daisy202-to-epub3-mediaoverlay name="mediaoverlay">
        <p:documentation xmlns="http://www.w3.org/1999/xhtml"><p px:role="desc">Convert and copy the content files and SMIL-files.</p></p:documentation>
        
        <p:with-option name="include-mediaoverlay" select="$mediaoverlay"/>
        <p:with-option name="daisy-dir" select="$daisy-dir"/>
        <p:with-option name="publication-dir" select="$publication-dir"/>
        <p:with-option name="content-dir" select="$content-dir"/>
        <p:with-option name="navigation-uri" select="base-uri(/*)">
            <p:pipe port="result" step="ncc-navigation"/>
        </p:with-option>
        <p:input port="daisy-smil">
            <p:pipe port="daisy-smil" step="flow"/>
        </p:input>
        <p:input port="content">
            <p:pipe port="content" step="content-without-full-navigation"/>
        </p:input>
    </pxi:daisy202-to-epub3-mediaoverlay>

    <pxi:daisy202-to-epub3-resources name="resources">
        <p:documentation xmlns="http://www.w3.org/1999/xhtml"><p px:role="desc">Copy all referenced auxilliary resources (audio, stylesheets, images, etc.).</p></p:documentation>
        
        <p:input port="daisy-smil">
            <p:pipe port="daisy-smil" step="flow"/>
        </p:input>
        <p:input port="daisy-content">
            <p:pipe port="content" step="content-without-full-navigation"/>
        </p:input>
        <p:with-option name="include-mediaoverlay-resources" select="$mediaoverlay"/>
        <p:with-option name="content-dir" select="$content-dir"/>
    </pxi:daisy202-to-epub3-resources>
    <p:sink/>

    <pxi:daisy202-to-epub3-package name="package">
        <p:documentation xmlns="http://www.w3.org/1999/xhtml"><p px:role="desc">Make and store the OPF.</p></p:documentation>
        
        <p:input port="spine">
            <p:pipe port="manifest" step="content-without-full-navigation"/>
        </p:input>
        <p:input port="resources">
            <p:pipe port="manifest" step="resources"/>
            <p:pipe port="fileset" step="navigation"/>
        </p:input>
        <p:input port="ncc">
            <p:pipe port="ncc" step="ncc"/>
        </p:input>
        <p:input port="navigation">
            <p:pipe port="navigation" step="navigation"/>
        </p:input>
        <p:input port="content-docs">
            <p:pipe port="content-navfix" step="navigation"/>
        </p:input>
        <p:input port="mediaoverlay">
            <p:pipe port="mediaoverlay" step="mediaoverlay"/>
        </p:input>
        <p:with-option name="pub-id" select="/*/@value">
            <p:pipe port="pub-id" step="ncc"/>
        </p:with-option>
        <p:with-option name="publication-dir" select="$publication-dir"/>
        <p:with-option name="epub-dir" select="$epub-dir"/>
        <p:with-option name="compatibility-mode" select="$compatibility-mode"/>
    </pxi:daisy202-to-epub3-package>
    <p:sink/>

    <p:group name="finalize">
        <p:documentation xmlns="http://www.w3.org/1999/xhtml"><p px:role="desc">Finalize the EPUB3 fileset (i.e. make it ready for zipping).</p></p:documentation>
        
        <p:output port="result" primary="false">
            <p:pipe port="result" step="finalize.result"/>
        </p:output>
        <p:identity name="finalize.store-complete">
            <p:input port="source">
                <p:pipe port="store-complete" step="content-without-full-navigation"/>
                <p:pipe port="store-complete" step="mediaoverlay"/>
                <p:pipe port="manifest" step="resources"/>
                <p:pipe port="store-complete" step="navigation"/>
                <p:pipe port="store-complete" step="package"/>
            </p:input>
        </p:identity>
        <p:sink/>
        <px:epub3-ocf-finalize cx:depends-on="finalize.store-complete" name="finalize.result">
            <p:input port="source">
                <p:pipe port="fileset" step="package"/>
            </p:input>
        </px:epub3-ocf-finalize>
        <cx:message>
            <p:with-option name="message" select="'finalized the EPUB3 fileset'"/>
        </cx:message>
        <p:sink/>
    </p:group>

    <px:epub3-ocf-zip name="zip">
        <p:documentation xmlns="http://www.w3.org/1999/xhtml"><p px:role="desc">Package the EPUB 3 fileset as a ZIP-file (OCF).</p></p:documentation>
        
        <p:input port="source">
            <p:pipe port="result" step="finalize"/>
        </p:input>
        <!--<p:with-option name="target" select="concat(replace($output-dir,'^file:',''),replace(concat(//dc:identifier,' - ',//dc:title,'.epub'),'[/\\?%*:|&quot;&lt;&gt;]',''))">-->
        <p:with-option name="target" select="concat($output-dir,encode-for-uri(replace(concat(//dc:identifier,' - ',//dc:title,'.epub'),'[/\\?%*:|&quot;&lt;&gt;]','')))">
            <p:pipe port="opf-package" step="package"/>
        </p:with-option>
    </px:epub3-ocf-zip>
    <cx:message>
        <p:with-option name="message" select="concat('zipped the EPUB3 fileset as ',/*/@href)"/>
    </cx:message>
    <p:sink/>

</p:declare-step>
