import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:todo_list/Theme/theme.dart';

class DialogBox extends StatelessWidget {
  VoidCallback onSave;
  VoidCallback onCancel;
  var text_controller;
  DialogBox({required this.onSave,required this.onCancel,required this.text_controller});
  @override
  Widget build(BuildContext context) {

    return AlertDialog(
 content: Container(
   width:200,
   height:150,
   child:Column(
     children: [
       TextField(
         controller:text_controller,
         style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText:"Enter the Task",
          hintStyle: TextStyle(color:Colors.white),

        ),
       ),
       SizedBox(height:40),
       Row(
         mainAxisAlignment:MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.end,
         children: [
           Padding(
             padding:EdgeInsets.fromLTRB(0,0,20,0),
             child: Container(
               width:85,
               height:45,
               decoration:BoxDecoration(
                   color:Colors.white,
                   borderRadius:BorderRadius.circular(10)
               ),
               child: TextButton(onPressed:onSave,
                   child:Text("Save",style: TextStyle(color:Color(0xff4044C9),fontSize:17),)),
             )
           ),
           Padding(
             padding:EdgeInsets.fromLTRB(0,0,0,0),
             child: Container(
               width:85,
               height:45,
               decoration:BoxDecoration(
                   color:Colors.white,
                   borderRadius:BorderRadius.circular(10)
               ),
               child: TextButton(onPressed:onCancel, child:Text("Cancel",style: TextStyle(color:Color(0xff4044C9),fontSize:17),)),
             )),

         ],
       )

     ],
   ),
 ),
    );
  }
}
