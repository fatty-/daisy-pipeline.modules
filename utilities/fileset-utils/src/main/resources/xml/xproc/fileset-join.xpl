<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step version="1.0" type="px:fileset-join" xmlns:p="http://www.w3.org/ns/xproc" xmlns:d="http://www.daisy.org/ns/pipeline/data"
  xmlns:px="http://www.daisy.org/ns/pipeline/xproc" exclude-inline-prefixes="#all">

  <p:input port="source" sequence="true"/>
  <p:output port="result" primary="true"/>

  <p:documentation>Canonicalize all URIs</p:documentation>
  <p:for-each>
    <p:xslt>
      <p:input port="parameters">
        <p:empty/>
      </p:input>
      <p:input port="stylesheet">
        <p:document href="fileset-join.canonicalize.xsl"/>
      </p:input>
    </p:xslt>
  </p:for-each>

  <p:documentation>Join the filesets</p:documentation>
  <p:wrap-sequence wrapper="d:fileset"/>
  <p:xslt>
    <p:input port="parameters">
      <p:empty/>
    </p:input>
    <p:input port="stylesheet">
      <p:document href="fileset-join.xsl"/>
    </p:input>
  </p:xslt>
  <p:unwrap match="/d:fileset/d:fileset"/>
  <p:delete match="//d:file[@href=preceding::d:file/@href]"/>

</p:declare-step>