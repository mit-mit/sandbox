import 'package:realm_dart/realm.dart';
import 'package:realm_app/schema.dart';

void main(List<String> arguments) {
  // Initialize Realm.
  final config = Configuration.local([Book.schema]);
  print('Realm: ${config.path}');

  // Delete Realm if it already exists.
  if (config.path != null) {
    Realm.deleteRealm(config.path);
  }
  final realm = Realm(config);

  // Query for cars with at least 100 miles on them.
  final books = realm.query<Book>("title CONTAINS[c] 'dart'");
  for (var book in books) {
    print('Found book ${book.fullTitle} by ${book.authors.join(';')}.');
  }

  // Clean Realm.
  realm.close();
}
