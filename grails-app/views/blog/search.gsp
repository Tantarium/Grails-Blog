<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Blog Find</title>
    </head>

    <body>
        <div class="nav" role="navigation">
            <ul>
                <li>
                    <a href="${createLink(uri: '/')}">
                        <g:img dir="images" file="Home-icon.png" height="20" width="20" />
                         <g:message code="default.home.label"/>
                     </a>
                </li>
            </ul>
        </div>

        <br />

        <h2>Search For Blog Entries</h2>

        <g:form controller="blog" method="get" >
            <input id="searchValue" type='text' name='value' value="${value}" />
            <g:actionSubmit id="submitButton" value="Search" />
        </g:form>

        Results: <br />

        <g:each var="blog" status="numberOfIndex" in="${blogs}">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <a href="/blog/show/${blog?.id}">
                        <div id="title ${numberOfIndex}"><h4>${blog.title}</h4></div>
                    </a>
                </div>
                <div class="panel-body">
                    <b>Author:</b> ${blog.author}
                    <br />
                    <b>Date Created:</b> ${blog.dateCreated}
                </div>
                <div class="panel-footer">
                    ${blog.description}
                </div>
            </div>
        </g:each>
    </body>
</html>