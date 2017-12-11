package mvc

import grails.converters.JSON
import groovy.json.JsonBuilder
import org.springframework.validation.FieldError

class MistakeController {

    def show(int id) {
        List<Mistake> foundMistakes = Mistake.findAllById(id)
        if (foundMistakes.size() == 0) {
            render status: 404
            return
        }
        render view: 'show', model: [mistake: foundMistakes.get(0)]
    }

    def save(Mistake mistake) {
        if (!mistake.validate()) {
            List<FieldError> errorList = mistake.errors.fieldErrors
            JsonBuilder json = new JsonBuilder()

            // code from https://stackoverflow.com/questions/28206255/groovy-simple-json-array-builder
            json {
                errors errorList.collect {
                    [
                            field: it.getField(),
                            value: it.getRejectedValue(),
                    ]
                }
            }
            println(json.toPrettyString())

            render text: json.toPrettyString(), contentType: "application/json", status: 400
            return
        }

        mistake.save()
        render text: "success", status: 201
    }

    def create() {
        render view: 'create'
    }

}
