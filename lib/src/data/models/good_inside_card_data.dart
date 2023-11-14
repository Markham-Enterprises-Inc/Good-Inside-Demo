import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'good_inside_card_data.g.dart';

enum CardType {
  audio,
  video,
  text,
  @JsonValue('opt_text')
  optText;

  IconData getIcon() {
    switch (this) {
      case CardType.audio:
        return Icons.audiotrack_sharp;
      case CardType.video:
        return Icons.video_call_sharp;
      case CardType.text:
        return Icons.text_fields;
      case CardType.optText:
        return Icons.text_snippet;
    }
  }
}

@JsonSerializable(createToJson: false)
@immutable
class GoodInsideCardData {
  @JsonKey(name: 'card_id')
  final int id;
  final CardType type;

  final String? label;
  final String? title;
  final String? text;
  @JsonKey(name: 'video_id')
  final String? videoId;
  @JsonKey(name: 'audio_url')
  final String? audioUrl;

  const GoodInsideCardData({required this.id, required this.type, this.text, this.label, this.title, this.videoId, this.audioUrl});

  factory GoodInsideCardData.fromJson(Map<String, dynamic> json) => _$GoodInsideCardDataFromJson(json);
}
