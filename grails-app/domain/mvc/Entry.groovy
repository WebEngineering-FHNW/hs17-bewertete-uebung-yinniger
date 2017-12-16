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

    protected sortProperties(String[] order) {
        Map<?, ?> properties = new LinkedHashMap<>()
        Object current
        for(int i = 0; i != order.length; ++i) {
            current = getProperty(order[i])
            properties.put(order[i], current)
        }
        return properties
    }
}
