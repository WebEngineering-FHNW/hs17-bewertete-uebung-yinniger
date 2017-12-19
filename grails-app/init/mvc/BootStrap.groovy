package mvc

import grails.util.Environment

class BootStrap {

    def init = { servletContext ->
        if (Environment.current == Environment.PRODUCTION) {
            return
        }

        save(new Mistake(name: "List", language: Entry.Language.BASH, errorMessage: "ll", solution: "ls -la"))
        save(new Mistake(name: "Sudo", language: Entry.Language.BASH, errorMessage: "sido", solution: "sudo"))
        save(new Mistake(name: "Docker", language: Entry.Language.BASH, errorMessage: "docker-composer", solution:
                "docker-compose"))
        save(new Mistake(name: "Locate", language: Entry.Language.BASH, errorMessage: "find brot", solution: "locate " +
                "brot"))
        save(new Snippet(name: "Import", language: Entry.Language.JAVA, snippet: "import abc.d"))
        save(new Snippet(name: "Integer", language: Entry.Language.JAVA, snippet: "int i = 0"))
    }

    static save(domainObject) {
        domainObject.save(failOnError: true)
    }

    def destroy = {
    }
}
