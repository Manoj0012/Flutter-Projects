import 'package:calculator/Provider/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:calculator/Services/landscape.dart';
import 'package:calculator/Services/portrait.dart';
import 'package:calculator/theme/theme.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const primary_color = 0xff1DAD96;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(title: Container(
          width: 125,
          height: 35,
          alignment: Alignment.center,

          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),
              color: Color(primary_color)),

          child: Text(
            "Calculator", style: TextStyle(fontSize: 20, color: Colors.white),),
        ), leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: IconButton(icon: Icon(Icons.dark_mode, color: Theme.of(context).colorScheme.secondary,),onPressed: (){
                Provider.of<ThemeHelper>(context,listen:false).changethememode();
              },),
            ),
          ],
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
        body: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.portrait) {
              return Portrait();
            }
            else {
              return Landscape() ;
            }
          },
        )
    );
  }
}


