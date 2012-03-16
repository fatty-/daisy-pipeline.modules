<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:h="http://www.w3.org/1999/xhtml"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0"
                exclude-result-prefixes="#all">
                
   <xsl:output indent="yes" method="xml"/>
                
   <xsl:template match="/">
      <xsl:for-each select="*|text()|processing-instruction()|comment()">
         <xsl:copy>
            <xsl:apply-templates select="."/>
         </xsl:copy>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template match="text()|processing-instruction()|comment()">
      <xsl:copy-of select="."/>
   </xsl:template>
                
   <xsl:template name="html" match="h:html">
      <xsl:copy-of select="@manifest|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:head|self::h:body|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('head','body')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='head'">
                              <xsl:call-template name="head"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='body'">
                              <xsl:call-template name="body"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <head xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="head"/>
                     </head>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="head" match="h:head">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:title|self::h:base|self::h:command|self::h:link|self::h:meta|self::h:noscript|self::h:script|self::h:style|self::h:title|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('title','base','command','link','meta','noscript','script','style','title')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='title'">
                              <xsl:call-template name="title"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='base'">
                              <xsl:call-template name="base"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='link'">
                              <xsl:call-template name="link"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meta'">
                              <xsl:call-template name="meta"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='style'">
                              <xsl:call-template name="style"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='title'">
                              <xsl:call-template name="title"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <title xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="title"/>
                     </title>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="title" match="h:title">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:a|self::h:abbr|self::h:area|self::h:map|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:dfn|self::h:em|self::h:embed|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:meter|self::h:noscript|self::h:object|self::h:output|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:textarea|self::h:time|self::h:u|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('a','abbr','area','map','audio','b','bdi','bdo','br','button','canvas','cite','code','command','datalist','del','dfn','em','embed','i','iframe','img','input','ins','kbd','keygen','label','mark','meter','noscript','object','output','progress','q','ruby','s','samp','script','select','small','span','strong','textarea','time','u','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="base" match="h:base">
      <xsl:copy-of select="@href|@target|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:apply-templates select="text()|comment()"/>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="link" match="h:link">
      <xsl:copy-of select="@href|@rel|@media|@hreflang|@type|@sizes|@title|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:apply-templates select="text()|comment()"/>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="meta" match="h:meta">
      <xsl:copy-of select="@name|@http-equiv|@content|@charset|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:apply-templates select="text()|comment()"/>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="style" match="h:style">
      <xsl:copy-of select="@type|@media|@type|@scoped|@title|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:apply-templates select="text()|comment()"/>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="script" match="h:script">
      <xsl:copy-of select="@src|@type|@src|@async|@defer|@type|@charset|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:apply-templates select="text()|comment()"/>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="noscript" match="h:noscript">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:head|self::h:link|self::h:style|self::h:meta|self::h:noscript|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('head','link','style','meta','noscript')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='head'">
                              <xsl:call-template name="head"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='link'">
                              <xsl:call-template name="link"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='style'">
                              <xsl:call-template name="style"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meta'">
                              <xsl:call-template name="meta"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <head xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="head"/>
                     </head>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="body" match="h:body">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:a|self::h:abbr|self::h:address|self::h:area|self::h:map|self::h:article|self::h:aside|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:blockquote|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:details|self::h:dfn|self::h:div|self::h:dl|self::h:em|self::h:embed|self::h:fieldset|self::h:figure|self::h:footer|self::h:form|self::h:header|self::h:hgroup|self::h:hr|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:menu|self::h:meter|self::h:nav|self::h:noscript|self::h:object|self::h:ol|self::h:output|self::h:p|self::h:pre|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:section|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:style|self::h:table|self::h:textarea|self::h:time|self::h:u|self::h:ul|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('a','abbr','address','area','map','article','aside','audio','b','bdi','bdo','blockquote','br','button','canvas','cite','code','command','datalist','del','details','dfn','div','dl','em','embed','fieldset','figure','footer','form','header','hgroup','hr','i','iframe','img','input','ins','kbd','keygen','label','mark','menu','meter','nav','noscript','object','ol','output','p','pre','progress','q','ruby','s','samp','script','section','select','small','span','strong','style','table','textarea','time','u','ul','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='address'">
                              <xsl:call-template name="address"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='article'">
                              <xsl:call-template name="article"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='aside'">
                              <xsl:call-template name="aside"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='blockquote'">
                              <xsl:call-template name="blockquote"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='details'">
                              <xsl:call-template name="details"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='div'">
                              <xsl:call-template name="div"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dl'">
                              <xsl:call-template name="dl"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='fieldset'">
                              <xsl:call-template name="fieldset"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='figure'">
                              <xsl:call-template name="figure"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='footer'">
                              <xsl:call-template name="footer"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='form'">
                              <xsl:call-template name="form"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='header'">
                              <xsl:call-template name="header"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='hgroup'">
                              <xsl:call-template name="hgroup"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='hr'">
                              <xsl:call-template name="hr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='menu'">
                              <xsl:call-template name="menu"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='nav'">
                              <xsl:call-template name="nav"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ol'">
                              <xsl:call-template name="ol"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='p'">
                              <xsl:call-template name="p"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='pre'">
                              <xsl:call-template name="pre"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='section'">
                              <xsl:call-template name="section"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='style'">
                              <xsl:call-template name="style"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='table'">
                              <xsl:call-template name="table"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ul'">
                              <xsl:call-template name="ul"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="section" match="h:section">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:a|self::h:abbr|self::h:address|self::h:area|self::h:map|self::h:article|self::h:aside|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:blockquote|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:details|self::h:dfn|self::h:div|self::h:dl|self::h:em|self::h:embed|self::h:fieldset|self::h:figure|self::h:footer|self::h:form|self::h:header|self::h:hgroup|self::h:hr|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:menu|self::h:meter|self::h:nav|self::h:noscript|self::h:object|self::h:ol|self::h:output|self::h:p|self::h:pre|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:section|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:style|self::h:table|self::h:textarea|self::h:time|self::h:u|self::h:ul|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('a','abbr','address','area','map','article','aside','audio','b','bdi','bdo','blockquote','br','button','canvas','cite','code','command','datalist','del','details','dfn','div','dl','em','embed','fieldset','figure','footer','form','header','hgroup','hr','i','iframe','img','input','ins','kbd','keygen','label','mark','menu','meter','nav','noscript','object','ol','output','p','pre','progress','q','ruby','s','samp','script','section','select','small','span','strong','style','table','textarea','time','u','ul','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='address'">
                              <xsl:call-template name="address"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='article'">
                              <xsl:call-template name="article"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='aside'">
                              <xsl:call-template name="aside"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='blockquote'">
                              <xsl:call-template name="blockquote"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='details'">
                              <xsl:call-template name="details"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='div'">
                              <xsl:call-template name="div"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dl'">
                              <xsl:call-template name="dl"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='fieldset'">
                              <xsl:call-template name="fieldset"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='figure'">
                              <xsl:call-template name="figure"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='footer'">
                              <xsl:call-template name="footer"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='form'">
                              <xsl:call-template name="form"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='header'">
                              <xsl:call-template name="header"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='hgroup'">
                              <xsl:call-template name="hgroup"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='hr'">
                              <xsl:call-template name="hr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='menu'">
                              <xsl:call-template name="menu"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='nav'">
                              <xsl:call-template name="nav"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ol'">
                              <xsl:call-template name="ol"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='p'">
                              <xsl:call-template name="p"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='pre'">
                              <xsl:call-template name="pre"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='section'">
                              <xsl:call-template name="section"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='style'">
                              <xsl:call-template name="style"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='table'">
                              <xsl:call-template name="table"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ul'">
                              <xsl:call-template name="ul"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="nav" match="h:nav">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:a|self::h:abbr|self::h:address|self::h:area|self::h:map|self::h:article|self::h:aside|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:blockquote|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:details|self::h:dfn|self::h:div|self::h:dl|self::h:em|self::h:embed|self::h:fieldset|self::h:figure|self::h:footer|self::h:form|self::h:header|self::h:hgroup|self::h:hr|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:menu|self::h:meter|self::h:nav|self::h:noscript|self::h:object|self::h:ol|self::h:output|self::h:p|self::h:pre|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:section|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:style|self::h:table|self::h:textarea|self::h:time|self::h:u|self::h:ul|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('a','abbr','address','area','map','article','aside','audio','b','bdi','bdo','blockquote','br','button','canvas','cite','code','command','datalist','del','details','dfn','div','dl','em','embed','fieldset','figure','footer','form','header','hgroup','hr','i','iframe','img','input','ins','kbd','keygen','label','mark','menu','meter','nav','noscript','object','ol','output','p','pre','progress','q','ruby','s','samp','script','section','select','small','span','strong','style','table','textarea','time','u','ul','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='address'">
                              <xsl:call-template name="address"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='article'">
                              <xsl:call-template name="article"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='aside'">
                              <xsl:call-template name="aside"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='blockquote'">
                              <xsl:call-template name="blockquote"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='details'">
                              <xsl:call-template name="details"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='div'">
                              <xsl:call-template name="div"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dl'">
                              <xsl:call-template name="dl"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='fieldset'">
                              <xsl:call-template name="fieldset"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='figure'">
                              <xsl:call-template name="figure"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='footer'">
                              <xsl:call-template name="footer"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='form'">
                              <xsl:call-template name="form"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='header'">
                              <xsl:call-template name="header"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='hgroup'">
                              <xsl:call-template name="hgroup"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='hr'">
                              <xsl:call-template name="hr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='menu'">
                              <xsl:call-template name="menu"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='nav'">
                              <xsl:call-template name="nav"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ol'">
                              <xsl:call-template name="ol"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='p'">
                              <xsl:call-template name="p"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='pre'">
                              <xsl:call-template name="pre"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='section'">
                              <xsl:call-template name="section"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='style'">
                              <xsl:call-template name="style"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='table'">
                              <xsl:call-template name="table"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ul'">
                              <xsl:call-template name="ul"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="article" match="h:article">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:a|self::h:abbr|self::h:address|self::h:area|self::h:map|self::h:article|self::h:aside|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:blockquote|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:details|self::h:dfn|self::h:div|self::h:dl|self::h:em|self::h:embed|self::h:fieldset|self::h:figure|self::h:footer|self::h:form|self::h:header|self::h:hgroup|self::h:hr|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:menu|self::h:meter|self::h:nav|self::h:noscript|self::h:object|self::h:ol|self::h:output|self::h:p|self::h:pre|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:section|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:style|self::h:table|self::h:textarea|self::h:time|self::h:u|self::h:ul|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('a','abbr','address','area','map','article','aside','audio','b','bdi','bdo','blockquote','br','button','canvas','cite','code','command','datalist','del','details','dfn','div','dl','em','embed','fieldset','figure','footer','form','header','hgroup','hr','i','iframe','img','input','ins','kbd','keygen','label','mark','menu','meter','nav','noscript','object','ol','output','p','pre','progress','q','ruby','s','samp','script','section','select','small','span','strong','style','table','textarea','time','u','ul','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='address'">
                              <xsl:call-template name="address"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='article'">
                              <xsl:call-template name="article"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='aside'">
                              <xsl:call-template name="aside"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='blockquote'">
                              <xsl:call-template name="blockquote"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='details'">
                              <xsl:call-template name="details"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='div'">
                              <xsl:call-template name="div"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dl'">
                              <xsl:call-template name="dl"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='fieldset'">
                              <xsl:call-template name="fieldset"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='figure'">
                              <xsl:call-template name="figure"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='footer'">
                              <xsl:call-template name="footer"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='form'">
                              <xsl:call-template name="form"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='header'">
                              <xsl:call-template name="header"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='hgroup'">
                              <xsl:call-template name="hgroup"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='hr'">
                              <xsl:call-template name="hr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='menu'">
                              <xsl:call-template name="menu"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='nav'">
                              <xsl:call-template name="nav"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ol'">
                              <xsl:call-template name="ol"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='p'">
                              <xsl:call-template name="p"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='pre'">
                              <xsl:call-template name="pre"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='section'">
                              <xsl:call-template name="section"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='style'">
                              <xsl:call-template name="style"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='table'">
                              <xsl:call-template name="table"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ul'">
                              <xsl:call-template name="ul"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="aside" match="h:aside">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:a|self::h:abbr|self::h:address|self::h:area|self::h:map|self::h:article|self::h:aside|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:blockquote|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:details|self::h:dfn|self::h:div|self::h:dl|self::h:em|self::h:embed|self::h:fieldset|self::h:figure|self::h:footer|self::h:form|self::h:header|self::h:hgroup|self::h:hr|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:menu|self::h:meter|self::h:nav|self::h:noscript|self::h:object|self::h:ol|self::h:output|self::h:p|self::h:pre|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:section|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:style|self::h:table|self::h:textarea|self::h:time|self::h:u|self::h:ul|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('a','abbr','address','area','map','article','aside','audio','b','bdi','bdo','blockquote','br','button','canvas','cite','code','command','datalist','del','details','dfn','div','dl','em','embed','fieldset','figure','footer','form','header','hgroup','hr','i','iframe','img','input','ins','kbd','keygen','label','mark','menu','meter','nav','noscript','object','ol','output','p','pre','progress','q','ruby','s','samp','script','section','select','small','span','strong','style','table','textarea','time','u','ul','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='address'">
                              <xsl:call-template name="address"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='article'">
                              <xsl:call-template name="article"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='aside'">
                              <xsl:call-template name="aside"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='blockquote'">
                              <xsl:call-template name="blockquote"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='details'">
                              <xsl:call-template name="details"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='div'">
                              <xsl:call-template name="div"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dl'">
                              <xsl:call-template name="dl"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='fieldset'">
                              <xsl:call-template name="fieldset"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='figure'">
                              <xsl:call-template name="figure"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='footer'">
                              <xsl:call-template name="footer"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='form'">
                              <xsl:call-template name="form"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='header'">
                              <xsl:call-template name="header"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='hgroup'">
                              <xsl:call-template name="hgroup"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='hr'">
                              <xsl:call-template name="hr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='menu'">
                              <xsl:call-template name="menu"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='nav'">
                              <xsl:call-template name="nav"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ol'">
                              <xsl:call-template name="ol"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='p'">
                              <xsl:call-template name="p"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='pre'">
                              <xsl:call-template name="pre"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='section'">
                              <xsl:call-template name="section"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='style'">
                              <xsl:call-template name="style"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='table'">
                              <xsl:call-template name="table"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ul'">
                              <xsl:call-template name="ul"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="hgroup" match="h:hgroup">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:apply-templates select="text()|comment()"/>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="header" match="h:header">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:header|self::h:footer|self::h:a|self::h:abbr|self::h:address|self::h:area|self::h:map|self::h:article|self::h:aside|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:blockquote|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:details|self::h:dfn|self::h:div|self::h:dl|self::h:em|self::h:embed|self::h:fieldset|self::h:figure|self::h:footer|self::h:form|self::h:header|self::h:hgroup|self::h:hr|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:menu|self::h:meter|self::h:nav|self::h:noscript|self::h:object|self::h:ol|self::h:output|self::h:p|self::h:pre|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:section|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:style|self::h:table|self::h:textarea|self::h:time|self::h:u|self::h:ul|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('header','footer','a','abbr','address','area','map','article','aside','audio','b','bdi','bdo','blockquote','br','button','canvas','cite','code','command','datalist','del','details','dfn','div','dl','em','embed','fieldset','figure','footer','form','header','hgroup','hr','i','iframe','img','input','ins','kbd','keygen','label','mark','menu','meter','nav','noscript','object','ol','output','p','pre','progress','q','ruby','s','samp','script','section','select','small','span','strong','style','table','textarea','time','u','ul','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='header'">
                              <xsl:call-template name="header"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='footer'">
                              <xsl:call-template name="footer"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='address'">
                              <xsl:call-template name="address"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='article'">
                              <xsl:call-template name="article"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='aside'">
                              <xsl:call-template name="aside"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='blockquote'">
                              <xsl:call-template name="blockquote"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='details'">
                              <xsl:call-template name="details"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='div'">
                              <xsl:call-template name="div"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dl'">
                              <xsl:call-template name="dl"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='fieldset'">
                              <xsl:call-template name="fieldset"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='figure'">
                              <xsl:call-template name="figure"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='footer'">
                              <xsl:call-template name="footer"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='form'">
                              <xsl:call-template name="form"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='header'">
                              <xsl:call-template name="header"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='hgroup'">
                              <xsl:call-template name="hgroup"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='hr'">
                              <xsl:call-template name="hr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='menu'">
                              <xsl:call-template name="menu"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='nav'">
                              <xsl:call-template name="nav"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ol'">
                              <xsl:call-template name="ol"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='p'">
                              <xsl:call-template name="p"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='pre'">
                              <xsl:call-template name="pre"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='section'">
                              <xsl:call-template name="section"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='style'">
                              <xsl:call-template name="style"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='table'">
                              <xsl:call-template name="table"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ul'">
                              <xsl:call-template name="ul"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="footer" match="h:footer">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:header|self::h:footer|self::h:a|self::h:abbr|self::h:address|self::h:area|self::h:map|self::h:article|self::h:aside|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:blockquote|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:details|self::h:dfn|self::h:div|self::h:dl|self::h:em|self::h:embed|self::h:fieldset|self::h:figure|self::h:footer|self::h:form|self::h:header|self::h:hgroup|self::h:hr|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:menu|self::h:meter|self::h:nav|self::h:noscript|self::h:object|self::h:ol|self::h:output|self::h:p|self::h:pre|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:section|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:style|self::h:table|self::h:textarea|self::h:time|self::h:u|self::h:ul|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('header','footer','a','abbr','address','area','map','article','aside','audio','b','bdi','bdo','blockquote','br','button','canvas','cite','code','command','datalist','del','details','dfn','div','dl','em','embed','fieldset','figure','footer','form','header','hgroup','hr','i','iframe','img','input','ins','kbd','keygen','label','mark','menu','meter','nav','noscript','object','ol','output','p','pre','progress','q','ruby','s','samp','script','section','select','small','span','strong','style','table','textarea','time','u','ul','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='header'">
                              <xsl:call-template name="header"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='footer'">
                              <xsl:call-template name="footer"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='address'">
                              <xsl:call-template name="address"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='article'">
                              <xsl:call-template name="article"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='aside'">
                              <xsl:call-template name="aside"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='blockquote'">
                              <xsl:call-template name="blockquote"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='details'">
                              <xsl:call-template name="details"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='div'">
                              <xsl:call-template name="div"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dl'">
                              <xsl:call-template name="dl"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='fieldset'">
                              <xsl:call-template name="fieldset"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='figure'">
                              <xsl:call-template name="figure"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='footer'">
                              <xsl:call-template name="footer"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='form'">
                              <xsl:call-template name="form"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='header'">
                              <xsl:call-template name="header"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='hgroup'">
                              <xsl:call-template name="hgroup"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='hr'">
                              <xsl:call-template name="hr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='menu'">
                              <xsl:call-template name="menu"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='nav'">
                              <xsl:call-template name="nav"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ol'">
                              <xsl:call-template name="ol"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='p'">
                              <xsl:call-template name="p"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='pre'">
                              <xsl:call-template name="pre"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='section'">
                              <xsl:call-template name="section"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='style'">
                              <xsl:call-template name="style"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='table'">
                              <xsl:call-template name="table"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ul'">
                              <xsl:call-template name="ul"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="address" match="h:address">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:header|self::h:footer|self::h:address|self::h:a|self::h:abbr|self::h:address|self::h:area|self::h:map|self::h:article|self::h:aside|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:blockquote|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:details|self::h:dfn|self::h:div|self::h:dl|self::h:em|self::h:embed|self::h:fieldset|self::h:figure|self::h:footer|self::h:form|self::h:header|self::h:hgroup|self::h:hr|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:menu|self::h:meter|self::h:nav|self::h:noscript|self::h:object|self::h:ol|self::h:output|self::h:p|self::h:pre|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:section|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:style|self::h:table|self::h:textarea|self::h:time|self::h:u|self::h:ul|self::h:var|self::h:video|self::h:wbr|self::h:hgroup|self::h:article|self::h:aside|self::h:nav|self::h:section|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('header','footer','address','a','abbr','address','area','map','article','aside','audio','b','bdi','bdo','blockquote','br','button','canvas','cite','code','command','datalist','del','details','dfn','div','dl','em','embed','fieldset','figure','footer','form','header','hgroup','hr','i','iframe','img','input','ins','kbd','keygen','label','mark','menu','meter','nav','noscript','object','ol','output','p','pre','progress','q','ruby','s','samp','script','section','select','small','span','strong','style','table','textarea','time','u','ul','var','video','wbr','hgroup','article','aside','nav','section')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='header'">
                              <xsl:call-template name="header"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='footer'">
                              <xsl:call-template name="footer"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='address'">
                              <xsl:call-template name="address"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='address'">
                              <xsl:call-template name="address"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='article'">
                              <xsl:call-template name="article"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='aside'">
                              <xsl:call-template name="aside"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='blockquote'">
                              <xsl:call-template name="blockquote"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='details'">
                              <xsl:call-template name="details"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='div'">
                              <xsl:call-template name="div"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dl'">
                              <xsl:call-template name="dl"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='fieldset'">
                              <xsl:call-template name="fieldset"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='figure'">
                              <xsl:call-template name="figure"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='footer'">
                              <xsl:call-template name="footer"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='form'">
                              <xsl:call-template name="form"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='header'">
                              <xsl:call-template name="header"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='hgroup'">
                              <xsl:call-template name="hgroup"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='hr'">
                              <xsl:call-template name="hr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='menu'">
                              <xsl:call-template name="menu"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='nav'">
                              <xsl:call-template name="nav"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ol'">
                              <xsl:call-template name="ol"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='p'">
                              <xsl:call-template name="p"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='pre'">
                              <xsl:call-template name="pre"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='section'">
                              <xsl:call-template name="section"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='style'">
                              <xsl:call-template name="style"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='table'">
                              <xsl:call-template name="table"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ul'">
                              <xsl:call-template name="ul"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='hgroup'">
                              <xsl:call-template name="hgroup"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='article'">
                              <xsl:call-template name="article"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='aside'">
                              <xsl:call-template name="aside"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='nav'">
                              <xsl:call-template name="nav"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='section'">
                              <xsl:call-template name="section"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="p" match="h:p">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:a|self::h:abbr|self::h:area|self::h:map|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:dfn|self::h:em|self::h:embed|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:meter|self::h:noscript|self::h:object|self::h:output|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:textarea|self::h:time|self::h:u|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('a','abbr','area','map','audio','b','bdi','bdo','br','button','canvas','cite','code','command','datalist','del','dfn','em','embed','i','iframe','img','input','ins','kbd','keygen','label','mark','meter','noscript','object','output','progress','q','ruby','s','samp','script','select','small','span','strong','textarea','time','u','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="hr" match="h:hr">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:apply-templates select="text()|comment()"/>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="pre" match="h:pre">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:a|self::h:abbr|self::h:area|self::h:map|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:dfn|self::h:em|self::h:embed|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:meter|self::h:noscript|self::h:object|self::h:output|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:textarea|self::h:time|self::h:u|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('a','abbr','area','map','audio','b','bdi','bdo','br','button','canvas','cite','code','command','datalist','del','dfn','em','embed','i','iframe','img','input','ins','kbd','keygen','label','mark','meter','noscript','object','output','progress','q','ruby','s','samp','script','select','small','span','strong','textarea','time','u','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="blockquote" match="h:blockquote">
      <xsl:copy-of select="@cite|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:a|self::h:abbr|self::h:address|self::h:area|self::h:map|self::h:article|self::h:aside|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:blockquote|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:details|self::h:dfn|self::h:div|self::h:dl|self::h:em|self::h:embed|self::h:fieldset|self::h:figure|self::h:footer|self::h:form|self::h:header|self::h:hgroup|self::h:hr|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:menu|self::h:meter|self::h:nav|self::h:noscript|self::h:object|self::h:ol|self::h:output|self::h:p|self::h:pre|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:section|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:style|self::h:table|self::h:textarea|self::h:time|self::h:u|self::h:ul|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('a','abbr','address','area','map','article','aside','audio','b','bdi','bdo','blockquote','br','button','canvas','cite','code','command','datalist','del','details','dfn','div','dl','em','embed','fieldset','figure','footer','form','header','hgroup','hr','i','iframe','img','input','ins','kbd','keygen','label','mark','menu','meter','nav','noscript','object','ol','output','p','pre','progress','q','ruby','s','samp','script','section','select','small','span','strong','style','table','textarea','time','u','ul','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='address'">
                              <xsl:call-template name="address"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='article'">
                              <xsl:call-template name="article"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='aside'">
                              <xsl:call-template name="aside"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='blockquote'">
                              <xsl:call-template name="blockquote"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='details'">
                              <xsl:call-template name="details"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='div'">
                              <xsl:call-template name="div"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dl'">
                              <xsl:call-template name="dl"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='fieldset'">
                              <xsl:call-template name="fieldset"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='figure'">
                              <xsl:call-template name="figure"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='footer'">
                              <xsl:call-template name="footer"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='form'">
                              <xsl:call-template name="form"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='header'">
                              <xsl:call-template name="header"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='hgroup'">
                              <xsl:call-template name="hgroup"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='hr'">
                              <xsl:call-template name="hr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='menu'">
                              <xsl:call-template name="menu"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='nav'">
                              <xsl:call-template name="nav"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ol'">
                              <xsl:call-template name="ol"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='p'">
                              <xsl:call-template name="p"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='pre'">
                              <xsl:call-template name="pre"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='section'">
                              <xsl:call-template name="section"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='style'">
                              <xsl:call-template name="style"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='table'">
                              <xsl:call-template name="table"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ul'">
                              <xsl:call-template name="ul"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="ol" match="h:ol">
      <xsl:copy-of select="@reversed|@start|@type|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:li|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('li')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='li'">
                              <xsl:call-template name="li"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <li xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="li"/>
                     </li>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="ul" match="h:ul">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:li|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('li')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='li'">
                              <xsl:call-template name="li"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <li xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="li"/>
                     </li>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="li" match="h:li">
      <xsl:copy-of select="@value|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:ol|self::h:a|self::h:abbr|self::h:address|self::h:area|self::h:map|self::h:article|self::h:aside|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:blockquote|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:details|self::h:dfn|self::h:div|self::h:dl|self::h:em|self::h:embed|self::h:fieldset|self::h:figure|self::h:footer|self::h:form|self::h:header|self::h:hgroup|self::h:hr|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:menu|self::h:meter|self::h:nav|self::h:noscript|self::h:object|self::h:ol|self::h:output|self::h:p|self::h:pre|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:section|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:style|self::h:table|self::h:textarea|self::h:time|self::h:u|self::h:ul|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('ol','a','abbr','address','area','map','article','aside','audio','b','bdi','bdo','blockquote','br','button','canvas','cite','code','command','datalist','del','details','dfn','div','dl','em','embed','fieldset','figure','footer','form','header','hgroup','hr','i','iframe','img','input','ins','kbd','keygen','label','mark','menu','meter','nav','noscript','object','ol','output','p','pre','progress','q','ruby','s','samp','script','section','select','small','span','strong','style','table','textarea','time','u','ul','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='ol'">
                              <xsl:call-template name="ol"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='address'">
                              <xsl:call-template name="address"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='article'">
                              <xsl:call-template name="article"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='aside'">
                              <xsl:call-template name="aside"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='blockquote'">
                              <xsl:call-template name="blockquote"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='details'">
                              <xsl:call-template name="details"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='div'">
                              <xsl:call-template name="div"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dl'">
                              <xsl:call-template name="dl"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='fieldset'">
                              <xsl:call-template name="fieldset"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='figure'">
                              <xsl:call-template name="figure"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='footer'">
                              <xsl:call-template name="footer"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='form'">
                              <xsl:call-template name="form"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='header'">
                              <xsl:call-template name="header"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='hgroup'">
                              <xsl:call-template name="hgroup"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='hr'">
                              <xsl:call-template name="hr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='menu'">
                              <xsl:call-template name="menu"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='nav'">
                              <xsl:call-template name="nav"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ol'">
                              <xsl:call-template name="ol"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='p'">
                              <xsl:call-template name="p"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='pre'">
                              <xsl:call-template name="pre"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='section'">
                              <xsl:call-template name="section"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='style'">
                              <xsl:call-template name="style"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='table'">
                              <xsl:call-template name="table"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ul'">
                              <xsl:call-template name="ul"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="dl" match="h:dl">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:dt|self::h:dd|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('dt','dd')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='dt'">
                              <xsl:call-template name="dt"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dd'">
                              <xsl:call-template name="dd"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <dt xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="dt"/>
                     </dt>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="dt" match="h:dt">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:header|self::h:footer|self::h:a|self::h:abbr|self::h:address|self::h:area|self::h:map|self::h:article|self::h:aside|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:blockquote|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:details|self::h:dfn|self::h:div|self::h:dl|self::h:em|self::h:embed|self::h:fieldset|self::h:figure|self::h:footer|self::h:form|self::h:header|self::h:hgroup|self::h:hr|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:menu|self::h:meter|self::h:nav|self::h:noscript|self::h:object|self::h:ol|self::h:output|self::h:p|self::h:pre|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:section|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:style|self::h:table|self::h:textarea|self::h:time|self::h:u|self::h:ul|self::h:var|self::h:video|self::h:wbr|self::h:hgroup|self::h:article|self::h:aside|self::h:nav|self::h:section|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('header','footer','a','abbr','address','area','map','article','aside','audio','b','bdi','bdo','blockquote','br','button','canvas','cite','code','command','datalist','del','details','dfn','div','dl','em','embed','fieldset','figure','footer','form','header','hgroup','hr','i','iframe','img','input','ins','kbd','keygen','label','mark','menu','meter','nav','noscript','object','ol','output','p','pre','progress','q','ruby','s','samp','script','section','select','small','span','strong','style','table','textarea','time','u','ul','var','video','wbr','hgroup','article','aside','nav','section')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='header'">
                              <xsl:call-template name="header"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='footer'">
                              <xsl:call-template name="footer"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='address'">
                              <xsl:call-template name="address"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='article'">
                              <xsl:call-template name="article"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='aside'">
                              <xsl:call-template name="aside"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='blockquote'">
                              <xsl:call-template name="blockquote"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='details'">
                              <xsl:call-template name="details"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='div'">
                              <xsl:call-template name="div"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dl'">
                              <xsl:call-template name="dl"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='fieldset'">
                              <xsl:call-template name="fieldset"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='figure'">
                              <xsl:call-template name="figure"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='footer'">
                              <xsl:call-template name="footer"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='form'">
                              <xsl:call-template name="form"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='header'">
                              <xsl:call-template name="header"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='hgroup'">
                              <xsl:call-template name="hgroup"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='hr'">
                              <xsl:call-template name="hr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='menu'">
                              <xsl:call-template name="menu"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='nav'">
                              <xsl:call-template name="nav"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ol'">
                              <xsl:call-template name="ol"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='p'">
                              <xsl:call-template name="p"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='pre'">
                              <xsl:call-template name="pre"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='section'">
                              <xsl:call-template name="section"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='style'">
                              <xsl:call-template name="style"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='table'">
                              <xsl:call-template name="table"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ul'">
                              <xsl:call-template name="ul"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='hgroup'">
                              <xsl:call-template name="hgroup"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='article'">
                              <xsl:call-template name="article"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='aside'">
                              <xsl:call-template name="aside"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='nav'">
                              <xsl:call-template name="nav"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='section'">
                              <xsl:call-template name="section"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="dd" match="h:dd">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:a|self::h:abbr|self::h:address|self::h:area|self::h:map|self::h:article|self::h:aside|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:blockquote|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:details|self::h:dfn|self::h:div|self::h:dl|self::h:em|self::h:embed|self::h:fieldset|self::h:figure|self::h:footer|self::h:form|self::h:header|self::h:hgroup|self::h:hr|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:menu|self::h:meter|self::h:nav|self::h:noscript|self::h:object|self::h:ol|self::h:output|self::h:p|self::h:pre|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:section|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:style|self::h:table|self::h:textarea|self::h:time|self::h:u|self::h:ul|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('a','abbr','address','area','map','article','aside','audio','b','bdi','bdo','blockquote','br','button','canvas','cite','code','command','datalist','del','details','dfn','div','dl','em','embed','fieldset','figure','footer','form','header','hgroup','hr','i','iframe','img','input','ins','kbd','keygen','label','mark','menu','meter','nav','noscript','object','ol','output','p','pre','progress','q','ruby','s','samp','script','section','select','small','span','strong','style','table','textarea','time','u','ul','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='address'">
                              <xsl:call-template name="address"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='article'">
                              <xsl:call-template name="article"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='aside'">
                              <xsl:call-template name="aside"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='blockquote'">
                              <xsl:call-template name="blockquote"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='details'">
                              <xsl:call-template name="details"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='div'">
                              <xsl:call-template name="div"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dl'">
                              <xsl:call-template name="dl"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='fieldset'">
                              <xsl:call-template name="fieldset"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='figure'">
                              <xsl:call-template name="figure"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='footer'">
                              <xsl:call-template name="footer"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='form'">
                              <xsl:call-template name="form"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='header'">
                              <xsl:call-template name="header"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='hgroup'">
                              <xsl:call-template name="hgroup"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='hr'">
                              <xsl:call-template name="hr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='menu'">
                              <xsl:call-template name="menu"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='nav'">
                              <xsl:call-template name="nav"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ol'">
                              <xsl:call-template name="ol"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='p'">
                              <xsl:call-template name="p"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='pre'">
                              <xsl:call-template name="pre"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='section'">
                              <xsl:call-template name="section"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='style'">
                              <xsl:call-template name="style"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='table'">
                              <xsl:call-template name="table"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ul'">
                              <xsl:call-template name="ul"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="figure" match="h:figure">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:figcaption|self::h:a|self::h:abbr|self::h:address|self::h:area|self::h:map|self::h:article|self::h:aside|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:blockquote|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:details|self::h:dfn|self::h:div|self::h:dl|self::h:em|self::h:embed|self::h:fieldset|self::h:figure|self::h:footer|self::h:form|self::h:header|self::h:hgroup|self::h:hr|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:menu|self::h:meter|self::h:nav|self::h:noscript|self::h:object|self::h:ol|self::h:output|self::h:p|self::h:pre|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:section|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:style|self::h:table|self::h:textarea|self::h:time|self::h:u|self::h:ul|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('figcaption','a','abbr','address','area','map','article','aside','audio','b','bdi','bdo','blockquote','br','button','canvas','cite','code','command','datalist','del','details','dfn','div','dl','em','embed','fieldset','figure','footer','form','header','hgroup','hr','i','iframe','img','input','ins','kbd','keygen','label','mark','menu','meter','nav','noscript','object','ol','output','p','pre','progress','q','ruby','s','samp','script','section','select','small','span','strong','style','table','textarea','time','u','ul','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='figcaption'">
                              <xsl:call-template name="figcaption"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='address'">
                              <xsl:call-template name="address"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='article'">
                              <xsl:call-template name="article"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='aside'">
                              <xsl:call-template name="aside"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='blockquote'">
                              <xsl:call-template name="blockquote"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='details'">
                              <xsl:call-template name="details"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='div'">
                              <xsl:call-template name="div"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dl'">
                              <xsl:call-template name="dl"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='fieldset'">
                              <xsl:call-template name="fieldset"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='figure'">
                              <xsl:call-template name="figure"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='footer'">
                              <xsl:call-template name="footer"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='form'">
                              <xsl:call-template name="form"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='header'">
                              <xsl:call-template name="header"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='hgroup'">
                              <xsl:call-template name="hgroup"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='hr'">
                              <xsl:call-template name="hr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='menu'">
                              <xsl:call-template name="menu"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='nav'">
                              <xsl:call-template name="nav"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ol'">
                              <xsl:call-template name="ol"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='p'">
                              <xsl:call-template name="p"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='pre'">
                              <xsl:call-template name="pre"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='section'">
                              <xsl:call-template name="section"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='style'">
                              <xsl:call-template name="style"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='table'">
                              <xsl:call-template name="table"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ul'">
                              <xsl:call-template name="ul"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="figcaption" match="h:figcaption">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:a|self::h:abbr|self::h:address|self::h:area|self::h:map|self::h:article|self::h:aside|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:blockquote|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:details|self::h:dfn|self::h:div|self::h:dl|self::h:em|self::h:embed|self::h:fieldset|self::h:figure|self::h:footer|self::h:form|self::h:header|self::h:hgroup|self::h:hr|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:menu|self::h:meter|self::h:nav|self::h:noscript|self::h:object|self::h:ol|self::h:output|self::h:p|self::h:pre|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:section|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:style|self::h:table|self::h:textarea|self::h:time|self::h:u|self::h:ul|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('a','abbr','address','area','map','article','aside','audio','b','bdi','bdo','blockquote','br','button','canvas','cite','code','command','datalist','del','details','dfn','div','dl','em','embed','fieldset','figure','footer','form','header','hgroup','hr','i','iframe','img','input','ins','kbd','keygen','label','mark','menu','meter','nav','noscript','object','ol','output','p','pre','progress','q','ruby','s','samp','script','section','select','small','span','strong','style','table','textarea','time','u','ul','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='address'">
                              <xsl:call-template name="address"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='article'">
                              <xsl:call-template name="article"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='aside'">
                              <xsl:call-template name="aside"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='blockquote'">
                              <xsl:call-template name="blockquote"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='details'">
                              <xsl:call-template name="details"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='div'">
                              <xsl:call-template name="div"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dl'">
                              <xsl:call-template name="dl"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='fieldset'">
                              <xsl:call-template name="fieldset"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='figure'">
                              <xsl:call-template name="figure"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='footer'">
                              <xsl:call-template name="footer"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='form'">
                              <xsl:call-template name="form"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='header'">
                              <xsl:call-template name="header"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='hgroup'">
                              <xsl:call-template name="hgroup"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='hr'">
                              <xsl:call-template name="hr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='menu'">
                              <xsl:call-template name="menu"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='nav'">
                              <xsl:call-template name="nav"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ol'">
                              <xsl:call-template name="ol"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='p'">
                              <xsl:call-template name="p"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='pre'">
                              <xsl:call-template name="pre"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='section'">
                              <xsl:call-template name="section"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='style'">
                              <xsl:call-template name="style"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='table'">
                              <xsl:call-template name="table"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ul'">
                              <xsl:call-template name="ul"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="div" match="h:div">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:a|self::h:abbr|self::h:address|self::h:area|self::h:map|self::h:article|self::h:aside|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:blockquote|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:details|self::h:dfn|self::h:div|self::h:dl|self::h:em|self::h:embed|self::h:fieldset|self::h:figure|self::h:footer|self::h:form|self::h:header|self::h:hgroup|self::h:hr|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:menu|self::h:meter|self::h:nav|self::h:noscript|self::h:object|self::h:ol|self::h:output|self::h:p|self::h:pre|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:section|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:style|self::h:table|self::h:textarea|self::h:time|self::h:u|self::h:ul|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('a','abbr','address','area','map','article','aside','audio','b','bdi','bdo','blockquote','br','button','canvas','cite','code','command','datalist','del','details','dfn','div','dl','em','embed','fieldset','figure','footer','form','header','hgroup','hr','i','iframe','img','input','ins','kbd','keygen','label','mark','menu','meter','nav','noscript','object','ol','output','p','pre','progress','q','ruby','s','samp','script','section','select','small','span','strong','style','table','textarea','time','u','ul','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='address'">
                              <xsl:call-template name="address"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='article'">
                              <xsl:call-template name="article"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='aside'">
                              <xsl:call-template name="aside"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='blockquote'">
                              <xsl:call-template name="blockquote"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='details'">
                              <xsl:call-template name="details"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='div'">
                              <xsl:call-template name="div"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dl'">
                              <xsl:call-template name="dl"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='fieldset'">
                              <xsl:call-template name="fieldset"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='figure'">
                              <xsl:call-template name="figure"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='footer'">
                              <xsl:call-template name="footer"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='form'">
                              <xsl:call-template name="form"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='header'">
                              <xsl:call-template name="header"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='hgroup'">
                              <xsl:call-template name="hgroup"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='hr'">
                              <xsl:call-template name="hr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='menu'">
                              <xsl:call-template name="menu"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='nav'">
                              <xsl:call-template name="nav"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ol'">
                              <xsl:call-template name="ol"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='p'">
                              <xsl:call-template name="p"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='pre'">
                              <xsl:call-template name="pre"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='section'">
                              <xsl:call-template name="section"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='style'">
                              <xsl:call-template name="style"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='table'">
                              <xsl:call-template name="table"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ul'">
                              <xsl:call-template name="ul"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="a" match="h:a">
      <xsl:copy-of select="@href|@target|@rel|@media|@hreflang|@type|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:a|self::h:audio|self::h:button|self::h:details|self::h:embed|self::h:iframe|self::h:img|self::h:input|self::h:keygen|self::h:label|self::h:menu|self::h:object|self::h:select|self::h:textarea|self::h:video|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('a','audio','button','details','embed','iframe','img','input','keygen','label','menu','object','select','textarea','video')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='details'">
                              <xsl:call-template name="details"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='menu'">
                              <xsl:call-template name="menu"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <a xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="a"/>
                     </a>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="em" match="h:em">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:a|self::h:abbr|self::h:area|self::h:map|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:dfn|self::h:em|self::h:embed|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:meter|self::h:noscript|self::h:object|self::h:output|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:textarea|self::h:time|self::h:u|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('a','abbr','area','map','audio','b','bdi','bdo','br','button','canvas','cite','code','command','datalist','del','dfn','em','embed','i','iframe','img','input','ins','kbd','keygen','label','mark','meter','noscript','object','output','progress','q','ruby','s','samp','script','select','small','span','strong','textarea','time','u','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="strong" match="h:strong">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:a|self::h:abbr|self::h:area|self::h:map|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:dfn|self::h:em|self::h:embed|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:meter|self::h:noscript|self::h:object|self::h:output|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:textarea|self::h:time|self::h:u|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('a','abbr','area','map','audio','b','bdi','bdo','br','button','canvas','cite','code','command','datalist','del','dfn','em','embed','i','iframe','img','input','ins','kbd','keygen','label','mark','meter','noscript','object','output','progress','q','ruby','s','samp','script','select','small','span','strong','textarea','time','u','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="small" match="h:small">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:a|self::h:abbr|self::h:area|self::h:map|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:dfn|self::h:em|self::h:embed|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:meter|self::h:noscript|self::h:object|self::h:output|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:textarea|self::h:time|self::h:u|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('a','abbr','area','map','audio','b','bdi','bdo','br','button','canvas','cite','code','command','datalist','del','dfn','em','embed','i','iframe','img','input','ins','kbd','keygen','label','mark','meter','noscript','object','output','progress','q','ruby','s','samp','script','select','small','span','strong','textarea','time','u','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="s" match="h:s">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:a|self::h:abbr|self::h:area|self::h:map|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:dfn|self::h:em|self::h:embed|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:meter|self::h:noscript|self::h:object|self::h:output|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:textarea|self::h:time|self::h:u|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('a','abbr','area','map','audio','b','bdi','bdo','br','button','canvas','cite','code','command','datalist','del','dfn','em','embed','i','iframe','img','input','ins','kbd','keygen','label','mark','meter','noscript','object','output','progress','q','ruby','s','samp','script','select','small','span','strong','textarea','time','u','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="cite" match="h:cite">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:a|self::h:abbr|self::h:area|self::h:map|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:dfn|self::h:em|self::h:embed|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:meter|self::h:noscript|self::h:object|self::h:output|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:textarea|self::h:time|self::h:u|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('a','abbr','area','map','audio','b','bdi','bdo','br','button','canvas','cite','code','command','datalist','del','dfn','em','embed','i','iframe','img','input','ins','kbd','keygen','label','mark','meter','noscript','object','output','progress','q','ruby','s','samp','script','select','small','span','strong','textarea','time','u','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="q" match="h:q">
      <xsl:copy-of select="@cite|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:a|self::h:abbr|self::h:area|self::h:map|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:dfn|self::h:em|self::h:embed|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:meter|self::h:noscript|self::h:object|self::h:output|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:textarea|self::h:time|self::h:u|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('a','abbr','area','map','audio','b','bdi','bdo','br','button','canvas','cite','code','command','datalist','del','dfn','em','embed','i','iframe','img','input','ins','kbd','keygen','label','mark','meter','noscript','object','output','progress','q','ruby','s','samp','script','select','small','span','strong','textarea','time','u','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="dfn" match="h:dfn">
      <xsl:copy-of select="@title|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:dfn|self::h:a|self::h:abbr|self::h:area|self::h:map|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:dfn|self::h:em|self::h:embed|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:meter|self::h:noscript|self::h:object|self::h:output|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:textarea|self::h:time|self::h:u|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('dfn','a','abbr','area','map','audio','b','bdi','bdo','br','button','canvas','cite','code','command','datalist','del','dfn','em','embed','i','iframe','img','input','ins','kbd','keygen','label','mark','meter','noscript','object','output','progress','q','ruby','s','samp','script','select','small','span','strong','textarea','time','u','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="abbr" match="h:abbr">
      <xsl:copy-of select="@title|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:a|self::h:abbr|self::h:area|self::h:map|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:dfn|self::h:em|self::h:embed|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:meter|self::h:noscript|self::h:object|self::h:output|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:textarea|self::h:time|self::h:u|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('a','abbr','area','map','audio','b','bdi','bdo','br','button','canvas','cite','code','command','datalist','del','dfn','em','embed','i','iframe','img','input','ins','kbd','keygen','label','mark','meter','noscript','object','output','progress','q','ruby','s','samp','script','select','small','span','strong','textarea','time','u','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="time" match="h:time">
      <xsl:copy-of select="@datetime|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:a|self::h:abbr|self::h:area|self::h:map|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:dfn|self::h:em|self::h:embed|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:meter|self::h:noscript|self::h:object|self::h:output|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:textarea|self::h:time|self::h:u|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('a','abbr','area','map','audio','b','bdi','bdo','br','button','canvas','cite','code','command','datalist','del','dfn','em','embed','i','iframe','img','input','ins','kbd','keygen','label','mark','meter','noscript','object','output','progress','q','ruby','s','samp','script','select','small','span','strong','textarea','time','u','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="code" match="h:code">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:a|self::h:abbr|self::h:area|self::h:map|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:dfn|self::h:em|self::h:embed|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:meter|self::h:noscript|self::h:object|self::h:output|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:textarea|self::h:time|self::h:u|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('a','abbr','area','map','audio','b','bdi','bdo','br','button','canvas','cite','code','command','datalist','del','dfn','em','embed','i','iframe','img','input','ins','kbd','keygen','label','mark','meter','noscript','object','output','progress','q','ruby','s','samp','script','select','small','span','strong','textarea','time','u','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="var" match="h:var">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:a|self::h:abbr|self::h:area|self::h:map|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:dfn|self::h:em|self::h:embed|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:meter|self::h:noscript|self::h:object|self::h:output|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:textarea|self::h:time|self::h:u|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('a','abbr','area','map','audio','b','bdi','bdo','br','button','canvas','cite','code','command','datalist','del','dfn','em','embed','i','iframe','img','input','ins','kbd','keygen','label','mark','meter','noscript','object','output','progress','q','ruby','s','samp','script','select','small','span','strong','textarea','time','u','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="samp" match="h:samp">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:a|self::h:abbr|self::h:area|self::h:map|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:dfn|self::h:em|self::h:embed|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:meter|self::h:noscript|self::h:object|self::h:output|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:textarea|self::h:time|self::h:u|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('a','abbr','area','map','audio','b','bdi','bdo','br','button','canvas','cite','code','command','datalist','del','dfn','em','embed','i','iframe','img','input','ins','kbd','keygen','label','mark','meter','noscript','object','output','progress','q','ruby','s','samp','script','select','small','span','strong','textarea','time','u','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="kbd" match="h:kbd">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:a|self::h:abbr|self::h:area|self::h:map|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:dfn|self::h:em|self::h:embed|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:meter|self::h:noscript|self::h:object|self::h:output|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:textarea|self::h:time|self::h:u|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('a','abbr','area','map','audio','b','bdi','bdo','br','button','canvas','cite','code','command','datalist','del','dfn','em','embed','i','iframe','img','input','ins','kbd','keygen','label','mark','meter','noscript','object','output','progress','q','ruby','s','samp','script','select','small','span','strong','textarea','time','u','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="i" match="h:i">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:a|self::h:abbr|self::h:area|self::h:map|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:dfn|self::h:em|self::h:embed|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:meter|self::h:noscript|self::h:object|self::h:output|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:textarea|self::h:time|self::h:u|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('a','abbr','area','map','audio','b','bdi','bdo','br','button','canvas','cite','code','command','datalist','del','dfn','em','embed','i','iframe','img','input','ins','kbd','keygen','label','mark','meter','noscript','object','output','progress','q','ruby','s','samp','script','select','small','span','strong','textarea','time','u','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="b" match="h:b">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:a|self::h:abbr|self::h:area|self::h:map|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:dfn|self::h:em|self::h:embed|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:meter|self::h:noscript|self::h:object|self::h:output|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:textarea|self::h:time|self::h:u|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('a','abbr','area','map','audio','b','bdi','bdo','br','button','canvas','cite','code','command','datalist','del','dfn','em','embed','i','iframe','img','input','ins','kbd','keygen','label','mark','meter','noscript','object','output','progress','q','ruby','s','samp','script','select','small','span','strong','textarea','time','u','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="u" match="h:u">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:a|self::h:abbr|self::h:area|self::h:map|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:dfn|self::h:em|self::h:embed|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:meter|self::h:noscript|self::h:object|self::h:output|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:textarea|self::h:time|self::h:u|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('a','abbr','area','map','audio','b','bdi','bdo','br','button','canvas','cite','code','command','datalist','del','dfn','em','embed','i','iframe','img','input','ins','kbd','keygen','label','mark','meter','noscript','object','output','progress','q','ruby','s','samp','script','select','small','span','strong','textarea','time','u','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="mark" match="h:mark">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:a|self::h:abbr|self::h:area|self::h:map|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:dfn|self::h:em|self::h:embed|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:meter|self::h:noscript|self::h:object|self::h:output|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:textarea|self::h:time|self::h:u|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('a','abbr','area','map','audio','b','bdi','bdo','br','button','canvas','cite','code','command','datalist','del','dfn','em','embed','i','iframe','img','input','ins','kbd','keygen','label','mark','meter','noscript','object','output','progress','q','ruby','s','samp','script','select','small','span','strong','textarea','time','u','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="ruby" match="h:ruby">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:rt|self::h:rp|self::h:a|self::h:abbr|self::h:area|self::h:map|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:dfn|self::h:em|self::h:embed|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:meter|self::h:noscript|self::h:object|self::h:output|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:textarea|self::h:time|self::h:u|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('rt','rp','a','abbr','area','map','audio','b','bdi','bdo','br','button','canvas','cite','code','command','datalist','del','dfn','em','embed','i','iframe','img','input','ins','kbd','keygen','label','mark','meter','noscript','object','output','progress','q','ruby','s','samp','script','select','small','span','strong','textarea','time','u','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='rt'">
                              <xsl:call-template name="rt"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='rp'">
                              <xsl:call-template name="rp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="rt" match="h:rt">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:a|self::h:abbr|self::h:area|self::h:map|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:dfn|self::h:em|self::h:embed|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:meter|self::h:noscript|self::h:object|self::h:output|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:textarea|self::h:time|self::h:u|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('a','abbr','area','map','audio','b','bdi','bdo','br','button','canvas','cite','code','command','datalist','del','dfn','em','embed','i','iframe','img','input','ins','kbd','keygen','label','mark','meter','noscript','object','output','progress','q','ruby','s','samp','script','select','small','span','strong','textarea','time','u','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="rp" match="h:rp">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:a|self::h:abbr|self::h:area|self::h:map|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:dfn|self::h:em|self::h:embed|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:meter|self::h:noscript|self::h:object|self::h:output|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:textarea|self::h:time|self::h:u|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('a','abbr','area','map','audio','b','bdi','bdo','br','button','canvas','cite','code','command','datalist','del','dfn','em','embed','i','iframe','img','input','ins','kbd','keygen','label','mark','meter','noscript','object','output','progress','q','ruby','s','samp','script','select','small','span','strong','textarea','time','u','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="bdi" match="h:bdi">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:a|self::h:abbr|self::h:area|self::h:map|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:dfn|self::h:em|self::h:embed|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:meter|self::h:noscript|self::h:object|self::h:output|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:textarea|self::h:time|self::h:u|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('a','abbr','area','map','audio','b','bdi','bdo','br','button','canvas','cite','code','command','datalist','del','dfn','em','embed','i','iframe','img','input','ins','kbd','keygen','label','mark','meter','noscript','object','output','progress','q','ruby','s','samp','script','select','small','span','strong','textarea','time','u','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="bdo" match="h:bdo">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:a|self::h:abbr|self::h:area|self::h:map|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:dfn|self::h:em|self::h:embed|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:meter|self::h:noscript|self::h:object|self::h:output|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:textarea|self::h:time|self::h:u|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('a','abbr','area','map','audio','b','bdi','bdo','br','button','canvas','cite','code','command','datalist','del','dfn','em','embed','i','iframe','img','input','ins','kbd','keygen','label','mark','meter','noscript','object','output','progress','q','ruby','s','samp','script','select','small','span','strong','textarea','time','u','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="span" match="h:span">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:a|self::h:abbr|self::h:area|self::h:map|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:dfn|self::h:em|self::h:embed|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:meter|self::h:noscript|self::h:object|self::h:output|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:textarea|self::h:time|self::h:u|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('a','abbr','area','map','audio','b','bdi','bdo','br','button','canvas','cite','code','command','datalist','del','dfn','em','embed','i','iframe','img','input','ins','kbd','keygen','label','mark','meter','noscript','object','output','progress','q','ruby','s','samp','script','select','small','span','strong','textarea','time','u','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="br" match="h:br">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:apply-templates select="text()|comment()"/>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="wbr" match="h:wbr">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:apply-templates select="text()|comment()"/>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="ins" match="h:ins">
      <xsl:copy-of select="@cite|@datetime|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:apply-templates select="text()|comment()"/>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="del" match="h:del">
      <xsl:copy-of select="@cite|@datetime|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:apply-templates select="text()|comment()"/>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="img" match="h:img">
      <xsl:copy-of select="@alt|@src|@crossorigin|@usemap|@ismap|@width|@height|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:apply-templates select="text()|comment()"/>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="iframe" match="h:iframe">
      <xsl:copy-of select="@src|@srcdoc|@name|@sandbox|@seamless|@width|@height|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:apply-templates select="text()|comment()"/>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="embed" match="h:embed">
      <xsl:copy-of select="@src|@type|@width|@height|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:apply-templates select="text()|comment()"/>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="object" match="h:object">
      <xsl:copy-of select="@data|@type|@typemustmatch|@name|@usemap|@form|@width|@height|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:param|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('param')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='param'">
                              <xsl:call-template name="param"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <param xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="param"/>
                     </param>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="param" match="h:param">
      <xsl:copy-of select="@name|@value|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:apply-templates select="text()|comment()"/>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="video" match="h:video">
      <xsl:copy-of select="@src|@src|@crossorigin|@poster|@preload|@autoplay|@mediagroup|@loop|@muted|@controls|@width|@height|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:track|self::h:source|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('track','source')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='track'">
                              <xsl:call-template name="track"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='source'">
                              <xsl:call-template name="source"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <track xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="track"/>
                     </track>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="audio" match="h:audio">
      <xsl:copy-of select="@src|@src|@crossorigin|@preload|@autoplay|@mediagroup|@loop|@muted|@controls|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:track|self::h:source|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('track','source')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='track'">
                              <xsl:call-template name="track"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='source'">
                              <xsl:call-template name="source"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <track xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="track"/>
                     </track>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="source" match="h:source">
      <xsl:copy-of select="@src|@type|@media|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:apply-templates select="text()|comment()"/>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="track" match="h:track">
      <xsl:copy-of select="@kind|@src|@srclang|@label|@default|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:apply-templates select="text()|comment()"/>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="canvas" match="h:canvas">
      <xsl:copy-of select="@width|@height|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:apply-templates select="text()|comment()"/>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="map" match="h:map">
      <xsl:copy-of select="@name|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:apply-templates select="text()|comment()"/>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="area" match="h:area">
      <xsl:copy-of select="@alt|@coords|@shape|@href|@target|@rel|@media|@hreflang|@type|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:apply-templates select="text()|comment()"/>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="table" match="h:table">
      <xsl:copy-of select="@border|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:caption|self::h:colgroup|self::h:thead|self::h:tfoot|self::h:tbody|self::h:tr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('caption','colgroup','thead','tfoot','tbody','tr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='caption'">
                              <xsl:call-template name="caption"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='colgroup'">
                              <xsl:call-template name="colgroup"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='thead'">
                              <xsl:call-template name="thead"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='tfoot'">
                              <xsl:call-template name="tfoot"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='tbody'">
                              <xsl:call-template name="tbody"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='tr'">
                              <xsl:call-template name="tr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <caption xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="caption"/>
                     </caption>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="caption" match="h:caption">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:table|self::h:a|self::h:abbr|self::h:address|self::h:area|self::h:map|self::h:article|self::h:aside|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:blockquote|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:details|self::h:dfn|self::h:div|self::h:dl|self::h:em|self::h:embed|self::h:fieldset|self::h:figure|self::h:footer|self::h:form|self::h:header|self::h:hgroup|self::h:hr|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:menu|self::h:meter|self::h:nav|self::h:noscript|self::h:object|self::h:ol|self::h:output|self::h:p|self::h:pre|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:section|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:style|self::h:table|self::h:textarea|self::h:time|self::h:u|self::h:ul|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('table','a','abbr','address','area','map','article','aside','audio','b','bdi','bdo','blockquote','br','button','canvas','cite','code','command','datalist','del','details','dfn','div','dl','em','embed','fieldset','figure','footer','form','header','hgroup','hr','i','iframe','img','input','ins','kbd','keygen','label','mark','menu','meter','nav','noscript','object','ol','output','p','pre','progress','q','ruby','s','samp','script','section','select','small','span','strong','style','table','textarea','time','u','ul','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='table'">
                              <xsl:call-template name="table"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='address'">
                              <xsl:call-template name="address"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='article'">
                              <xsl:call-template name="article"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='aside'">
                              <xsl:call-template name="aside"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='blockquote'">
                              <xsl:call-template name="blockquote"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='details'">
                              <xsl:call-template name="details"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='div'">
                              <xsl:call-template name="div"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dl'">
                              <xsl:call-template name="dl"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='fieldset'">
                              <xsl:call-template name="fieldset"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='figure'">
                              <xsl:call-template name="figure"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='footer'">
                              <xsl:call-template name="footer"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='form'">
                              <xsl:call-template name="form"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='header'">
                              <xsl:call-template name="header"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='hgroup'">
                              <xsl:call-template name="hgroup"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='hr'">
                              <xsl:call-template name="hr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='menu'">
                              <xsl:call-template name="menu"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='nav'">
                              <xsl:call-template name="nav"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ol'">
                              <xsl:call-template name="ol"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='p'">
                              <xsl:call-template name="p"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='pre'">
                              <xsl:call-template name="pre"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='section'">
                              <xsl:call-template name="section"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='style'">
                              <xsl:call-template name="style"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='table'">
                              <xsl:call-template name="table"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ul'">
                              <xsl:call-template name="ul"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="colgroup" match="h:colgroup">
      <xsl:copy-of select="@span|@span|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:col|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('col')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='col'">
                              <xsl:call-template name="col"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <col xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="col"/>
                     </col>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="col" match="h:col">
      <xsl:copy-of select="@span|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:apply-templates select="text()|comment()"/>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="tbody" match="h:tbody">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:tr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('tr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='tr'">
                              <xsl:call-template name="tr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <tr xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="tr"/>
                     </tr>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="thead" match="h:thead">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:tr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('tr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='tr'">
                              <xsl:call-template name="tr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <tr xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="tr"/>
                     </tr>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="tfoot" match="h:tfoot">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:tr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('tr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='tr'">
                              <xsl:call-template name="tr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <tr xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="tr"/>
                     </tr>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="tr" match="h:tr">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:td|self::h:th|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('td','th')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='td'">
                              <xsl:call-template name="td"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='th'">
                              <xsl:call-template name="th"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <td xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="td"/>
                     </td>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="td" match="h:td">
      <xsl:copy-of select="@colspan|@rowspan|@headers|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:a|self::h:abbr|self::h:address|self::h:area|self::h:map|self::h:article|self::h:aside|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:blockquote|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:details|self::h:dfn|self::h:div|self::h:dl|self::h:em|self::h:embed|self::h:fieldset|self::h:figure|self::h:footer|self::h:form|self::h:header|self::h:hgroup|self::h:hr|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:menu|self::h:meter|self::h:nav|self::h:noscript|self::h:object|self::h:ol|self::h:output|self::h:p|self::h:pre|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:section|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:style|self::h:table|self::h:textarea|self::h:time|self::h:u|self::h:ul|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('a','abbr','address','area','map','article','aside','audio','b','bdi','bdo','blockquote','br','button','canvas','cite','code','command','datalist','del','details','dfn','div','dl','em','embed','fieldset','figure','footer','form','header','hgroup','hr','i','iframe','img','input','ins','kbd','keygen','label','mark','menu','meter','nav','noscript','object','ol','output','p','pre','progress','q','ruby','s','samp','script','section','select','small','span','strong','style','table','textarea','time','u','ul','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='address'">
                              <xsl:call-template name="address"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='article'">
                              <xsl:call-template name="article"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='aside'">
                              <xsl:call-template name="aside"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='blockquote'">
                              <xsl:call-template name="blockquote"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='details'">
                              <xsl:call-template name="details"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='div'">
                              <xsl:call-template name="div"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dl'">
                              <xsl:call-template name="dl"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='fieldset'">
                              <xsl:call-template name="fieldset"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='figure'">
                              <xsl:call-template name="figure"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='footer'">
                              <xsl:call-template name="footer"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='form'">
                              <xsl:call-template name="form"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='header'">
                              <xsl:call-template name="header"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='hgroup'">
                              <xsl:call-template name="hgroup"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='hr'">
                              <xsl:call-template name="hr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='menu'">
                              <xsl:call-template name="menu"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='nav'">
                              <xsl:call-template name="nav"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ol'">
                              <xsl:call-template name="ol"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='p'">
                              <xsl:call-template name="p"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='pre'">
                              <xsl:call-template name="pre"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='section'">
                              <xsl:call-template name="section"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='style'">
                              <xsl:call-template name="style"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='table'">
                              <xsl:call-template name="table"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ul'">
                              <xsl:call-template name="ul"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="th" match="h:th">
      <xsl:copy-of select="@colspan|@rowspan|@headers|@scope|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:header|self::h:footer|self::h:a|self::h:abbr|self::h:address|self::h:area|self::h:map|self::h:article|self::h:aside|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:blockquote|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:details|self::h:dfn|self::h:div|self::h:dl|self::h:em|self::h:embed|self::h:fieldset|self::h:figure|self::h:footer|self::h:form|self::h:header|self::h:hgroup|self::h:hr|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:menu|self::h:meter|self::h:nav|self::h:noscript|self::h:object|self::h:ol|self::h:output|self::h:p|self::h:pre|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:section|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:style|self::h:table|self::h:textarea|self::h:time|self::h:u|self::h:ul|self::h:var|self::h:video|self::h:wbr|self::h:hgroup|self::h:article|self::h:aside|self::h:nav|self::h:section|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('header','footer','a','abbr','address','area','map','article','aside','audio','b','bdi','bdo','blockquote','br','button','canvas','cite','code','command','datalist','del','details','dfn','div','dl','em','embed','fieldset','figure','footer','form','header','hgroup','hr','i','iframe','img','input','ins','kbd','keygen','label','mark','menu','meter','nav','noscript','object','ol','output','p','pre','progress','q','ruby','s','samp','script','section','select','small','span','strong','style','table','textarea','time','u','ul','var','video','wbr','hgroup','article','aside','nav','section')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='header'">
                              <xsl:call-template name="header"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='footer'">
                              <xsl:call-template name="footer"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='address'">
                              <xsl:call-template name="address"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='article'">
                              <xsl:call-template name="article"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='aside'">
                              <xsl:call-template name="aside"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='blockquote'">
                              <xsl:call-template name="blockquote"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='details'">
                              <xsl:call-template name="details"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='div'">
                              <xsl:call-template name="div"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dl'">
                              <xsl:call-template name="dl"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='fieldset'">
                              <xsl:call-template name="fieldset"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='figure'">
                              <xsl:call-template name="figure"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='footer'">
                              <xsl:call-template name="footer"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='form'">
                              <xsl:call-template name="form"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='header'">
                              <xsl:call-template name="header"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='hgroup'">
                              <xsl:call-template name="hgroup"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='hr'">
                              <xsl:call-template name="hr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='menu'">
                              <xsl:call-template name="menu"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='nav'">
                              <xsl:call-template name="nav"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ol'">
                              <xsl:call-template name="ol"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='p'">
                              <xsl:call-template name="p"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='pre'">
                              <xsl:call-template name="pre"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='section'">
                              <xsl:call-template name="section"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='style'">
                              <xsl:call-template name="style"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='table'">
                              <xsl:call-template name="table"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ul'">
                              <xsl:call-template name="ul"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='hgroup'">
                              <xsl:call-template name="hgroup"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='article'">
                              <xsl:call-template name="article"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='aside'">
                              <xsl:call-template name="aside"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='nav'">
                              <xsl:call-template name="nav"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='section'">
                              <xsl:call-template name="section"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="form" match="h:form">
      <xsl:copy-of select="@accept-charset|@action|@autocomplete|@enctype|@method|@name|@novalidate|@target|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:form|self::h:a|self::h:abbr|self::h:address|self::h:area|self::h:map|self::h:article|self::h:aside|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:blockquote|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:details|self::h:dfn|self::h:div|self::h:dl|self::h:em|self::h:embed|self::h:fieldset|self::h:figure|self::h:footer|self::h:form|self::h:header|self::h:hgroup|self::h:hr|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:menu|self::h:meter|self::h:nav|self::h:noscript|self::h:object|self::h:ol|self::h:output|self::h:p|self::h:pre|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:section|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:style|self::h:table|self::h:textarea|self::h:time|self::h:u|self::h:ul|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('form','a','abbr','address','area','map','article','aside','audio','b','bdi','bdo','blockquote','br','button','canvas','cite','code','command','datalist','del','details','dfn','div','dl','em','embed','fieldset','figure','footer','form','header','hgroup','hr','i','iframe','img','input','ins','kbd','keygen','label','mark','menu','meter','nav','noscript','object','ol','output','p','pre','progress','q','ruby','s','samp','script','section','select','small','span','strong','style','table','textarea','time','u','ul','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='form'">
                              <xsl:call-template name="form"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='address'">
                              <xsl:call-template name="address"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='article'">
                              <xsl:call-template name="article"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='aside'">
                              <xsl:call-template name="aside"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='blockquote'">
                              <xsl:call-template name="blockquote"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='details'">
                              <xsl:call-template name="details"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='div'">
                              <xsl:call-template name="div"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dl'">
                              <xsl:call-template name="dl"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='fieldset'">
                              <xsl:call-template name="fieldset"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='figure'">
                              <xsl:call-template name="figure"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='footer'">
                              <xsl:call-template name="footer"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='form'">
                              <xsl:call-template name="form"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='header'">
                              <xsl:call-template name="header"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='hgroup'">
                              <xsl:call-template name="hgroup"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='hr'">
                              <xsl:call-template name="hr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='menu'">
                              <xsl:call-template name="menu"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='nav'">
                              <xsl:call-template name="nav"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ol'">
                              <xsl:call-template name="ol"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='p'">
                              <xsl:call-template name="p"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='pre'">
                              <xsl:call-template name="pre"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='section'">
                              <xsl:call-template name="section"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='style'">
                              <xsl:call-template name="style"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='table'">
                              <xsl:call-template name="table"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ul'">
                              <xsl:call-template name="ul"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="fieldset" match="h:fieldset">
      <xsl:copy-of select="@disabled|@form|@name|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:legend|self::h:a|self::h:abbr|self::h:address|self::h:area|self::h:map|self::h:article|self::h:aside|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:blockquote|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:details|self::h:dfn|self::h:div|self::h:dl|self::h:em|self::h:embed|self::h:fieldset|self::h:figure|self::h:footer|self::h:form|self::h:header|self::h:hgroup|self::h:hr|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:menu|self::h:meter|self::h:nav|self::h:noscript|self::h:object|self::h:ol|self::h:output|self::h:p|self::h:pre|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:section|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:style|self::h:table|self::h:textarea|self::h:time|self::h:u|self::h:ul|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('legend','a','abbr','address','area','map','article','aside','audio','b','bdi','bdo','blockquote','br','button','canvas','cite','code','command','datalist','del','details','dfn','div','dl','em','embed','fieldset','figure','footer','form','header','hgroup','hr','i','iframe','img','input','ins','kbd','keygen','label','mark','menu','meter','nav','noscript','object','ol','output','p','pre','progress','q','ruby','s','samp','script','section','select','small','span','strong','style','table','textarea','time','u','ul','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='legend'">
                              <xsl:call-template name="legend"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='address'">
                              <xsl:call-template name="address"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='article'">
                              <xsl:call-template name="article"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='aside'">
                              <xsl:call-template name="aside"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='blockquote'">
                              <xsl:call-template name="blockquote"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='details'">
                              <xsl:call-template name="details"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='div'">
                              <xsl:call-template name="div"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dl'">
                              <xsl:call-template name="dl"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='fieldset'">
                              <xsl:call-template name="fieldset"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='figure'">
                              <xsl:call-template name="figure"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='footer'">
                              <xsl:call-template name="footer"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='form'">
                              <xsl:call-template name="form"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='header'">
                              <xsl:call-template name="header"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='hgroup'">
                              <xsl:call-template name="hgroup"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='hr'">
                              <xsl:call-template name="hr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='menu'">
                              <xsl:call-template name="menu"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='nav'">
                              <xsl:call-template name="nav"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ol'">
                              <xsl:call-template name="ol"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='p'">
                              <xsl:call-template name="p"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='pre'">
                              <xsl:call-template name="pre"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='section'">
                              <xsl:call-template name="section"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='style'">
                              <xsl:call-template name="style"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='table'">
                              <xsl:call-template name="table"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ul'">
                              <xsl:call-template name="ul"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="legend" match="h:legend">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:a|self::h:abbr|self::h:area|self::h:map|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:dfn|self::h:em|self::h:embed|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:meter|self::h:noscript|self::h:object|self::h:output|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:textarea|self::h:time|self::h:u|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('a','abbr','area','map','audio','b','bdi','bdo','br','button','canvas','cite','code','command','datalist','del','dfn','em','embed','i','iframe','img','input','ins','kbd','keygen','label','mark','meter','noscript','object','output','progress','q','ruby','s','samp','script','select','small','span','strong','textarea','time','u','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="label" match="h:label">
      <xsl:copy-of select="@form|@for|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:label|self::h:a|self::h:abbr|self::h:area|self::h:map|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:dfn|self::h:em|self::h:embed|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:meter|self::h:noscript|self::h:object|self::h:output|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:textarea|self::h:time|self::h:u|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('label','a','abbr','area','map','audio','b','bdi','bdo','br','button','canvas','cite','code','command','datalist','del','dfn','em','embed','i','iframe','img','input','ins','kbd','keygen','label','mark','meter','noscript','object','output','progress','q','ruby','s','samp','script','select','small','span','strong','textarea','time','u','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="input" match="h:input">
      <xsl:copy-of select="@accept|@alt|@autocomplete|@autofocus|@checked|@dirname|@disabled|@form|@formaction|@formenctype|@formmethod|@formnovalidate|@formtarget|@height|@list|@max|@maxlength|@min|@multiple|@name|@pattern|@placeholder|@readonly|@required|@size|@src|@step|@type|@value|@width|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:apply-templates select="text()|comment()"/>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="button" match="h:button">
      <xsl:copy-of select="@autofocus|@disabled|@form|@formaction|@formenctype|@formmethod|@formnovalidate|@formtarget|@name|@type|@value|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:a|self::h:abbr|self::h:area|self::h:map|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:dfn|self::h:em|self::h:embed|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:meter|self::h:noscript|self::h:object|self::h:output|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:textarea|self::h:time|self::h:u|self::h:var|self::h:video|self::h:wbr|self::h:a|self::h:audio|self::h:button|self::h:details|self::h:embed|self::h:iframe|self::h:img|self::h:input|self::h:keygen|self::h:label|self::h:menu|self::h:object|self::h:select|self::h:textarea|self::h:video|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('a','abbr','area','map','audio','b','bdi','bdo','br','button','canvas','cite','code','command','datalist','del','dfn','em','embed','i','iframe','img','input','ins','kbd','keygen','label','mark','meter','noscript','object','output','progress','q','ruby','s','samp','script','select','small','span','strong','textarea','time','u','var','video','wbr','a','audio','button','details','embed','iframe','img','input','keygen','label','menu','object','select','textarea','video')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='details'">
                              <xsl:call-template name="details"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='menu'">
                              <xsl:call-template name="menu"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="select" match="h:select">
      <xsl:copy-of select="@autofocus|@disabled|@form|@multiple|@name|@required|@size|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:option|self::h:optgroup|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('option','optgroup')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='option'">
                              <xsl:call-template name="option"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='optgroup'">
                              <xsl:call-template name="optgroup"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <option xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="option"/>
                     </option>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="datalist" match="h:datalist">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:option|self::h:a|self::h:abbr|self::h:area|self::h:map|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:dfn|self::h:em|self::h:embed|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:meter|self::h:noscript|self::h:object|self::h:output|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:textarea|self::h:time|self::h:u|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('option','a','abbr','area','map','audio','b','bdi','bdo','br','button','canvas','cite','code','command','datalist','del','dfn','em','embed','i','iframe','img','input','ins','kbd','keygen','label','mark','meter','noscript','object','output','progress','q','ruby','s','samp','script','select','small','span','strong','textarea','time','u','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='option'">
                              <xsl:call-template name="option"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="optgroup" match="h:optgroup">
      <xsl:copy-of select="@disabled|@label|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:option|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('option')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='option'">
                              <xsl:call-template name="option"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <option xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="option"/>
                     </option>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="option" match="h:option">
      <xsl:copy-of select="@disabled|@label|@selected|@value|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:a|self::h:abbr|self::h:area|self::h:map|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:dfn|self::h:em|self::h:embed|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:meter|self::h:noscript|self::h:object|self::h:output|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:textarea|self::h:time|self::h:u|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('a','abbr','area','map','audio','b','bdi','bdo','br','button','canvas','cite','code','command','datalist','del','dfn','em','embed','i','iframe','img','input','ins','kbd','keygen','label','mark','meter','noscript','object','output','progress','q','ruby','s','samp','script','select','small','span','strong','textarea','time','u','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="textarea" match="h:textarea">
      <xsl:copy-of select="@autofocus|@cols|@dirname|@disabled|@form|@maxlength|@name|@placeholder|@readonly|@required|@rows|@wrap|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:a|self::h:abbr|self::h:area|self::h:map|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:dfn|self::h:em|self::h:embed|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:meter|self::h:noscript|self::h:object|self::h:output|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:textarea|self::h:time|self::h:u|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('a','abbr','area','map','audio','b','bdi','bdo','br','button','canvas','cite','code','command','datalist','del','dfn','em','embed','i','iframe','img','input','ins','kbd','keygen','label','mark','meter','noscript','object','output','progress','q','ruby','s','samp','script','select','small','span','strong','textarea','time','u','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="keygen" match="h:keygen">
      <xsl:copy-of select="@autofocus|@challenge|@disabled|@form|@keytype|@name|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:apply-templates select="text()|comment()"/>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="output" match="h:output">
      <xsl:copy-of select="@for|@form|@name|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:a|self::h:abbr|self::h:area|self::h:map|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:dfn|self::h:em|self::h:embed|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:meter|self::h:noscript|self::h:object|self::h:output|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:textarea|self::h:time|self::h:u|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('a','abbr','area','map','audio','b','bdi','bdo','br','button','canvas','cite','code','command','datalist','del','dfn','em','embed','i','iframe','img','input','ins','kbd','keygen','label','mark','meter','noscript','object','output','progress','q','ruby','s','samp','script','select','small','span','strong','textarea','time','u','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="progress" match="h:progress">
      <xsl:copy-of select="@value|@max|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:progress|self::h:a|self::h:abbr|self::h:area|self::h:map|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:dfn|self::h:em|self::h:embed|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:meter|self::h:noscript|self::h:object|self::h:output|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:textarea|self::h:time|self::h:u|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('progress','a','abbr','area','map','audio','b','bdi','bdo','br','button','canvas','cite','code','command','datalist','del','dfn','em','embed','i','iframe','img','input','ins','kbd','keygen','label','mark','meter','noscript','object','output','progress','q','ruby','s','samp','script','select','small','span','strong','textarea','time','u','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="meter" match="h:meter">
      <xsl:copy-of select="@value|@min|@max|@low|@high|@optimum|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:meter|self::h:a|self::h:abbr|self::h:area|self::h:map|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:dfn|self::h:em|self::h:embed|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:meter|self::h:noscript|self::h:object|self::h:output|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:textarea|self::h:time|self::h:u|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('meter','a','abbr','area','map','audio','b','bdi','bdo','br','button','canvas','cite','code','command','datalist','del','dfn','em','embed','i','iframe','img','input','ins','kbd','keygen','label','mark','meter','noscript','object','output','progress','q','ruby','s','samp','script','select','small','span','strong','textarea','time','u','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="details" match="h:details">
      <xsl:copy-of select="@open|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:summary|self::h:a|self::h:abbr|self::h:address|self::h:area|self::h:map|self::h:article|self::h:aside|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:blockquote|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:details|self::h:dfn|self::h:div|self::h:dl|self::h:em|self::h:embed|self::h:fieldset|self::h:figure|self::h:footer|self::h:form|self::h:header|self::h:hgroup|self::h:hr|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:menu|self::h:meter|self::h:nav|self::h:noscript|self::h:object|self::h:ol|self::h:output|self::h:p|self::h:pre|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:section|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:style|self::h:table|self::h:textarea|self::h:time|self::h:u|self::h:ul|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('summary','a','abbr','address','area','map','article','aside','audio','b','bdi','bdo','blockquote','br','button','canvas','cite','code','command','datalist','del','details','dfn','div','dl','em','embed','fieldset','figure','footer','form','header','hgroup','hr','i','iframe','img','input','ins','kbd','keygen','label','mark','menu','meter','nav','noscript','object','ol','output','p','pre','progress','q','ruby','s','samp','script','section','select','small','span','strong','style','table','textarea','time','u','ul','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='summary'">
                              <xsl:call-template name="summary"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='address'">
                              <xsl:call-template name="address"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='article'">
                              <xsl:call-template name="article"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='aside'">
                              <xsl:call-template name="aside"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='blockquote'">
                              <xsl:call-template name="blockquote"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='details'">
                              <xsl:call-template name="details"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='div'">
                              <xsl:call-template name="div"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dl'">
                              <xsl:call-template name="dl"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='fieldset'">
                              <xsl:call-template name="fieldset"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='figure'">
                              <xsl:call-template name="figure"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='footer'">
                              <xsl:call-template name="footer"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='form'">
                              <xsl:call-template name="form"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='header'">
                              <xsl:call-template name="header"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='hgroup'">
                              <xsl:call-template name="hgroup"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='hr'">
                              <xsl:call-template name="hr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='menu'">
                              <xsl:call-template name="menu"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='nav'">
                              <xsl:call-template name="nav"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ol'">
                              <xsl:call-template name="ol"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='p'">
                              <xsl:call-template name="p"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='pre'">
                              <xsl:call-template name="pre"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='section'">
                              <xsl:call-template name="section"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='style'">
                              <xsl:call-template name="style"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='table'">
                              <xsl:call-template name="table"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ul'">
                              <xsl:call-template name="ul"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="summary" match="h:summary">
      <xsl:copy-of select="@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:a|self::h:abbr|self::h:area|self::h:map|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:dfn|self::h:em|self::h:embed|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:meter|self::h:noscript|self::h:object|self::h:output|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:textarea|self::h:time|self::h:u|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('a','abbr','area','map','audio','b','bdi','bdo','br','button','canvas','cite','code','command','datalist','del','dfn','em','embed','i','iframe','img','input','ins','kbd','keygen','label','mark','meter','noscript','object','output','progress','q','ruby','s','samp','script','select','small','span','strong','textarea','time','u','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="command" match="h:command">
      <xsl:copy-of select="@type|@label|@icon|@disabled|@checked|@radiogroup|@command|@title|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:apply-templates select="text()|comment()"/>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                
   <xsl:template name="menu" match="h:menu">
      <xsl:copy-of select="@type|@label|@accesskey|@contenteditable|@contextmenu|@dir|@draggable|@dropzone|@hidden|@id|@lang|@spellcheck|@style|@tabindex|@title|@translate|@onabort|@onblur|@oncanplay|@oncanplaythrough|@onchange|@onclick|@oncontextmenu|@oncuechange|@ondblclick|@ondrag|@ondragend|@ondragenter|@ondragleave|@ondragover|@ondragstart|@ondrop|@ondurationchange|@onemptied|@onended|@onerror|@onfocus|@oninput|@oninvalid|@onkeydown|@onkeypress|@onkeyup|@onload|@onloadeddata|@onloadedmetadata|@onloadstart|@onmousedown|@onmousemove|@onmouseout|@onmouseover|@onmouseup|@onmousewheel|@onpause|@onplay|@onplaying|@onprogress|@onratechange|@onreset|@onscroll|@onseeked|@onseeking|@onselect|@onshow|@onstalled|@onsubmit|@onsuspend|@ontimeupdate|@onvolumechange|@onwaiting|@*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml')) or starts-with(local-name(),'data-')]"/>
      <xsl:for-each select="*|text()|comment()">
         <xsl:choose>
            <xsl:when test="self::h:li|self::h:a|self::h:abbr|self::h:address|self::h:area|self::h:map|self::h:article|self::h:aside|self::h:audio|self::h:b|self::h:bdi|self::h:bdo|self::h:blockquote|self::h:br|self::h:button|self::h:canvas|self::h:cite|self::h:code|self::h:command|self::h:datalist|self::h:del|self::h:details|self::h:dfn|self::h:div|self::h:dl|self::h:em|self::h:embed|self::h:fieldset|self::h:figure|self::h:footer|self::h:form|self::h:header|self::h:hgroup|self::h:hr|self::h:i|self::h:iframe|self::h:img|self::h:input|self::h:ins|self::h:kbd|self::h:keygen|self::h:label|self::h:mark|self::h:menu|self::h:meter|self::h:nav|self::h:noscript|self::h:object|self::h:ol|self::h:output|self::h:p|self::h:pre|self::h:progress|self::h:q|self::h:ruby|self::h:s|self::h:samp|self::h:script|self::h:section|self::h:select|self::h:small|self::h:span|self::h:strong|self::h:style|self::h:table|self::h:textarea|self::h:time|self::h:u|self::h:ul|self::h:var|self::h:video|self::h:wbr|self::*[not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))]">
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:when>
            <xsl:when test="self::*">
               <xsl:variable name="replaceWith"
                             select="if (not(namespace-uri()=('','http://www.w3.org/1999/xhtml'))) then '' else if (local-name()='applet') then 'object' else if (local-name()='acronym') then 'abbr' else if (local-name()='bgsound') then 'audio' else if (local-name()='dir') then 'ul' else if (local-name()='frame') then 'iframe' else if (local-name()='frameset') then 'div' else if (local-name()='noframes') then 'div' else if (local-name()='listing') then 'pre' else if (local-name()='noembed') then 'object' else if (local-name()='strike') then 's' else if (local-name()='xmp') then 'code' else ''"/>
               <xsl:choose>
                  <xsl:when test="namespace-uri()=('','http://www.w3.org/1999/xhtml') and $replaceWith=('li','a','abbr','address','area','map','article','aside','audio','b','bdi','bdo','blockquote','br','button','canvas','cite','code','command','datalist','del','details','dfn','div','dl','em','embed','fieldset','figure','footer','form','header','hgroup','hr','i','iframe','img','input','ins','kbd','keygen','label','mark','menu','meter','nav','noscript','object','ol','output','p','pre','progress','q','ruby','s','samp','script','section','select','small','span','strong','style','table','textarea','time','u','ul','var','video','wbr')">
                     <xsl:element name="{$replaceWith}" namespace="http://www.w3.org/1999/xhtml">
                        <xsl:choose>
                           <xsl:when test="$replaceWith='li'">
                              <xsl:call-template name="li"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='a'">
                              <xsl:call-template name="a"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='abbr'">
                              <xsl:call-template name="abbr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='address'">
                              <xsl:call-template name="address"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='area'">
                              <xsl:call-template name="area"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='map'">
                              <xsl:call-template name="map"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='article'">
                              <xsl:call-template name="article"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='aside'">
                              <xsl:call-template name="aside"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='audio'">
                              <xsl:call-template name="audio"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='b'">
                              <xsl:call-template name="b"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdi'">
                              <xsl:call-template name="bdi"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='bdo'">
                              <xsl:call-template name="bdo"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='blockquote'">
                              <xsl:call-template name="blockquote"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='br'">
                              <xsl:call-template name="br"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='button'">
                              <xsl:call-template name="button"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='canvas'">
                              <xsl:call-template name="canvas"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='cite'">
                              <xsl:call-template name="cite"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='code'">
                              <xsl:call-template name="code"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='command'">
                              <xsl:call-template name="command"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='datalist'">
                              <xsl:call-template name="datalist"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='del'">
                              <xsl:call-template name="del"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='details'">
                              <xsl:call-template name="details"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dfn'">
                              <xsl:call-template name="dfn"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='div'">
                              <xsl:call-template name="div"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='dl'">
                              <xsl:call-template name="dl"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='em'">
                              <xsl:call-template name="em"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='embed'">
                              <xsl:call-template name="embed"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='fieldset'">
                              <xsl:call-template name="fieldset"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='figure'">
                              <xsl:call-template name="figure"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='footer'">
                              <xsl:call-template name="footer"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='form'">
                              <xsl:call-template name="form"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='header'">
                              <xsl:call-template name="header"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='hgroup'">
                              <xsl:call-template name="hgroup"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='hr'">
                              <xsl:call-template name="hr"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='i'">
                              <xsl:call-template name="i"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='iframe'">
                              <xsl:call-template name="iframe"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='img'">
                              <xsl:call-template name="img"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='input'">
                              <xsl:call-template name="input"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ins'">
                              <xsl:call-template name="ins"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='kbd'">
                              <xsl:call-template name="kbd"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='keygen'">
                              <xsl:call-template name="keygen"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='label'">
                              <xsl:call-template name="label"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='mark'">
                              <xsl:call-template name="mark"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='menu'">
                              <xsl:call-template name="menu"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='meter'">
                              <xsl:call-template name="meter"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='nav'">
                              <xsl:call-template name="nav"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='noscript'">
                              <xsl:call-template name="noscript"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='object'">
                              <xsl:call-template name="object"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ol'">
                              <xsl:call-template name="ol"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='output'">
                              <xsl:call-template name="output"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='p'">
                              <xsl:call-template name="p"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='pre'">
                              <xsl:call-template name="pre"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='progress'">
                              <xsl:call-template name="progress"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='q'">
                              <xsl:call-template name="q"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ruby'">
                              <xsl:call-template name="ruby"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='s'">
                              <xsl:call-template name="s"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='samp'">
                              <xsl:call-template name="samp"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='script'">
                              <xsl:call-template name="script"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='section'">
                              <xsl:call-template name="section"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='select'">
                              <xsl:call-template name="select"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='small'">
                              <xsl:call-template name="small"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='span'">
                              <xsl:call-template name="span"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='strong'">
                              <xsl:call-template name="strong"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='style'">
                              <xsl:call-template name="style"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='table'">
                              <xsl:call-template name="table"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='textarea'">
                              <xsl:call-template name="textarea"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='time'">
                              <xsl:call-template name="time"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='u'">
                              <xsl:call-template name="u"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='ul'">
                              <xsl:call-template name="ul"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='var'">
                              <xsl:call-template name="var"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='video'">
                              <xsl:call-template name="video"/>
                           </xsl:when>
                           <xsl:when test="$replaceWith='wbr'">
                              <xsl:call-template name="wbr"/>
                           </xsl:when>
                           <xsl:otherwise/>
                        </xsl:choose>
                     </xsl:element>
                  </xsl:when>
                  <xsl:otherwise>
                     <span xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="span"/>
                     </span>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:copy>
                  <xsl:apply-templates select="."/>
               </xsl:copy>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>
                

                
</xsl:stylesheet>
