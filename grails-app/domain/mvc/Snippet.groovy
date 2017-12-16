package mvc

import grails.web.databinding.WebDataBinding

class Snippet extends Entry {

    private String snippet

    Snippet(String name, Language language, String snippet) {
        super(name, language)
        this.snippet = snippet
    }

    @Override
    String toString() {
        return snippet
    }

    String getSnippet() {
        return snippet
    }

    void setSnippet(String snippet) {
        this.snippet = snippet
    }

    @Override
    Map<?, ?> getProperties() {
        String[] order = ["name", "language", "snippet"]
        return super.sortProperties(order)
    }

    static constraints = {
        snippet(blank: false)
    }
}
