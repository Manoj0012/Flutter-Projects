import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/Provider/task_provider.dart';
import 'package:todo_list/Theme/theme.dart';
import 'Pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  await Hive.initFlutter();
  var box=await Hive.openBox("mybox");
  runApp (
      ChangeNotifierProvider(create:(context) => TaskProvider(),
  child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home:HomePage()
    );
  }
}
