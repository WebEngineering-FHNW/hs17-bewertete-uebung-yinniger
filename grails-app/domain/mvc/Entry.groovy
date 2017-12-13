package mvc

abstract class Entry {

    enum Language {
        JAVA, PYTHON, PHP, BASH, GIT, DOCKER, JAVASCRIPT, CSS
    }

    private String name
    private Language language

    Entry(String name, Language language) {
        this.name = name
        this.language = language
    }

    String getName() {
        return name
    }

    void setName(String name) {
        this.name = name
    }

    Language getLanguage() {
        return language
    }

    void setLanguage(Language language) {
        this.language = language
    }

    static constraints = {
        id(blank: false)
        name(blank: false)
        language(blank: false)
    }
}
