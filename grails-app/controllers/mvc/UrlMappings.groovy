package mvc

class UrlMappings {

    static mappings = {
        // "/rooms"(resources: "room")
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
        "/"(redirect: "/entry/index")
        "/description"(redirect: "/static/description.html")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
