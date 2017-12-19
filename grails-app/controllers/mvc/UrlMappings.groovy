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
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
