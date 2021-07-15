import 'dart:async';

import 'package:earthquake_app/app_module.dart';
import 'package:earthquake_app/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ModularApp(module: AppModule(), child: AppWidget());
}
