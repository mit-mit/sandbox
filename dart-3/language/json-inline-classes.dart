// Experimental feature. Run with:
// dart run --enable-experiment=inline-class json-inline-classes.dart

import 'package:http/http.dart' as http;
import 'dart:convert';

main() async {
  const pubUrl = "https://pub.dartlang.org/api/packages/protobuf";
  var response = await http.get(Uri.parse(Uri.encodeFull(pubUrl)));
  if (response.statusCode == 200) {
    PkgInfo info = PkgInfo(json.decode(response.body));
    print('Package ${info.name}, v ${info.latest.pubspec.version}');
  } else {
    throw Exception('Failed to load package info');
  }
}

inline class PkgInfo {
  final Map<String, dynamic> json;
  PkgInfo(this.json);
  String get name => json['name']!;
  PkgVersion get latest => PkgVersion(json['latest']!);
  String? get version => json['version']!;
}

inline class PkgVersion {
  final Map<String, dynamic> json;
  PkgVersion(this.json);
  String get archiveUrl => json['archive_url']!;
  PkgPubspec get pubspec => PkgPubspec(json['pubspec']!);
}

inline class PkgPubspec {
  final Map<String, dynamic> json;
  PkgPubspec(this.json);
  String get version => json['version']!;
  String get name => json['name']!;
}
