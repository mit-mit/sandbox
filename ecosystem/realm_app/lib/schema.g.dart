// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Book extends _Book with RealmEntity, RealmObjectBase, RealmObject {
  Book(
    String isbn10,
    String title, {
    String? subTitle,
    Iterable<String> authors = const [],
  }) {
    RealmObjectBase.set(this, 'isbn10', isbn10);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'subTitle', subTitle);
    RealmObjectBase.set<RealmList<String>>(
        this, 'authors', RealmList<String>(authors));
  }

  Book._();

  @override
  String get isbn10 => RealmObjectBase.get<String>(this, 'isbn10') as String;
  @override
  set isbn10(String value) => throw RealmUnsupportedSetError();

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => throw RealmUnsupportedSetError();

  @override
  String? get subTitle =>
      RealmObjectBase.get<String>(this, 'subTitle') as String?;
  @override
  set subTitle(String? value) => throw RealmUnsupportedSetError();

  @override
  RealmList<String> get authors =>
      RealmObjectBase.get<String>(this, 'authors') as RealmList<String>;
  @override
  set authors(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<Book>> get changes =>
      RealmObjectBase.getChanges<Book>(this);

  @override
  Book freeze() => RealmObjectBase.freezeObject<Book>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Book._);
    return const SchemaObject(ObjectType.realmObject, Book, 'Book', [
      SchemaProperty('isbn10', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('subTitle', RealmPropertyType.string, optional: true),
      SchemaProperty('authors', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
    ]);
  }
}
