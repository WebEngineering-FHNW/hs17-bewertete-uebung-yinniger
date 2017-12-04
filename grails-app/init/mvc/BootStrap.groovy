package mvc

import grails.util.Environment

class BootStrap {

    def init = { servletContext ->
        if (Environment.current == Environment.PRODUCTION) {
            return
        }

        Room windowRoom = save(new Room(name: "1.333", max: 32))
        Room cornerRoom = save(new Room(name: "1.331", max: 42))

        Person dierk = save(new Person(firstName: "Dierk", lastName: "König", email:"dierk.koenig@fhnw.ch"))

        Date today = new Date().clearTime()
        save(new Booking(booker: dierk, room: windowRoom, date: today - 1, slot: Booking.AM))
        save(new Booking(booker: dierk, room: windowRoom, date: today,     slot: Booking.AM))
        save(new Booking(booker: dierk, room: windowRoom, date: today + 1, slot: Booking.AM))
        save(new Booking(booker: dierk, room: cornerRoom, date: today ,    slot: Booking.AM))

        save(new Mistake(name: "Test", language: Entry.Language.BASH, errorMessage: "ll", solution: "ls -la"))
        save(new Mistake(name: "Test", language: Entry.Language.BASH, errorMessage: "sido", solution: "sudo"))
        save(new Mistake(name: "Test", language: Entry.Language.BASH, errorMessage: "docker-composer", solution: "docker-compose"))
        save(new Mistake(name: "Test", language: Entry.Language.BASH, errorMessage: "find brot", solution: "locate brot"))
    }

    static save(domainObject) {
        domainObject.save(failOnError: true)
    }

    def destroy = {
    }
}
