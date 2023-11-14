// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppConfig _$AppConfigFromJson(Map<String, dynamic> json) => AppConfig(
      type: $enumDecode(_$ConfigTypeEnumMap, json['type']),
      version: json['version'] as String,
      api: json['api'] as String,
    );

const _$ConfigTypeEnumMap = {
  ConfigType.dev: 'dev',
  ConfigType.prod: 'prod',
};
