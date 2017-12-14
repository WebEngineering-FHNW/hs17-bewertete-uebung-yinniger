<%@ page import="mvc.Entry" %>
<tmpl:/shared/flash-message successMessage="Your ${entry.getClass().getSimpleName()} was successfully changed"/>
<div class="container-fluid">

    <div class="row header-div">
        <div class="col-md-3"></div>

        <div class="col-md-6">
            <h2 class="header-text">
                ${entry.getName()}
            </h2>
            <i id="edit-ico" class="material-icons icon-btn">mode_edit</i>
        </div>
    </div>

    <input id="type" type="hidden" value="${entry.getClass().getSimpleName().toLowerCase()}"/>

    <form id="entry-form" class="show-only">
        <input type="hidden" name="id" value="${entry.getId()}"/>
        <g:set var="counter" value="${0}"/>
        <g:each var="field" in="${entry.getProperties()}">
            <g:if test="${counter % 2 == 0}">
                <div class="row">
                <div class="col-md-3"></div>
            </g:if>
            <g:if test="${field.getKey() == "content"}"/>
            <g:elseif test="${field.getKey() == "language"}">
                <tmpl:/shared/option-chooser desc="Language" name="language" options="${Entry.Language}"
                                             selected="${field.getValue()}"/>
            </g:elseif>
            <g:else>
                <tmpl:/shared/row desc="${field.getKey()}" name="${field.getKey()}" value="${field.getValue()}"/>
            </g:else>
            <g:if test="${counter % 2 == 1}">
                </div>
            </g:if>
            <g:set var="counter" value="${counter + 1}"/>
        </g:each>
    </form>
</div>
