import 'dart:io';
import 'databook.dart';
import 'functions.dart';
import 'model.dart';

void main() {


   List<Books> objectList = [];
  for (var element in booksList) {
    Books books = Books(
        id: element['id'],
        title: element['title'],
        description: element['description'],
        publisher: element['publisher'],
        language: element['language'],
        copies: element['copies'],
        price: element['price']);
    objectList.add(books);
  }
 
  bool isRun = true;
  String? selected = '0';
  while (isRun) {
    
  print("Welcome to the Library!");
  print("ـــــــــــــــــــــ");
    print('1: Display all books');
    print('2: Search for books by title');
    print('3: Add New Book');
    print('4: Delete Book');
    print('5: Purchase Book & invoice');
    print('6: Edit book information');
    print('Q: Quit');
    selected = stdin.readLineSync();

    // Options:
    try{
      // 1 Display all books
    if (selected == '1') {
      print(booksList);
    }
     
    //  2 Search for books by title
    if (selected == '2') {
      print('Enter title');
      var title = stdin.readLineSync();
      searchMethodByTitle(title: title!);  
    }

    //  3 Add New Book
    if (selected == '3'){
      print("To add the book, you must fill out the following information:");
      print("* Insert book id:");
      String? bookId=stdin.readLineSync();

      print("* Insert book title:");
      String? bookTitle =stdin.readLineSync();


      print("* Insert book description:");
      String? bookDescription = stdin.readLineSync();

      print("* Insert book Publisher:");
      String? bookPublisher = stdin.readLineSync();

      print("* Insert book language:");
      String? bookLanguage = stdin.readLineSync();

      print("* Insert book copies:");
      int bookCopies = int.parse(stdin.readLineSync()!);

      print("* Insert book price:");
      String? bookPrice=stdin.readLineSync();

      addMethod(bookCopies,bookLanguage,bookPublisher,bookDescription,bookTitle,bookId,bookPrice);
      
      }
      

    //  4 Delete Book
    if (selected == '4'){
      print("Enter ID:");
      String id = stdin.readLineSync()!;
      deleteMethod(id:id);

    }
  
    // 5 Purchase Book & invoice
    if (selected == '5'){
      print("Please write the title of the book you would like to purchase:");
      String? bookpurchase = stdin.readLineSync();
      purchase(title:bookpurchase, price:''); 
      
    }
    //  6 Edit book information
    if(selected == '6'){
      print("Please enter the title of the book to edit:");
      String title = stdin.readLineSync() ?? "";
     editBookInformation(title:title);

    }
    // Q Quit
    if (selected == 'Q'){
      print("Thank you for visiting the library. Have a nice day!!");
      break;

    }
      } catch (error) {
    print("Error");
  }

}
}

