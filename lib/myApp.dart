import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_reader/theme/provider/theme_provider.dart';
import 'package:news_reader/theme/theme.dart';

class MyApp extends StatefulWidget {


  const MyApp({
    super.key,

  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String link = "";

  @override
  void initState() {
     super.initState();
  }
  getSizeType(var width){

    return (width<=350)?1:(width>=1000)?2:3;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, WidgetRef ref, __) {
      final data = ref.watch(themeProvider);
      var width = MediaQuery.of(context).size.width;
      return ScreenUtilInit(
        designSize: const Size(393, 852),
        //minTextAdapt: true,
        splitScreenMode: false,

        builder: (BuildContext context, child) =>
            MaterialApp.router(

          debugShowCheckedModeBanner: false,
          theme: data.isDark!
              ? (getSizeType(width)==1)?ThemeCollection().themeDarkSmall:(getSizeType(width)==2)?ThemeCollection().themeDarkLarge:ThemeCollection().themeDark
              :(getSizeType(width)==1)?ThemeCollection().themeLightSmall:(getSizeType(width)==2)?ThemeCollection().themeLightLarge: ThemeCollection().themeLight,
            routeInformationParser: Modular.routeInformationParser,
          routerDelegate: Modular.routerDelegate,

        ),
      );
    });
  }
}