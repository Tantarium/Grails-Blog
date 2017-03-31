<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <g:set var="entityName" value="${message(code: 'blog.label', default: 'Blog')}" />
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
                <sec:ifLoggedIn>
                    <li>
                        <g:link action="create">
                            <g:img dir="image" file="pen-and-paper.png" height="20" width="20" />
                            <g:message code="default.new.label" args="[entityName]" />
                             Entry
                        </g:link>
                    </li>
                </sec:ifLoggedIn>
            </ul>
        </div>

        <br />
        <div class="col-sm-12">
            <h2>Search For Blog Entries</h2>

            <br />

            <form onsubmit="jQuery.ajax( {
                    type:'GET',
                    data:jQuery(this).serialize(),
                    url:'/blog/searchResults',
                    success:function(data,textStatus){
                        jQuery('#searchResults').html(data);
                    },
                    error:function(XMLHttpRequest,
                    textStatus,
                    errorThrown){}
                });
                return false" method="get" id="searchForm">

                <input id="searchValue" type='text' name='value' value="${value}" />
                <g:actionSubmit id="submitButton" value="Search" />
            </form>

            <br />

            Search Results: <br />
        </div>

        <div id="searchResults">
            <g:render template="searchResults" > </g:render>
        </div>
    </body>
</html>