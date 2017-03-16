<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'blog.label', default: 'Blog')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-blog" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /> Entry</g:link></li>
                <li><g:link class="search" action="search">Search</g:link></li>
            </ul>
        </div>
        <div id="list-blog" class="content scaffold-list" role="main">
            <h1>Blog Entries</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:if test="${blogList != null}">
                <f:table collection="${blogList}" />
            </g:if>

            <div class="pagination">
                <g:paginate total="${blogCount ?: 0}" />
            </div>
        </div>
    </body>
</html>