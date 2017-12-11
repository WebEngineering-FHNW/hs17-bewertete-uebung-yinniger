<%@ page import="grails.converters.JSON; mvc.Entry" %>
<html>
<head>
    <title>${mistake.getName()}</title>
    <script src="/assets/jquery-2.2.0.min.js"></script>
    <script src="/assets/entry.js"></script>
    <script src="/assets/bootstrap.js"></script>
    <asset:link rel="stylesheet" href="bootstrap.css"/>
    <asset:link rel="stylesheet" href="entry.css"/>
</head>

<body>
<div class="container-fluid">
    <form id="entry-form" class="show-only">

        <tmpl:row desc="Name" name="name" value="${mistake.getName()}"/>
        <tmpl:option-chooser desc="Language" name="language" options="${Entry.Language}"
                             selected="${mistake.getLanguage()}"/>
        <tmpl:row desc="Error" name="errorMessage" value="${mistake.getErrorMessage()}"/>
        <tmpl:row desc="Solution" name="solution" value="${mistake.getSolution()}"/>

        <div class="row">
            <div class="col-md-1">
                <button id="edit-btn" class="btn btn-primary type="button">Edit</button>
            </div>

            <div class="col-md-2">
                <input id="save-btn" class="btn btn-default" type="button" value="Save">
            </div>
        </div>
    </form>
</div>
</body>
</html>
