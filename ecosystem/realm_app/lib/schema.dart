import 'package:realm_dart/realm.dart';
part 'schema.g.dart';

@RealmModel()
class _Book {
  @PrimaryKey()
  late final String isbn10;

  late final String title;
  late final String? subTitle;
  late List<String> authors;

  String get fullTitle => (subTitle == null) ? title : '$title;$subTitle';
}
