<%@ page import="grails.converters.JSON; mvc.Entry" %>
<html>
<head>
    <title>Create Mistake</title>
    <tmpl:/shared/imports/>
</head>

<body>
<tmpl:/shared/flash-message successMessage="Your Mistake was successfully created"/>
<div class="container-fluid">

    <tmpl:/shared/header-create name="New Mistake"/>

    <input id="type" type="hidden" value="mistake"/>

    <form id="entry-form">
        <div class="row">
            <div class="col-md-3"></div>
            <tmpl:/shared/row desc="Name" name="name" value=""/>
            <tmpl:/shared/option-chooser desc="Language" name="language" options="${Entry.Language}" selected=""/>
        </div>
        <div class="row">
            <div class="col-md-3"></div>
            <tmpl:/shared/row desc="Error" name="errorMessage" value=""/>
            <tmpl:/shared/row desc="Solution" name="solution" value=""/>
        </div>
    </form>
</div>
</body>
</html>
