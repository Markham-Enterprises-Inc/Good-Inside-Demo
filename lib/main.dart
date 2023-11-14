import 'package:flutter/material.dart';

import 'src/global.dart';
import 'main_common.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Globals.initConfigurations('dev').then((_) async => mainCommon());
}
