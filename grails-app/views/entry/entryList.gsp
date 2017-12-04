<html>
<head>
    <meta name="layout" content="main">
    <title>Journal</title>
</head>
<body>
Available Entries:
<table>
    <tr>
        <th>Name</th>
        <th>Language</th>
        <th>Content</th>
    </tr>
    <g:each var="entry" in="${entries}">
        <tr>
            <td>${entry.getName()}</td>
            <td>${entry.getLanguage()}</td>
            <td>${entry.getContent()}</td>
        </tr>
    </g:each>
</table>
</body>
</html>