import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:json/json.dart';

main() async {
  const pubUrl = "https://pub.dartlang.org/api/packages/protobuf";
  var response = await http.get(Uri.parse(pubUrl));
  if (response.statusCode == 200) {
    PkgInfo info = PkgInfo.fromJson(json.decode(response.body));
    print('Package ${info.name}, latest is v${info.latest.pubspec.version}');
  } else {
    throw Exception('Failed to load package info');
  }
}

@JsonCodable()
class PkgInfo {
  final String name;
  final PkgVersion latest;

  PkgInfo({required this.name, required this.latest});
}

@JsonCodable()
class PkgVersion {
  final String archiveUrl;
  final PkgPubspec pubspec;

  PkgVersion({required this.archiveUrl, required this.pubspec});
}

@JsonCodable()
class PkgPubspec {
  final String version;
  final String name;

  PkgPubspec({required this.version, required this.name});
}
