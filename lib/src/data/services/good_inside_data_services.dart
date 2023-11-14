// Dart imports:
import 'dart:convert';
import 'dart:io' show SocketException;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goodinside/src/data/models/good_inside_card_data.dart';

import '../../global.dart';

abstract class BaseGoodInsideDataServices {
  Future<List<GoodInsideCardData>> getCardData();
}

class GoodInsideDataServices extends BaseGoodInsideDataServices {
  // static singleton
  static final GoodInsideDataServices _instance = GoodInsideDataServices.internal();

  factory GoodInsideDataServices() => _instance;

  GoodInsideDataServices.internal();

  @override
  Future<List<GoodInsideCardData>> getCardData() async {
    final List<GoodInsideCardData> list = [];
    Response response = await Dio().get(Globals.appConfig.api);

    if (response.statusCode == 200) {
      for (final item in response.data['cards']) {
        debugPrint('item $item ');
        list.add(GoodInsideCardData.fromJson(item));
      }
      list.sort((GoodInsideCardData a, GoodInsideCardData b) => a.id.compareTo(b.id));
    }

    return list;
  }
}
