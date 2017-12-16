package mvc

import grails.web.databinding.WebDataBinding

class Mistake extends Entry {

    private String errorMessage
    private String solution

    Mistake(String name, Language language, String errorMessage, String solution) {
        super(name, language)
        this.errorMessage = errorMessage
        this.solution = solution
        print(getProperties())
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

    @Override
    Map<?, ?> getProperties() {
        String[] order = ["name", "language", "errorMessage", "solution"]
        return super.sortProperties(order)
    }

    static constraints = {
        errorMessage(blank: false)
    }
}
