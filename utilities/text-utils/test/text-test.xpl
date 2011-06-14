<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step version="1.0" xmlns:p="http://www.w3.org/ns/xproc" name="text-test"
    xmlns:c="http://www.w3.org/ns/xproc-step" xmlns:px="http://www.daisy.org/ns/pipeline/xproc"
		xmlns:cxf="http://xmlcalabash.com/ns/extensions/fileutils"
>
		<p:output port="result">
		<!--<p:pipe step="info" port="result"/>-->
			<p:empty/>
		</p:output>

	<p:import href="../text-library.xpl" />
	<p:import href="../../file-utils/xproc/file-library.xpl" />

	<p:variable name="target" select="'file:/tmp/test.txt'"/>

	<px:text-create name="txcreate">
		<p:with-option name="target" select="$target" />
		<p:with-option name="trim" select="'false'" />
		<p:input port="source">
			<p:inline><c:data>   bla   </c:data></p:inline>
		</p:input>
	</px:text-create>

<!--
	<cxf:info name="info">
		<p:with-option name="href" select="$target"/>
	</cxf:info>

	<cxf:delete name="delete">
		<p:with-option name="href" select="$target" />
	</cxf:delete>
-->

</p:declare-step>
