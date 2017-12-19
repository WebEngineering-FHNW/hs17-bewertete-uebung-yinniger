<%@ page import="grails.converters.JSON; mvc.Entry" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Mistake</title>
    <tmpl:/shared/imports/>
</head>

<body>
<tmpl:/shared/flash-message successMessage="Your Mistake was successfully created"/>
<div class="container-fluid">

    <tmpl:/shared/header-create name="New Snippet"/>

    <input id="type" type="hidden" value="snippet"/>

    <form id="entry-form">
        <div class="row">
            <div class="col-md-3"></div>
            <tmpl:/shared/row desc="Name" name="name" value=""/>
            <tmpl:/shared/option-chooser desc="Language" name="language" options="${Entry.Language}" selected=""/>
        </div>
        <div class="row">
            <div class="col-md-3"></div>
            <tmpl:/shared/textarea/>
        </div>
    </form>
</div>
</body>
</html>
