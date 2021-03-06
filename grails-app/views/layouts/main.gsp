<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <asset:link rel="icon" href="lp3.png" type="image/x-ico" />
    <title>
        Lp3's Blog
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>
</head>
<body>

    <div class="navbar navbar-default navbar-static-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/">
                    <i class="fa grails-icon"">
                        <asset:image src="planet.jpg" />
                    </i> The Blog of The <abbr title="Larry Pohto III">Lp3</abbr>
                </a>
            </div>
            <div class="navbar-collapse collapse" aria-expanded="false" style="height: 0.8px;">
                <ul class="nav navbar-nav navbar-right">
                    <g:pageProperty name="page.nav" />
                </ul>
            </div>
        </div>
    </div>

    <div class="floatingButton">
        <sec:ifLoggedIn>
            <form name="logout" method="POST" action="${createLink(controller:'logout') }">
                <button id="logoutButton" class="btn btn-primary">
                    <g:img dir="images" file="logout.ico" height="20" width="20" />
                     Log Out
                 </button>
            </form>
        </sec:ifLoggedIn>
    </div>

    <div class="floatingButton">
        <sec:ifNotLoggedIn>
            <a href="${createLink(uri: '/login/auth')}">
                <button id="loginButton" class="btn btn-primary">
                    <g:img dir="images" file="key.png" height="20" width="20" />
                     Log In
                </button>
            </a>
        </sec:ifNotLoggedIn>
    </div>

    <g:layoutBody/>

    <div class="footer" role="contentinfo"></div>

    <div id="spinner" class="spinner" style="display:none;">
        <g:message code="spinner.alt" default="Loading&hellip;"/>
    </div>

    <asset:javascript src="application.js"/>

</body>
</html>
