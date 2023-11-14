// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart' show BuildContext, GlobalKey, MediaQuery, MediaQueryData, ScaffoldState, VoidCallback;
import 'package:flutter/services.dart';

// Project imports:
import 'data/models/app_config.dart';

class Globals {
  static late final MediaQueryData mediaQueryData;

  static late final AppConfig appConfig;

  static final GlobalKey<ScaffoldState> globalScaffoldKey = GlobalKey<ScaffoldState>();

  static void init(BuildContext context, {required VoidCallback serviceDownCallback}) {
    mediaQueryData = MediaQuery.of(context);

    return;
  }

  static Future<void> initConfigurations(String configType) async {
    // // app config
    String? appData = await rootBundle.loadString('assets/configs/$configType.json');
    appConfig = AppConfig.fromJson(json.decode(appData));

    return;
  }

  static Future<Map<String, dynamic>> getData(String path) async {
    String data = await rootBundle.loadString(path);
    return json.decode(data);
  }
}
