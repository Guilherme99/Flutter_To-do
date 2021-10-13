import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_module.dart';
import 'app_page.dart';

void main(){
  return runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
