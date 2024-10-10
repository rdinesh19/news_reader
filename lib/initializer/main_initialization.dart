
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//
// var supportLocales =  [
//   const Locale('en', 'US'),
//   const Locale('ta', 'IN'),
//   const Locale('mr', 'IN'),
//   const Locale('kn', 'IN'),
//   const Locale('te', 'IN'),
//   const Locale('ml', 'IN'),
// ];


mainInitialization()async{

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.green,
    statusBarColor: Colors.transparent,
  ));
 }