import 'package:realm_dart/realm.dart';
import 'package:realm_app/schema.dart';

void main(List<String> arguments) {
  // Initialize Realm.
  final config = Configuration.local([Book.schema]);

  // Delete entire Realm.
  Realm.deleteRealm(config.path);
}
