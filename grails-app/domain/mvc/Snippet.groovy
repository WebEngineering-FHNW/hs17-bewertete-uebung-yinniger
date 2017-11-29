package mvc

class Snippet extends AbstractEntry {

    private String snippet

    Snippet(String name, Language language, String snippet) {
        super(name, language)
    }

    @Override
    String toString() {
        return super.getName() + " : " + snippet
    }

    String getSnippet() {
        return snippet
    }

    void setSnippet(String snippet) {
        this.snippet = snippet
    }

    static constraints = {
        snippet(blank: false)
    }
}
