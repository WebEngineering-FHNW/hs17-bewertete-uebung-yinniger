<%@ page import="grails.converters.JSON; mvc.Entry" %>
<html>
<head>
    <title>Create Mistake</title>
    <script src="/assets/jquery-2.2.0.min.js"></script>
    <script src="/assets/entry.js"></script>
    <script src="/assets/bootstrap.js"></script>
    <asset:link rel="stylesheet" href="bootstrap.css"/>
</head>

<body>
<div>
    <div id="success-message" class="alert alert-success" style="display: none">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        Your entry was successfully created!
    </div>

    <div id="fail-message" class="alert alert-danger" style="display: none">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong>Failed to save:</strong>
        <span id="fail-message-anchor"></span>
    </div>
</div>

<div class="container-fluid">
    <div class="page-header">
        <h2>Create Mistake</h2>
    </div>

    <form id="entry-form">
        <tmpl:row desc="Name" name="name" value=""/>
        <tmpl:option-chooser desc="Language" name="language" options="${Entry.Language}" selected=""/>
        <tmpl:row desc="Error" name="errorMessage" value=""/>
        <tmpl:row desc="Solution" name="solution" value=""/>
        <div class="row">
            <div class="col-md-3 right">
                <input id="save-btn" class="btn btn-primary" type="button" value="Save">
            </div>
        </div>
    </form>
</div>
</body>
</html>
