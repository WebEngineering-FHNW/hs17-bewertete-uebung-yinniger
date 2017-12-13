package mvc

class SnippetController {

    def saveService

    def save(Snippet snippet) {
        def result = saveService.save(snippet)
        render text: result.message, status: result.status
    }

    def show(int id) {
        List<Snippet> foundSnippets = Snippet.findAllById(id)
        println(foundSnippets)
        if (foundSnippets.size() == 0) {
            render status: 404
            return
        }
        render view: 'show', model: [snippet: foundSnippets.get(0)]
    }
}
