package blog

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        name blogLink: "/blog/show/$id/$title?" {
            controller = 'blog'
            action = 'show'
        }

        "/"(controller: 'Blog')
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
