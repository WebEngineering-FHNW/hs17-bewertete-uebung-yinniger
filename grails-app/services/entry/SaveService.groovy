package entry

import grails.transaction.Transactional
import groovy.json.JsonBuilder
import mvc.Entry
import org.springframework.validation.FieldError

@Transactional
class SaveService {

    def save(Entry entry) {
        if (!entry.validate()) {
            List<FieldError> errorList = entry.errors.fieldErrors
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
            [success: false, message: json.toPrettyString(), status: 400]
        } else {
            if(entry.save(flush: true)) {
                [success: true, message: "success", status: 201]
            } else {
                [success: false, message: "bad request", status: 400]
            }
        }
    }
}
