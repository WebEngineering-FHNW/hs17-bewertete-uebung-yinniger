<%@ page import="mvc.Entry" %>
<html>
<head>
    <title>Saved</title>
</head>

<body>
<p>Successfully Created:</p>
<tmpl:row name="Name" value="${mistake.getName()}"/>
<tmpl:row name="Language" value="${mistake.getLanguage()}"/>
<tmpl:row name="Error" value="${mistake.getErrorMessage()}"/>
<tmpl:row name="Solution" value="${mistake.getSolution()}"/>
</body>
</html>
