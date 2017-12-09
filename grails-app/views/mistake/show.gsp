<%@ page import="grails.converters.JSON; mvc.Entry" %>
<html>
<head>
    <title>${mistake.getName()}</title>
    <script src="/assets/jquery-2.2.0.min.js"></script>
    <script src="/assets/entry.js"></script>
</head>

<body>
<form id="entry-form" class="show-only">
    <button id="edit-btn" type="button">Edit</button>
    <tmpl:row desc="Name" name="name" value="${mistake.getName()}"/>
    <tmpl:option-chooser desc="Language" name="language" options="${Entry.Language}"
                         selected="${mistake.getLanguage()}"/>
    <tmpl:row desc="Error" name="errorMessage" value="${mistake.getErrorMessage()}"/>
    <tmpl:row desc="Solution" name="solution" value="${mistake.getSolution()}"/>
    <input id="save-btn" type="button" value="Save">
</form>
</body>
</html>
