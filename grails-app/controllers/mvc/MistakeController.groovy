package mvc

class MistakeController {

    def show (int id) {
        List<Mistake> foundMistakes = Mistake.findAllById(id)
        if (foundMistakes.size() == 0) {
            render status: 404
            return
        }
        render view: 'show', model: [mistake: foundMistakes.get(0)]
    }

    def save (Mistake mistake) {
        try {
            mistake.save()
            println(mistake.errors)
            println(Mistake.findAll())
            return mistake
        } catch (Exception e) {
            return e
        }
    }

}
