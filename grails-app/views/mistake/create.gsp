<%@ page import="grails.converters.JSON; mvc.Entry" %>
<html>
<head>
    <title>Create Mistake</title>
    <script src="/assets/jquery-2.2.0.min.js"></script>
    <script src="/assets/entry.js"></script>
</head>

<body>
<p>Create Mistake</p>
<form id="entry-form">
    <tmpl:row desc="Name" name="name" value=""/>
    <tmpl:option-chooser desc="Language" name="language" options="${Entry.Language}" selected=""/>
    <tmpl:row desc="Error" name="errorMessage" value=""/>
    <tmpl:row desc="Solution" name="solution" value=""/>
    <input id="save-btn" type="button" value="Save" disabled>
</form>
</body>
</html>
