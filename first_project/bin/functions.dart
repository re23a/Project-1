

import 'dart:io';
import 'databook.dart';
import 'model.dart';

 List<Books> objectList = [];


// for Search for books by title
void searchMethodByTitle({required String title}) {
 List book = booksList.where((book) => book['title'] == title).toList(); 
 print(book);
 
 }

// for Add book
void addMethod(int bookCopies, String? bookLanguage, String? bookPublisher, String? bookDescription, String? bookTitle, String? bookId, String? bookPrice) {
Books books = Books(
        id:bookId!,title:bookTitle!,description:bookDescription!
        ,publisher:bookPublisher!,language:bookLanguage,copies:bookCopies,price:bookPrice );
         objectList.add(books);
         for (Books book in objectList) {
         print("Book(Id:${book.id} , Title: ${book.title} ,Description: ${book.description} ,Publisher:${book.publisher},language: ${book.language},copies:${book.copies},price ${book.price})");      
         }
        print(objectList);
}



// for Delete Book
void deleteMethod({required String id}) {
booksList.removeWhere((element) => element.containsValue(id));
print("$id Deleted successfully");
print("Library after deleting book$booksList");
}

// for purchase book
 void purchase({String? title,required String price}){
   var book = booksList.firstWhere((book) => book['title'] == title, orElse: () => {});
  if (book.isNotEmpty) {
    // Print invoice
    print("The invoice, Thank you for shopping with us!!");
    print("Price: ${book['price']}");
       
  } else {
    print("Book not found");
    }
 }

// for Edit information book
void editBookInformation({required String title}) {
  var book = booksList.firstWhere((book) => book['title'] == title, orElse: () => {});
  if (book.isNotEmpty) {
    print("Current Information:");
    print("Title: ${book['title']}");
    print("Description: ${book['description']}");
    print("Publisher: ${book['Publisher']}");
    print("Language: ${book['language']}");
    print("Copies: ${book['copies']}");
    print("Price: ${book['price']}");
 
    print("Enter new information:");
 
    print("Insert book title:");
    String? newTitle = stdin.readLineSync();
 
    print("Insert book description:");
    String? newDescription = stdin.readLineSync();
 
    print("Insert book Publisher:");
    String? newPublisher = stdin.readLineSync();
 
    print("Insert book language:");
    String? newLanguage = stdin.readLineSync();
 
    print("Insert book copies:");
    int? newCopies = int.tryParse(stdin.readLineSync() ?? '');
 
    print("Insert book price:");
    String? newPrice = stdin.readLineSync();
 
    booksList[booksList.indexOf(book)] = {
      'id': book['id'],
      'title': newTitle ?? book['title'],
      'description': newDescription ?? book['description'],
      'Publisher': newPublisher ?? book['Publisher'],
      'language': newLanguage ?? book['language'],
      'copies': newCopies ?? book['copies'],
      'price': newPrice ?? book['price'],
    };
    
  } else {
    print("Book not found");
  }
}


















