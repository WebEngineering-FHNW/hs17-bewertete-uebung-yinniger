package mvc

class MistakeController {

    def saveService

    def show(int id) {
        List<Mistake> foundMistakes = Mistake.findAllById(id)
        if (foundMistakes.size() == 0) {
            render status: 404
            return
        }
        render view: 'show', model: [mistake: foundMistakes.get(0)]
    }

    def save(Mistake mistake) {
        def result = saveService.save(mistake)
        render text: result.message, status: result.status
    }

    def create() {
        render view: 'create'
    }

}
