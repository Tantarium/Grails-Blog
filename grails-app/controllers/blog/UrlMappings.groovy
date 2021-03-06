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
        "/comment"(controller: 'Blog')
        "/comment/index"(controller: 'Blog')
        "/comment/create"(controller: 'Blog')
//        "/comment/show/*"(controller: 'Blog')
        "/comment/edit/*"(controller: 'Blog')
    }
}
