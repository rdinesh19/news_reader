import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'initializer/main_initialization.dart';
import 'initializer/provider_initializer.dart';
import 'myApp.dart';
import 'navigation/navigation.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await mainInitialization();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
    statusBarBrightness:Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: Color(0xffF0F0F3)
  ));
  runApp(ModularApp(
    module: Navigation(),
    child: const ProviderInitialization(
      child: ProviderScope(
        child: MyApp(

        ),
      )
    ),
  ));
}
