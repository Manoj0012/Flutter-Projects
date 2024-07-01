import 'package:calculator/theme/theme.dart';
import 'package:flutter/material.dart';

class ThemeHelper extends ChangeNotifier{
  ThemeData _theme=lightMode;

  ThemeData get themedata=>_theme;

  set themedata(ThemeData themedata){
    _theme=themedata;
  }
  void changethememode(){
    if(_theme==lightMode){
      themedata=darkMode;
    }
    else{
      themedata=lightMode;
    }
    notifyListeners();
  }
}

