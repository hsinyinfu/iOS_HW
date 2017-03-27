/*:

 # Your shopping cart

 Now, it's your turn to create your shopping list.
 
 Assume that you want to buy following books:

 * "Digital Fortress" by "Dan Brown", $9.99
 * "Angels & Demons" by "Dan Brown", $17.00
 * "The Da Vinci Code" by "Dan Brown", $9.99
 * "Deception Point" by "Dan Brown", $17.00
 * "Harry Potter and the Goblet of Fire" by "J.K. Rowling", $12.99
 * "Harry Potter and the Half-Blood Prince" by "J.K. Rowling", $12.99
 * "Harry Potter and the Deathly Hallows" by "J.K. Rowling", $14.99
 * "旅行與讀書" by "詹宏志", $12.00
 * "國宴與家宴" by "王宣一", $7.99

 Then, let's create a book store first:
 
 */
let books : [[String:String]] = [
    ["title":"Digital Fortress","author":"Dan Brown","price":"9.99"],
    ["title":"Angels & Demons","author":"Dan Brown","price":"17"],
    ["title":"The Da Vinci Code","author":"Dan Brown","price":"9.99"],
    ["title":"Deception Point","author":"Dan Brown","price":"17"],
    ["title":"Harry Potter and the Goblet of Fire","author":"J.K. Rowling","price":"12.99"],
    ["title":"Harry Potter and the Half-Blood Prince","author":"J.K. Rowling","price":"12.99"],
    ["title":"Harry Potter and the Death Hallows","author":"J.K. Rowling","price":"14.99"],
    ["title":"旅行與讀書","author":"詹宏志","price":"12.00"],
    ["title":"國宴與家宴","author":"王宣一","price":"7.99"],
]
var bookStore = BookStore()

/*:
 
 Now start to feed data to the book store.
 
 You have to prepare following functions:
 1. A function which returns the name of authors in a set or a list. 
    _Note, you have to remove duplicated authors._
 2. A function which returns the totoal price of books to purchase
 3. A function which returns the number of books to buy
 4. A function which returns a book with its title, author, and price by a given index.
    If the index is out of bound, return `nil`.
 
 */

// Use this
func distinctAuthors() -> Set<String> {
    var setOfAuthors : Set<String> = []
    for book in books{
        setOfAuthors.insert(book["author"]!)
    }
    return setOfAuthors
}
// or this
/*func distinctAuthors() -> [String] {
    var setOfAuthors : Set<String> = []
    for book in books{
        setOfAuthors.insert(book["author"]!)
    }
    let arrayOfAuthors = [String](setOfAuthors)
    return arrayOfAuthors
}*/
// then
bookStore.setDataSource(authorsGetter: distinctAuthors)

func totalBookPrice() -> Double {
    var sum = 0.0
    for book in books{
        sum += Double(book["price"]!)!
    }
    return sum
}
bookStore.setDataSource(priceCalculator: totalBookPrice)

func getBook(at index: Int) -> (title: String, author: String, price: Double)? {
    guard index < books.count && index >= 0 else{
        return nil
    }
    var book = books[index]
    let title = book["title"]!
    let author = book["author"]!
    let price = book["price"]!
    return ( title , author , Double(price)! )
}
bookStore.setDataSource(bookGetter: getBook(at:))
/*:

 Finally, let's show the book store shopping cart:

 */

bookStore.showInPlayground()

//: ---
//: [<- Previous](@previous) | [Next ->](@next)
