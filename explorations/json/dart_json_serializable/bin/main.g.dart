// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PkgInfo _$PkgInfoFromJson(Map<String, dynamic> json) => PkgInfo(
      name: json['name'] as String,
      latestVersion:
          PkgVersion.fromJson(json['latest'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PkgInfoToJson(PkgInfo instance) => <String, dynamic>{
      'name': instance.name,
      'latest': instance.latestVersion,
    };

PkgVersion _$PkgVersionFromJson(Map<String, dynamic> json) => PkgVersion(
      version: json['version'] as String,
      pubspec: PkgPubspec.fromJson(json['pubspec'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PkgVersionToJson(PkgVersion instance) =>
    <String, dynamic>{
      'version': instance.version,
      'pubspec': instance.pubspec,
    };

PkgPubspec _$PkgPubspecFromJson(Map<String, dynamic> json) => PkgPubspec(
      version: json['version'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$PkgPubspecToJson(PkgPubspec instance) =>
    <String, dynamic>{
      'version': instance.version,
      'description': instance.description,
    };
