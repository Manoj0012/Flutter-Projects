
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:calculator/pages/buttons.dart';
import 'package:calculator/Services/utils.dart';

class Landscape extends StatefulWidget {

  @override
  State<Landscape> createState() => _PortraitState();
}

class _PortraitState extends State<Landscape> {
  var question='';
  var answer='';
  static const primary_color=0xff1DAD96;
  final List<String> buttons=[
    'C','DEL','%','/','*','+','-', '1','2','3',
    '4', '5','6','7','8','9','0','00','.','=',
  ];

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding:EdgeInsets.all(20),
                      alignment:Alignment.center,
                      child: Text(question,style: TextStyle(fontSize: 27),),),
                    Container(
                      alignment:Alignment.centerRight,
                      padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                      child: Text(answer,style: TextStyle(fontSize: 30,color:Colors.black,),),)
                  ],
                ),
              )),
          Expanded(
              flex:2,
              child: Container(
                  padding:EdgeInsets.all(20),
                  child: GridView.builder(
                    itemCount:buttons.length,
                    gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 10),
                    itemBuilder:(context, index) {
                      if(index==0){
                        return Custom_button(
                          ontapped: (){
                            setState(() {
                              question='';
                              answer='';
                            });
                          },
                          text: buttons[index],
                          text_color:isoperator(buttons[index])?Color(primary_color):Colors.red,
                          button_color:Colors.white,
                        );
                      }
                      else if(index==1){
                        return Custom_button(
                          ontapped: (){
                            setState(() {
                              question=question.substring(0,question.length-1);
                            });
                          },
                          text: buttons[index],
                          text_color:isoperator(buttons[index])?Color(primary_color):Colors.black,
                          button_color:Colors.white,
                        );
                      }
                      else if(index==buttons.length-1){
                        return Custom_button(
                          ontapped: (){
                            setState(() {
                              answer=iscal(question);
                            });
                          },
                          text: buttons[index],
                          text_color:isoperator(buttons[index])?Color(primary_color):Colors.black,
                          button_color:Colors.white,
                        );
                      }
                      else{
                        return Custom_button(
                          ontapped:(){
                            setState(() {
                              question=question+buttons[index];
                            });
                          },
                          text: buttons[index],
                          text_color:isoperator(buttons[index])?Color(primary_color):Colors.black54,
                          button_color:Colors.white,

                        );};
                    },))),
        ],
      );
    }
  }

