
import 'package:flutter/material.dart';
import 'package:calculator/pages/home_page.dart';
import 'package:calculator/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:calculator/Provider/helper.dart';
void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => ThemeHelper(),
    child: const MyApp(),
    )
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Home(),
      theme: Provider.of<ThemeHelper>(context).themedata
    );
  }
}


