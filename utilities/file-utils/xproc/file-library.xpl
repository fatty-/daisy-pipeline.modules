<p:library version="1.0" xmlns:p="http://www.w3.org/ns/xproc"
    xmlns:pxf="http://exproc.org/proposed/steps/file" xmlns:xsd="http://www.w3.org/2001/XMLSchema">

    <p:documentation xmlns="http://www.w3.org/1999/xhtml">
        <div>
            <h1>File Utilities</h1>
            <p>The steps defined in this library provide information about files and the ability to
                manipulate them. All implementations are required to support <code>file:</code>
                scheme URIs. Support for other schemes is implementation-defined. </p>
            <p>All <code>href</code> attributes are made absolute with respect to the element on
                which they are specified.</p>
        </div>
    </p:documentation>


    <!-- ============================================================ -->

    <p:documentation xmlns="http://www.w3.org/1999/xhtml">
        <p>Returns a <code>&lt;c:result></code> containing the absolute URI of the target. The step
            fails if the file represented by <code>href</code> does not exist or if it cannot be
            copied to the specified target.</p>
    </p:documentation>

    <p:declare-step type="pxf:copy">
        <p:output port="result" primary="false"/>
        <p:option name="href" required="true"/>
        <p:option name="target" required="true"/>
        <p:option name="fail-on-error" select="'true'"/>
    </p:declare-step>

    <!-- ============================================================ -->

    <p:documentation xmlns="http://www.w3.org/1999/xhtml">
        <p>Returns a <code>&lt;c:result></code> containing the absolute URI of the deleted file. The
            step fails if the file does not exist or if it cannot be deleted.</p>
    </p:documentation>

    <p:declare-step type="pxf:delete">
        <p:output port="result" primary="false"/>
        <p:option name="href" required="true"/>
    </p:declare-step>


    <!-- ============================================================ -->

    <p:documentation xmlns="http://www.w3.org/1999/xhtml">
        <p>Returns a <code>&lt;c:directory></code>, <code>&lt;c:file></code>, or
                <code>&lt;c:other></code> (implementations may also return more specific types,
            e.g., <code>&lt;c:fifo></code> or <code>&lt;c:dev></code>). If the document doesn't
            exist, an empty sequence is returned. The document element of the result, if there is
            one, will have <code>readable</code>, <code>writable</code>, <code>hidden</code>,
                <code>last-modified</code>, and <code>size</code> attributes. The
                <code>readable</code>, <code>writable</code> and <code>hidden</code> attributes are
            boolean and are only present if they are true. The <code>last-modified</code> attribute
            returns the last-modified time in UTC. The <code>size</code> attribute returns the size
            of the file; it is absent for directories and other types that have no meaningful
            size.</p>
    </p:documentation>

    <p:declare-step type="pxf:info">
        <p:output port="result" sequence="true"/>
        <p:option name="href" required="true"/>
    </p:declare-step>

    <!-- ============================================================ -->
    <p:documentation xmlns="http://www.w3.org/1999/xhtml">
        <p>Returns the first count lines of the file named in <code>href</code>. If
                <code>count</code> is negative, the step returns all except those first lines. The
            step returns a <code>c:result</code> element containing one <code>c:line</code> for each
            line. Lines are identified as described in <a
                href="http://www.w3.org/TR/xml/#sec-line-ends">XML 1.0, 2.11 End-of-Line
                Handling</a>. If an error occurs, the step fails if <code>fail-on-error</code> is
            true; otherwise, the step returns a <code>c:error</code> element which may contain
            additional, implementation-defined information about the nature of the error.</p>
    </p:documentation>
    <p:declare-step type="pxf:head">
        <p:output port="result"/>
        <p:option name="href" required="true"/>
        <p:option name="count" required="true"/>
        <p:option name="fail-on-error" select="'true'"/>
    </p:declare-step>

    <!-- ============================================================ -->

    <p:documentation xmlns="http://www.w3.org/1999/xhtml">
        <p>Creates a directory with the name spacified in the "href" option. If the name includes
            more than one directory component, all of the intermediate components are created. The
            path separator is implementation-defined. Returns a <code>&lt;c:result></code>
            containing the absolute filename of the directory created. The step fails if the
            directory cannot be created.</p>
    </p:documentation>

    <p:declare-step type="pxf:mkdir">
        <p:output port="result" primary="false"/>
        <p:option name="href" required="true"/>
    </p:declare-step>

    <!-- ============================================================ -->

    <p:documentation xmlns="http://www.w3.org/1999/xhtml">
        <p>Returns a <code>&lt;c:result></code> containing the absolute URI of the target. The step
            fails if the file represented by the <code>href</code> does not exist or if it cannot be
            copied to the specified target; the source file is deleted if the copy succeeds.</p>
    </p:documentation>

    <p:declare-step type="pxf:move">
        <p:output port="result" primary="false"/>
        <p:option name="href" required="true"/>
        <p:option name="target" required="true"/>
    </p:declare-step>

    <!-- ============================================================ -->

    <p:documentation xmlns="http://www.w3.org/1999/xhtml">
        <p>Returns the last <code>count</code> lines of the file named in <code>href</code>. If
                <code>count</code> is negative, the step returns all except those last lines. The
            step returns a <code>c:result</code> element containing one <code>c:line</code> for each
            line. Lines are identified as described in <a
                href="http://www.w3.org/TR/xml/#sec-line-ends">XML 1.0, 2.11 End-of-Line
                Handling</a>. If an error occurs, the step fails if <code>fail-on-error</code> is
            true; otherwise, the step returns a <code>c:error</code> element which may contain
            additional, implementation-defined information about the nature of the error.</p>
    </p:documentation>
    <p:declare-step type="pxf:tail">
        <p:output port="result"/>
        <p:option name="href" required="true"/>
        <p:option name="count" required="true"/>
        <p:option name="fail-on-error" select="'true'"/>
    </p:declare-step>

    <!-- ============================================================ -->

    <p:documentation xmlns="http://www.w3.org/1999/xhtml">
        <p>Returns a <code>&lt;c:result></code> containing the absolute URI of a temporary file. The
            temporary file is guaranteed not to already exist when <code>pxf:tempfile</code> is
            called. The file is created in the directory specified by the <code>href</code>. The
            step fails if the directory does not exist.</p>
        <p>If the <code>delete-on-exit</code> option (a boolean) is true, then the temporary file
            will automatically be deleted when the processor terminates.</p>
    </p:documentation>

    <p:declare-step type="pxf:tempfile">
        <p:output port="result" primary="false"/>
        <p:option name="href" required="true"/>
        <p:option name="delete-on-exit"/>
    </p:declare-step>

    <!-- ============================================================ -->

    <p:documentation xmlns="http://www.w3.org/1999/xhtml">
        <p>Returns a <code>&lt;c:result></code> containing the absolute URI of the touched file. The
            step fails if the file does not exist and cannot be created.</p>
    </p:documentation>

    <p:declare-step type="pxf:touch">
        <p:output port="result" primary="false"/>
        <p:option name="href" required="true"/>
    </p:declare-step>

    <!-- ============================================================ -->

</p:library>
