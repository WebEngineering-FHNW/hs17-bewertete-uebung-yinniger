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
            <td><a href="/${entry.getClass().simpleName.toLowerCase()}/show?id=${entry.getId()}">${entry.getName()}</a></td>
            <td>${entry.getLanguage()}</td>
            <td>${entry.toString()}</td>
        </tr>
    </g:each>
</table>
</body>
</html>
