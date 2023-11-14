import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_config.g.dart';

enum ConfigType { dev, prod }

@JsonSerializable(createToJson: false)
@immutable
class AppConfig {
  final ConfigType type;
  final String version;

  final String api;

  const AppConfig({required this.type, required this.version, required this.api});

  factory AppConfig.fromJson(Map<String, dynamic> json) => _$AppConfigFromJson(json);
}
