import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../theme_preference.dart';

final themeProvider = ChangeNotifierProvider<ThemeProvider>((ref) {
  return ThemeProvider();
});

class ThemeProvider extends ChangeNotifier{

  bool _isDark=false;
  bool? get isDark=> _isDark;


  ThemeProvider(){
    getTheme();
  }

  getTheme()async{
    _isDark= await ThemePreferences().getTheme();
    notifyListeners();
  }
  changeTheme(bool isDark) {
    _isDark=isDark;
    ThemePreferences().setTheme(isDark);
    notifyListeners();
  }

// class ThemeProvider extends ChangeNotifier{
//
//   bool _isDark=false;
//   bool get isDark=> _isDark;
//
//
//   ThemeProvider(){
//     getTheme();
//   }
//   getTheme()async{
//     _isDark= await ThemePreferences().getTheme();
//     notifyListeners();
//   }
//   changeTheme(bool isDark) {
//     _isDark=isDark;
//     ThemePreferences().setTheme(isDark);
//     notifyListeners();
//   }
 }