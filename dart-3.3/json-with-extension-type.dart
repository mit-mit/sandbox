// Experimental feature. Run with:
// dart run --enable-experiment=inline-class json-with-extension-type.dart

import 'package:http/http.dart' as http;
import 'dart:convert';

main() async {
  const pubUrl = "https://pub.dartlang.org/api/packages/protobuf";
  var response = await http.get(Uri.parse(Uri.encodeFull(pubUrl)));
  if (response.statusCode == 200) {
    PkgInfo info = PkgInfo(json.decode(response.body));
    print('Package ${info.name}, v${info.latest.pubspec.version}');
  } else {
    throw Exception('Failed to load package info');
  }
}

extension type PkgInfo(Map<String, dynamic> json) {
  String get name => json['name']!;
  PkgVersion get latest => PkgVersion(json['latest']!);
  String? get version => json['version']!;
}

extension type PkgVersion(Map<String, dynamic> json) {
  String get archiveUrl => json['archive_url']!;
  PkgPubspec get pubspec => PkgPubspec(json['pubspec']!);
}

extension type PkgPubspec(Map<String, dynamic> json) {
  String get version => json['version']!;
  String get name => json['name']!;
}
