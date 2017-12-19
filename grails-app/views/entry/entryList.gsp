<!DOCTYPE html>
<html>
<head>
    <title>Journal</title>
    <script src="/assets/jquery-2.2.0.min.js"></script>
    <script src="/assets/bootstrap.js"></script>
    <script src="/assets/index.js"></script>
    <asset:link rel="stylesheet" href="bootstrap.css"/>
    <link rel="stylesheet" href="/assets/table-main.css">
    <link rel="stylesheet" href="/assets/shared.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>

<body>

<div class="row header-div">
    <div class="col-md-3"></div>

    <div class="col-md-5">
        <h2 class="header-text">
            Entries
        </h2>
    </div>
    <div class="col-md-1">
        <div id="circle">
            <i id="edit-ico" class="material-icons icon-btn">add</i>
            <div id="circle-menu">
                <a href="/snippet/create">
                    <div class="entry-option-desc">Snippet</div>
                </a>
                <a href="/mistake/create">
                    <div class="entry-option-desc">Mistake</div>
                </a>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-3"></div>

    <div class="col-md-6">
        <table>
            <tr>
                <th class="first-row">Name</th>
                <th>Language</th>
                <th>Content</th>
                <th class="edit-row"></th>
            </tr>
            <g:each var="entry" in="${entries}">
                <tr>
                    <td class="first-row">${entry.getName()}</td>
                    <td>${entry.getLanguage()}</td>
                    <td>${entry.toString()}</td>
                    <td class="edit-row">
                        <a href="/${entry.getClass().simpleName.toLowerCase()}/show?id=${entry.getId()}">
                            <i class="material-icons edit-entry-btn">mode_edit</i>
                        </a>
                    </td>
                </tr>
            </g:each>
        </table>
    </div>
</div>
</body>
</html>
