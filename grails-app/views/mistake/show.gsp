<%@ page import="grails.converters.JSON; mvc.Entry" %>
<!DOCTYPE html>
<html>
<head>
    <title>${mistake.getName()}</title>
    <tmpl:/shared/imports />
</head>

<body>
<tmpl:/shared/show-entry entry="${mistake}"/>
</body>
</html>
