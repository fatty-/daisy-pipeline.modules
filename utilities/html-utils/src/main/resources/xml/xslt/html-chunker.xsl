<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml"
  xpath-default-namespace="http://www.w3.org/1999/xhtml" xmlns:epub="http://www.idpf.org/2007/ops"
  xmlns:f="http://www.daisy.org/ns/pipeline/internal-functions"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  exclude-result-prefixes="#all" version="2.0">

  <xsl:output method="xhtml" indent="yes"/>

  <xsl:variable name="doc" select="/"/>

  <xsl:key name="ids" match="*" use="@id|@xml:id"/>

  <xsl:variable name="chunks" as="document-node()*">
    <xsl:apply-templates select="/html/body" mode="chunking"/>
  </xsl:variable>

  <xsl:function name="f:chunk-name">
    <xsl:param name="chunk" as="document-node()"/>
    <xsl:sequence
      select="replace(base-uri($doc/*),'.*?([^/]+)(\.[^.]+)$',concat('$1-',index-of($chunks,$chunk),'$2'))"
    />
  </xsl:function>

  <xsl:template match="/">
    <xsl:for-each select="$chunks">
      <xsl:result-document href="{replace(base-uri($doc/*),'([^/]+)$',f:chunk-name(.))}">
        <html>
          <xsl:copy-of select="$doc/html/((@* except @xml:base) | namespace::*)"/>
          <xsl:apply-templates select="$doc/html/head"/>
          <body>
            <xsl:copy-of select="/*/@*"/>
            <xsl:apply-templates select="/*/node()"/>
          </body>
        </html>
      </xsl:result-document>
    </xsl:for-each>
  </xsl:template>


  <xsl:template match="@href[starts-with(.,'#')]">
    <xsl:variable name="refid" select="substring(.,2)" as="xs:string"/>
    <xsl:variable name="refchunk" select="$chunks[key('ids',$refid,.)]"/>
    <xsl:if test="empty($refchunk)">
      <xsl:message>Unable to resolve link to '<xsl:value-of select="."/>'</xsl:message>
    </xsl:if>
    <xsl:attribute name="href"
      select="if (empty($refchunk) or / = $refchunk) then . 
              else concat(f:chunk-name($refchunk),.)"
    />
  </xsl:template>

  <xsl:template match="node() | @*" mode="#all">
    <xsl:copy>
      <xsl:apply-templates select="node() | @*"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="body" mode="chunking">
    <xsl:for-each-group select="text()[normalize-space()]|*" group-adjacent="exists(self::section)">
      <xsl:choose>
        <xsl:when test="current-grouping-key()">
          <xsl:apply-templates select="current-group()" mode="chunking"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:document>
            <section>
              <xsl:apply-templates select="current-group()" mode="chunking"/>
            </section>
          </xsl:document>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each-group>
  </xsl:template>

  <xsl:template match="body/section" mode="chunking">
    <xsl:document>
      <xsl:copy-of select="."/>
    </xsl:document>
  </xsl:template>

  <xsl:template match="body/section[tokenize(@epub:type,'/s')='bodymatter']" mode="chunking"
    priority="10">
    <xsl:for-each-group select="text()[normalize-space()]|*" group-adjacent="exists(self::section)">
      <xsl:choose>
        <xsl:when test="current-grouping-key()">
          <xsl:for-each select="current-group()">
            <xsl:document>
              <section epub:type="bodymatter">
                <xsl:copy-of select="."/>
              </section>
            </xsl:document>
          </xsl:for-each>
        </xsl:when>
        <xsl:otherwise>
          <xsl:document>
            <section epub:type="bodymatter">
              <xsl:copy-of select="current-group()"/>
            </section>
          </xsl:document>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each-group>
  </xsl:template>


</xsl:stylesheet>
