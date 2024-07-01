import 'package:flutter/material.dart';

  ThemeData lightMode=ThemeData(
    brightness:Brightness.light,
    colorScheme:ColorScheme.light(
      background: Colors.white,
      primary: Color(0xff1DAD96),
      secondary: Colors.black54
    )
  );

  ThemeData darkMode=ThemeData(
    brightness:Brightness.dark,
      colorScheme:ColorScheme.dark(
          background: Colors.black,
          primary: Color(0xff1DAD96),
          secondary: Colors.grey,
      )
  );
