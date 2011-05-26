<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step version="1.0" xmlns:p="http://www.w3.org/ns/xproc" name="text-test"
    xmlns:c="http://www.w3.org/ns/xproc-step" xmlns:px="http://www.daisy.org/ns/pipeline/xproc"
		xmlns:cxf="http://xmlcalabash.com/ns/extensions/fileutils"
>
		<p:output port="result">
			<p:pipe step="info" port="result"/>
		</p:output>

	<p:import href="../text-library.xpl" />
	<p:import href="../../file-utils/fileutils-library.xpl" />

	<px:text-create name="txcreate" target="file:/tmp/test.txt" text="bla" />

	<cxf:info name="info">
		<p:with-option name="href" select="'file:/tmp/test.txt'"/>
		<!-- FIXME: Don't know why the following step fails: -->
		<!-- Undeclared option specified: fail-on-error -->
		<!--<p:with-option name="fail-on-error" select="'true'"/>-->
	</cxf:info>

	<cxf:delete name="delete" href="file:/tmp/test.txt" />

</p:declare-step>
