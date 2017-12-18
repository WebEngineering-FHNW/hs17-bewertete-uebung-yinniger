package mvc

class EntryController {

    def index() {
        List<Entry> entries = getEntries()

        render view: 'entryList', model: [entries: entries]
    }

    private static List<Entry> getEntries() {
        List<Entry> entries = new ArrayList<>()
        entries.addAll(Mistake.findAll())
        entries.addAll(Snippet.findAll())
        entries.sort { entry1, entry2 -> entry1.getId() <=> entry2.getId() }

        return entries
    }
}
