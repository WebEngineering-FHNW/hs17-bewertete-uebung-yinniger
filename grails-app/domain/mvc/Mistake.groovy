package mvc

class Mistake extends Entry {

    private String errorMessage
    private String solution

    Mistake(String name, Language language, String errorMessage, String solution) {
        super(name, language)
        this.errorMessage = errorMessage
        this.solution = solution
    }

    @Override
    String toString() {
        return "'" + errorMessage + "'" + " solved with: " + "'" + solution + "'"
    }

    String getErrorMessage() {
        return errorMessage
    }

    void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage
    }

    String getSolution() {
        return solution
    }

    void setSolution(String solution) {
        this.solution = solution
    }

    static constraints = {
        errorMessage(blank: false)
    }
}
