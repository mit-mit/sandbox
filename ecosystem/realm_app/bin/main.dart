import 'package:realm_dart/realm.dart';
import 'package:realm_app/schema.dart';

void main(List<String> arguments) {
  // Initialize Realm.
  final config = Configuration.local([Book.schema]);
  final realm = Realm(config);

  // Print book count.
  print('Realm contains ${realm.all<Book>().length} books');

  // Print Dart books.
  final books = realm.query<Book>("title CONTAINS[c] 'dart'");
  for (var book in books) {
    print('Found Dart book "${book.fullTitle}" by ${book.authors.join(';')}.');
  }

  // Cleanup Realm.
  realm.close();
  Realm.shutdown();
}
