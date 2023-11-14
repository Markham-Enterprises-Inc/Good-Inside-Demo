// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'good_inside_card_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoodInsideCardData _$GoodInsideCardDataFromJson(Map<String, dynamic> json) => GoodInsideCardData(
      id: json['card_id'] as int,
      type: $enumDecode(_$CardTypeEnumMap, json['type']),
      text: json['text'] as String?,
      label: json['label'] as String?,
      title: json['title'] as String?,
      videoId: json['video_id'] as String?,
      audioUrl: json['audio_url'] as String?,
    );

const _$CardTypeEnumMap = {
  CardType.audio: 'audio',
  CardType.video: 'video',
  CardType.text: 'text',
  CardType.optText: 'opt_text',
};
