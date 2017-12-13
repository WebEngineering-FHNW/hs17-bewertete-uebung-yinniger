<%@ page import="grails.converters.JSON; mvc.Entry" %>
<html>
<head>
    <title>Create Mistake</title>
    <tmpl:/shared/imports/>
</head>

<body>
<tmpl:/shared/flash-message successMessage="Your Mistake was successfully created"/>
<tmpl:/shared/sidebar/>
<div class="container-fluid">
    <h2>Create Mistake</h2>
    <input id="type" type="hidden" value="mistake"/>

    <form id="entry-form">
        <tmpl:/shared/row desc="Name" name="name" value=""/>
        <tmpl:/shared/option-chooser desc="Language" name="language" options="${Entry.Language}" selected=""/>
        <tmpl:/shared/row desc="Error" name="errorMessage" value=""/>
        <tmpl:/shared/row desc="Solution" name="solution" value=""/>
        <div class="row">
            <div class="col-md-3 right">
                <input id="save-btn" class="btn btn-primary" type="button" value="Save">
            </div>
        </div>
    </form>
</div>
</body>
</html>
