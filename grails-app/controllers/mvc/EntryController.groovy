package mvc

import groovy.json.JsonBuilder
import org.springframework.validation.FieldError

class EntryController {

    def showEntry(int id) {
        List<Entry> entries = getEntries()
        id = id - 1
        if (id >= entries.size()) {
            render(status: 404, text: 'Entry with id ' + id + ' not found')
            return
        }

        Entry entry = getEntries().get(id)
        if(entry.instanceOf(Mistake)) {
            Mistake mistake = (Mistake)entry
            render view: '/mistake/show', model: [mistake: mistake]
        } else if(entry.instanceOf(Snippet)) {
            render view: 'snippet', model: [snippet: entry]
        } else {
            render(status: 404, text: 'Entry with id ' + id + ' not found')
        }
    }

    def showEntries() {
        List<Entry> entries = getEntries()

        render view: 'entryList', model: [entries: entries]
    }

    private static List<Entry> getEntries() {
        List<Entry> entries = new ArrayList<>()
        entries.addAll(Mistake.findAll())
        entries.addAll(Snippet.findAll())
        entries.sort{entry1, entry2 -> entry1.getId() <=> entry2.getId()}

        return entries
    }
}
