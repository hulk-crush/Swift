/*
1. Придумать класс, методы которого могут создавать непоправимые ошибки. Реализовать их с помощью try/catch.

2. Придумать класс, методы которого могут завершаться неудачей. Реализовать их с использованием Error.
*/

enum LibraryErrors: Error{
    case inLibraryNotThisBook
    case notEnoughMoney
}

struct Book{
    var price: Int
    var numberOfBooks: Int
}

class Library {
    var deposite = 11
    
    
    var bookshelf = [
        "1": Book(price: 10, numberOfBooks: 5),
        "2": Book(price: 11, numberOfBooks: 0),
        "3": Book(price: 12, numberOfBooks: 3)]
    func getTheBook(withName: String) throws {
        guard var book = bookshelf[withName] else {
            throw LibraryErrors.inLibraryNotThisBook
        }
        guard book.numberOfBooks > 0 else {
            throw LibraryErrors.inLibraryNotThisBook
        }
        guard  book.price <= deposite else {
            throw LibraryErrors.notEnoughMoney
        }
        deposite -= book.price
        book.numberOfBooks -= 1
        bookshelf[withName] = book
        print("You got the Book: \(withName)")
    }
}


let library = Library()
try? library.getTheBook(withName: "1")
library.deposite
library.bookshelf


do {
    try library.getTheBook(withName: "2")
} catch LibraryErrors.inLibraryNotThisBook {
    print("Book is not in library")
} catch LibraryErrors.notEnoughMoney{
    print("Not enough money")
}
