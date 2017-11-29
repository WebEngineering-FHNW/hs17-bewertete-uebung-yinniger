package mvc

class EntryController {

    def showEntry(int id) {
        List<AbstractEntry> entries = getEntries()
        if (id >= entries.size()) {
            render(status: 404, text: 'Entry with id ' + id + ' not found')
            return
        }

        AbstractEntry entry = getEntries().get(id - 1)
        render text: entry.toString()
    }

    def showEntries() {
        List<AbstractEntry> entries = getEntries()

        render text: entries.toString()
    }

    private static List<AbstractEntry> getEntries() {
        List<AbstractEntry> entries = new ArrayList<>()
        entries.addAll(Mistake.findAll())
        entries.addAll(Snippet.findAll())
        entries.sort{entry1, entry2 -> entry1.getId() <=> entry2.getId()}

        return entries
    }

}
