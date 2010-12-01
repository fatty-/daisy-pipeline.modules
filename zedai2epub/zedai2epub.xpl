<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc"
  xmlns:c="http://www.w3.org/ns/xproc-step"
  xmlns:px="http://pipeline.daisy.org/ns/"
  version="1.0">
  
<!--  <p:output port="result"/>-->
  
  <p:option name="href" required="true"/>
  <p:option name="output" select="'output'"/>
  
  <p:import href="http://xmlcalabash.com/extension/steps/library-1.0.xpl"/>
  <p:import href="get-zedai-refs.xpl"/>
  

<!--=========================================================================-->
  
  <!-- Get the input document from the href option-->
  
  <!-- TODO: extract to utils-->
  <!--<p:add-attribute match="/c:request" attribute-name="href">
    <p:input port="source">
      <p:inline>
        <c:request method="get"  detailed="false"/>
      </p:inline>
    </p:input>
    <p:with-option name="attribute-value" select="$href"/>
  </p:add-attribute>
  
  <p:http-request/>
  
  <p:unescape-markup encoding="base64" charset="utf8"/>-->
  
  <p:load>
    <p:with-option name="href" select="$href"></p:with-option>
  </p:load>
  
<!--=========================================================================-->
  
  <!-- Get the list of satelite files -->
  <px:get-refs>
    <p:with-option name="base" select="$href"/>
  </px:get-refs>

<!--=========================================================================-->
  
  <!-- Download/Move the satellite files -->
  <!-- we need a procesor specific step for downloads -->
  
<!--=========================================================================-->
  
  <!-- Normalize the source document -->
  
<!--=========================================================================-->
  
  <!-- Identify NCX items -->
  
<!--=========================================================================-->
  
  <!-- Identify Chunks -->
  
<!--=========================================================================-->
  
  <!-- Replace document links to local paths -->
  
<!--=========================================================================-->
  
  <!-- Create NCX -->
  
<!--=========================================================================-->
  
  <!-- Create OPF -->
  
<!--=========================================================================-->
  
  <!-- Create chunks -->
  
  
</p:declare-step>