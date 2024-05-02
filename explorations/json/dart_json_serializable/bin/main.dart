import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'main.g.dart';

main() async {
  const pubUrl = "https://pub.dartlang.org/api/packages/protobuf";
  var response = await http.get(Uri.parse(pubUrl));
  if (response.statusCode == 200) {
    PkgInfo info = PkgInfo.fromJson(json.decode(response.body));
    print('Package ${info.name}, v ${info.latestVersion.pubspec.version}');
    print(info.latestVersion.pubspec.description);
  } else {
    throw Exception('Failed to load package info');
  }
}

@JsonSerializable()
class PkgInfo {
  final String name;
  @JsonKey(name: 'latest')
  final PkgVersion latestVersion;

  PkgInfo({required this.name, required this.latestVersion});

  factory PkgInfo.fromJson(Map<String, dynamic> json) =>
      _$PkgInfoFromJson(json);
}

@JsonSerializable()
class PkgVersion {
  final String version;
  final PkgPubspec pubspec;

  PkgVersion({required this.version, required this.pubspec});

  factory PkgVersion.fromJson(Map<String, dynamic> json) =>
      _$PkgVersionFromJson(json);
}

@JsonSerializable()
class PkgPubspec {
  final String version;
  final String description;

  PkgPubspec({required this.version, required this.description});

  factory PkgPubspec.fromJson(Map<String, dynamic> json) =>
      _$PkgPubspecFromJson(json);
}
