import 'package:http/http.dart' as http;
import 'dart:convert';

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

class PkgInfo {
  final String name;
  final PkgVersion latest;

  PkgInfo({required this.name, required this.latest});

  factory PkgInfo.fromJson(Map<String, dynamic> json) {
    return PkgInfo(
      name: json['name'],
      latest: PkgVersion.fromJson(json['latest']),
    );
  }
}

class PkgVersion {
  final String archiveUrl;
  final PkgPubspec pubspec;

  PkgVersion({required this.archiveUrl, required this.pubspec});

  factory PkgVersion.fromJson(Map<String, dynamic> json) {
    return PkgVersion(
      archiveUrl: json['archive_url'],
      pubspec: PkgPubspec.fromJson(json['pubspec']),
    );
  }
}

class PkgPubspec {
  final String version;
  final String name;

  PkgPubspec({required this.version, required this.name});

  factory PkgPubspec.fromJson(Map<String, dynamic> json) {
    return PkgPubspec(
      version: json['version'],
      name: json['name'],
    );
  }
}
