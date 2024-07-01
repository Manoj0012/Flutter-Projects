import 'package:flutter/material.dart';



class Custom_button extends StatelessWidget {
  final  text;
  final text_color;
  final button_color;
  final ontapped;
  Custom_button({this.text,this.text_color,this.button_color,this.ontapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: ontapped,
      child: Padding(
        padding: const EdgeInsets.all(9),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),

          child:Container(
            decoration: BoxDecoration(
              color:button_color,
              boxShadow: [
               BoxShadow(
                 color: Colors.black.withOpacity(0.25),
                 spreadRadius: -5,
                 blurRadius: 10,
                 offset: Offset(10, 0),
               )

              ]
            ),
            alignment: Alignment.center,
            child:Text(text,style: TextStyle(color: text_color,fontSize: 27)),
          ),
        ),
      ),
    );
  }
}
