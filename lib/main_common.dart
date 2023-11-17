import 'dart:io';

import 'package:flutter/foundation.dart' show Brightness, kDebugMode, kReleaseMode;
import 'package:flutter/material.dart'
    show
        BuildContext,
        Color,
        ColorScheme,
        Colors,
        FlutterError,
        FlutterErrorDetails,
        FontWeight,
        MaterialApp,
        TextStyle,
        TextTheme,
        ThemeData,
        debugPrint,
        runApp;
import 'package:flutter/services.dart' show DeviceOrientation, SystemChrome;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goodinside/src/data/blocs/good_data_cubit/good_inside_data_cubit.dart';
import 'package:goodinside/src/data/blocs/navigation/navigation_cubit.dart';

import 'src/core_app.dart';
import 'src/data/blocs/check_internet/check_internet_cubit.dart';
import 'src/global.dart';
import 'src/globals/themes.dart';

Future<void> mainCommon() async {
  debugPrint('configType ${Globals.appConfig.type.name}');

  SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp]).then((_) {
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.dumpErrorToConsole(details);
      if (kReleaseMode) exit(1);
    };
    runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: mainTheme,
        home: MultiBlocProvider(providers: [
          BlocProvider<CheckInternetCubit>(create: (BuildContext context) => CheckInternetCubit()),
          BlocProvider<GoodInsideDataCubit>(create: (BuildContext context) => GoodInsideDataCubit()),
          BlocProvider<NavigationCubit>(create: (BuildContext context) => NavigationCubit())
        ], child: const CoreApp())));
  }, onError: (dynamic error, dynamic stackTrace) {
    // FirebaseCrashlytics.instance.recordError(error, stackTrace);
    debugPrint(' onError main error: $error stackTrace: $stackTrace');
  });
}
