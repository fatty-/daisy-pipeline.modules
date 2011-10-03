<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:f="http://www.daisy.org/ns/pipeline/internal-functions" xmlns:pf="http://www.daisy.org/ns/pipeline/functions"
    xmlns:xs="http://www.w3.org/2001/XMLSchema">
    
    <xsl:function name="pf:file-resolve-relative-uri" as="xs:string">
        <xsl:param name="to" as="xs:string"/>
        <xsl:param name="from" as="xs:string"/>
        <xsl:variable name="to-filesystem" select="if (starts-with($to,'file:')) then 'file:/' else replace(replace($to,'/+','/'),'^([^:]+:/[^/]+/).*$','$1')"/>
        <xsl:variable name="from-filesystem" select="if (starts-with($from,'file:')) then 'file:/' else replace(replace($from,'/+','/'),'^([^:]+:/[^/]+/).*$','$1')"/>
        <xsl:choose>
            <xsl:when test="$to-filesystem = $from-filesystem">
                <xsl:value-of
                    select="concat(f:file-resolve-relative-uri(tokenize(replace(f:file-resolve-dot-segments($from),'[^/]+$',''),'/+'),
                                                               tokenize(replace(f:file-resolve-dot-segments($to),'#.+$',''),'/+'),
                                                               ''),
                                   if (contains($to,'#')) then concat('#',tokenize($to,'#')[2]) else '')"
                />
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$to"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <xsl:function name="f:file-resolve-dot-segments">
        <xsl:param name="uri"/>
        <xsl:value-of
            select="if (matches($uri,'/([^:/\.][^:/]*|\.[^:/\.][^:/]*|\.\.[^:/]+)/\.\./')) then
                        f:file-resolve-dot-segments(replace($uri,'^(.*?)/([^:/\.][^:/]*|\.[^:/]+)/\.\./(.*)$','$1/$3'))
                    else if (matches($uri,'/\./')) then
                        f:file-resolve-dot-segments(replace($uri,'/\./','/'))
                    else $uri"
        />
    </xsl:function>

    <xsl:function name="f:file-resolve-relative-uri">
        <xsl:param name="from"/>
        <xsl:param name="to"/>
        <xsl:param name="relation"/>

        <xsl:choose>
            <xsl:when test="count($to) &lt;= 1 and count($from) = 0">
                <xsl:value-of select="concat($relation,$to)"/>
            </xsl:when>
            <xsl:when test="string-length($relation) &gt; 0">
                <xsl:value-of
                    select="f:file-resolve-relative-uri(subsequence($from,2), subsequence($to,min((count($to),2))), concat(
                       if (count($from) and string-length($from[1])) then '../' else '',
                       $relation,
                       if (count($to) &gt; 1 and string-length($to[1])) then concat($to[1],'/') else ''
                    ))"
                />
            </xsl:when>
            <xsl:when test="count($to) &gt; 1 and $to[1]=$from[1]">
                <xsl:value-of select="f:file-resolve-relative-uri(subsequence($from,2), subsequence($to,min((count($to),2))), '')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of
                    select="f:file-resolve-relative-uri(subsequence($from,2), subsequence($to,min((count($to),2))), concat(
                        if (count($from) and string-length($from[1])) then '../' else '',
                        if (count($to) &gt; 1 and string-length($to[1])) then concat($to[1],'/') else ''
                    ))"
                />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
    <!--<xsl:template match="/*" name="test">
        <tests>
            <test to="file:/home/user/dir/file.xml" from="file:/home/user/dir/" relative="file.xml"
                result="{if (pf:file-resolve-relative-uri('file:/home/user/dir/file.xml','file:/home/user/dir/')='file.xml') then 'SUCCESS' else 'FAILED'}">
                <xsl:value-of select="pf:file-resolve-relative-uri('file:/home/user/dir/file.xml','file:/home/user/dir/')"/>
            </test>
            <test to="file:/home/user/dir/file.xml#fragment" from="file:/home/user/dir/" relative="file.xml#fragment"
                result="{if (pf:file-resolve-relative-uri('file:/home/user/dir/file.xml#fragment','file:/home/user/dir/')='file.xml#fragment') then 'SUCCESS' else 'FAILED'}">
                <xsl:value-of select="pf:file-resolve-relative-uri('file:/home/user/dir/file.xml#fragment','file:/home/user/dir/')"/>
            </test>
            <test to="file:/home/user/dir/file.xml" from="file:/home/user/dir/somefile.xml#with-fragment" relative="file.xml"
                result="{if (pf:file-resolve-relative-uri('file:/home/user/dir/file.xml','file:/home/user/dir/somefile.xml#with-fragment')='file.xml') then 'SUCCESS' else 'FAILED'}">
                <xsl:value-of select="pf:file-resolve-relative-uri('file:/home/user/dir/file.xml','file:/home/user/dir/somefile.xml#with-fragment')"/>
            </test>
            <test to="file:/home/user/file.xml" from="file:/home/user/dir/" relative="../file.xml"
                result="{if (pf:file-resolve-relative-uri('file:/home/user/file.xml','file:/home/user/dir/')='../file.xml') then 'SUCCESS' else 'FAILED'}">
                <xsl:value-of select="pf:file-resolve-relative-uri('file:/home/user/file.xml','file:/home/user/dir/')"/>
            </test>
            <test to="file:/home/user/dir/subdir/file.xml" from="file:/home/user/dir/" relative="subdir/file.xml"
                result="{if (pf:file-resolve-relative-uri('file:/home/user/dir/subdir/file.xml','file:/home/user/dir/')='subdir/file.xml') then 'SUCCESS' else 'FAILED'}">
                <xsl:value-of select="pf:file-resolve-relative-uri('file:/home/user/dir/subdir/file.xml','file:/home/user/dir/')"/>
            </test>
            <test to="file:/home/otheruser/file.xml" from="file:/home/user/dir/" relative="../../otheruser/file.xml"
                result="{if (pf:file-resolve-relative-uri('file:/home/otheruser/file.xml','file:/home/user/dir/')='../../otheruser/file.xml') then 'SUCCESS' else 'FAILED'}">
                <xsl:value-of select="pf:file-resolve-relative-uri('file:/home/otheruser/file.xml','file:/home/user/dir/')"/>
            </test>
            <test to="file:/home/otheruser/../otherotheruser/subdir/../../awesomeuser/file.xml" from="file:/home/user/dir/" relative="../../awesomeuser/file.xml"
                result="{if (pf:file-resolve-relative-uri('file:/home/otheruser/../otherotheruser/subdir/../../awesomeuser/file.xml','file:/home/user/dir/')='../../awesomeuser/file.xml') then 'SUCCESS' else 'FAILED'}">
                <xsl:value-of select="pf:file-resolve-relative-uri('file:/home/otheruser/../otherotheruser/subdir/../../awesomeuser/file.xml','file:/home/user/dir/')"/>
            </test>
            <test to="http://example.net/file.xml" from="file:/home/user/dir/" relative="http://example.net/file.xml"
                result="{if (pf:file-resolve-relative-uri('http://example.net/file.xml','file:/home/user/dir/')='http://example.net/file.xml') then 'SUCCESS' else 'FAILED'}">
                <xsl:value-of select="pf:file-resolve-relative-uri('http://example.net/file.xml','file:/home/user/dir/')"/>
            </test>
            <test to="http://example.net/file.xml" from="http://example.org/" relative="http://example.net/file.xml"
                result="{if (pf:file-resolve-relative-uri('http://example.net/file.xml','http://example.org/')='http://example.net/file.xml') then 'SUCCESS' else 'FAILED'}">
                <xsl:value-of select="pf:file-resolve-relative-uri('http://example.net/file.xml','http://example.org/')"/>
            </test>
            <test to="file:/home/user/dir/file.xml" from="../notabsolute/" relative="file:/home/user/dir/file.xml"
                result="{if (pf:file-resolve-relative-uri('file:/home/user/dir/file.xml','../notabsolute/')='file:/home/user/dir/file.xml') then 'SUCCESS' else 'FAILED'}">
                <xsl:value-of select="pf:file-resolve-relative-uri('file:/home/user/dir/file.xml','../notabsolute/')"/>
            </test>
            <test to="../notabsolute/file.xml" from="file:/home/user/dir/" relative="../notabsolute/file.xml"
                result="{if (pf:file-resolve-relative-uri('../notabsolute/file.xml','file:/home/user/dir/')='../notabsolute/file.xml') then 'SUCCESS' else 'FAILED'}">
                <xsl:value-of select="pf:file-resolve-relative-uri('../notabsolute/file.xml','file:/home/user/dir/')"/>
            </test>
            <test to="" from="file:/home/usr/dir/" relative="" result="{if (pf:file-resolve-relative-uri('','file:/home/usr/dir/')='') then 'SUCCESS' else 'FAILED'}">
                <xsl:value-of select="pf:file-resolve-relative-uri('','file:/home/usr/dir/')"/>
            </test>
            <test to="" from="" relative="" result="{if (pf:file-resolve-relative-uri('','')='') then 'SUCCESS' else 'FAILED'}">
                <xsl:value-of select="pf:file-resolve-relative-uri('','')"/>
            </test>
        </tests>
    </xsl:template>-->
    
</xsl:stylesheet>
