<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Blog Find</title>
    </head>

    <body>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            </ul>
        </div>

        <br />
        <br />

        <h2>Postular Search</h2>

        <g:form controller="blog" method="get" >
            <input type='text' name='value' value="${value}" />
            <g:actionSubmit value="Search" />
        </g:form>

        Results For You:

        <ol>
            <g:each var="blog" in="${blogs}">
                <li>
                    ${blog?.title}
                </li>
            </g:each>
        </ol>
    </body>
</html>