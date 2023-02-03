import 'package:realm_dart/realm.dart';
import 'package:realm_app/schema.dart';

void main(List<String> arguments) {
  // Initialize Realm.
  final config = Configuration.local(
    [Book.schema],
    shouldDeleteIfMigrationNeeded: true,
  );
  // Realm.deleteRealm(config.path);
  final realm = Realm(config);
  print('Initialized Realm ${config.path}.');

  // Create some books.
  final books = <Book>[];
  books.addAll([
    Book(
      '1950325776',
      'Dart Apprentice: Fundamentals',
      subTitle: 'Modern Cross-Platform Programming With Dart',
      authors: ['Jonathan Sande', 'Kodeco Tutorial Team'],
    ),
    Book(
      '1950325784',
      'Dart Apprentice: Beyond the Basics',
      subTitle: 'Object-Oriented Programming, Concurrency & More',
      authors: ['Jonathan Sande', 'Kodeco Tutorial Team'],
    ),
  ]);

  // Save the books.
  realm.write(() {
    for (var book in books) {
      realm.add(book);
    }
  });

  // Cleanup Realm.
  realm.close();
}
