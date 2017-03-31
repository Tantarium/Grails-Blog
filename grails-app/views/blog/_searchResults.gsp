<div class="col-sm-12">
    <g:each var="item" status="numberOfIndex" in="${blogs}">
        <div class="panel panel-default">
            <div class="panel-heading">
                <g:link mapping="blogLink" params="[id: item.id,title: seo.convert(value:item.title)]">
                    <div id="title ${numberOfIndex}"><h4>${item.title}</h4></div>
                </g:link>
            </div>
            <div class="panel-body">
                <b>Author:</b> ${item.author}
                <br />
                <b>Date Created:</b> ${item.dateCreated}
            </div>
            <div class="panel-footer">
                ${item.description}
            </div>
        </div>
    </g:each>
</div>