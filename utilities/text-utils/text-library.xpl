<?xml version="1.0" encoding="UTF-8"?>
<p:library version="1.0" xmlns:p="http://www.w3.org/ns/xproc"
    xmlns:c="http://www.w3.org/ns/xproc-step" xmlns:px="http://www.daisy.org/ns/pipeline/xproc">
    <p:declare-step type="px:text-create" name="text-create">

				<p:input port="source"/>

        <p:option name="target" required="true"/>

        <p:in-scope-names name="parameters"/>
        <p:template>
            <p:input port="template">
                <p:pipe step="text-create" port="source" />
            </p:input>
            <p:input port="source">
                <p:empty/>
            </p:input>
            <p:input port="parameters">
                <p:pipe step="parameters" port="result"/>
            </p:input>
        </p:template>
        <p:store method="text">
            <p:with-option name="href" select="$target"/>
        </p:store>
    </p:declare-step>
</p:library>
