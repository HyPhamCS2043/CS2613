
// Base Class: Book
class Book {
    constructor(title, author) {
        this.title = title;
        this.author = author;
        this.isCheckedOut = false;
    }

    getTitle() {
        return this.title;
    }

    getAuthor() {
        return this.author;
    }

    checkOut() {
        if (this.isCheckedOut) {
            return "Already checked out";
        }
        this.isCheckedOut = true;
        return `${this.title} has been checked out`;
    }

    returnBook() {
        this.isCheckedOut = false;
    }

    status() {
        return this.isCheckedOut ? "Checked out" : "Available";
    }

    isDigital() {
        return false;
    }
}

// Derived Class: EBook
class EBook extends Book {
    constructor(title, author, fileSize) {
        super(title, author);
        this.fileSize = fileSize; // in MB
    }

    download() {
        return `Downloading ${this.title} (${this.fileSize}MB)`;
    }

    isDigital() {
        return true;
    }
}


// Create book objects examples
const books = [
    new Book("1984", "George Orwell"),
    new EBook("Digital Fortress", "Dan Brown", 2),
    new Book("To Kill a Mockingbird", "Harper Lee"),
    new EBook("The Martian", "Andy Weir", 5)
];


// Display book catalog
console.log("\n--- Library Catalog ---");
books.forEach(book => {
    console.log(`${book.getTitle()} by ${book.getAuthor()} - ${book.status()}`);
    if (book.isDigital()) {
        console.log(book.download());
    }
});


// Check out a book
const bookToCheckout = books.find(b => b.getTitle() === "1984");
if (bookToCheckout) {
    console.log(`\nChecking out "${bookToCheckout.getTitle()}"...`);
    console.log(bookToCheckout.checkOut());
}


// Print updated catalog
console.log("\n--- Updated Catalog ---");
books.forEach(book => {
    console.log(`${book.getTitle()} by ${book.getAuthor()} - ${book.status()}`);
});