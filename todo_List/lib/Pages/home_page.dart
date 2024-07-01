import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/Provider/task_provider.dart';
import 'package:todo_list/Theme/theme.dart';
import 'package:todo_list/utils/dialog_box.dart';
import 'package:todo_list/utils/tile_card.dart';
import 'package:intl/intl.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override

  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }
  var Day;
  var subday;
  var today;

   getTodayDayString() {
    DateTime now = DateTime.now();
    today=now.day.toString();
    Day= DateFormat('EEEE').format(now);
     subday = Day.substring(0,3);// Returns the full name of the day
  }

  createNewTask(){
  showDialog(context: context, builder:(context) {
    return DialogBox(
      text_controller:_controller,
      onSave:(){
         Provider.of<TaskProvider>(context,listen:false).addTask(_controller.text);
         _controller.clear();
         Navigator.of(context).pop();
    },
      onCancel:()=>Navigator.of(context).pop(),);
  },);
  }
  final _controller=TextEditingController();
  Widget build(BuildContext context) {
    final background=Theme.of(context).colorScheme.background;
    final primary=Theme.of(context).colorScheme.primary;
    final secondary=Theme.of(context).colorScheme.secondary;
    print(getTodayDayString());
    return  Scaffold(
      appBar:AppBar(
        title:Text("TODO List",style: TextStyle(
          color:primary
        ),),
        centerTitle: true,
        leading:IconButton(icon:Icon(Icons.menu_rounded,color:primary,),onPressed: () {},padding:EdgeInsets.fromLTRB(15, 0,0,0),),
        actions: [IconButton(icon:Icon(Icons.alarm_add,color: primary),onPressed: () {},padding:EdgeInsets.fromLTRB(0, 0,15,0))],
        elevation:0,
        backgroundColor:background,
      ),
      body:Consumer<TaskProvider>(
        builder: (context, provider, child) {
        var len=provider.Items.length;
        return Column(
          children: [
            Expanded(
              flex:1,
                child:Container(
                  color:background,
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width:100,
                        height:70,
                        padding:EdgeInsets.fromLTRB(20,0,0,0),
                        // color: primary,
                        child:Column(
                          children: [
                          Text("Today",style: TextStyle(fontSize:27,color: primary)),
                    Text("$len Tasks",style: TextStyle(fontSize:16,color:secondary)),
                          ],
                        ),
                      ),
                      Padding(
                        padding:EdgeInsets.fromLTRB(0,0,20,0),
                        child: Container(
                          width:100,
                          height:45,
                          decoration:BoxDecoration(
                           color:primary,
                            borderRadius:BorderRadius.circular(10)
                          ),
                          child: TextButton(onPressed:() {
                            createNewTask();
                          }, child:Text("Add Task",style: TextStyle(color:background,fontSize:17),)),
                        ),
                      )

                    ],
                  ),
                )),
            Expanded(
              flex: 5,
                child:Container(
                  decoration:BoxDecoration(
                      color:primary,
                    borderRadius:const BorderRadius.only(topLeft:Radius.circular(35)),
                  ),
                  child:Column(
                    children: [
                      Container(
                        child:Row(

                          children: [
                            Padding(padding: EdgeInsets.fromLTRB(30, 20, 0, 20),
                            child: Container(
                              width:60,
                              height:65,
                              decoration:BoxDecoration(
                                color:background,
                                borderRadius:BorderRadius.circular(5),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(today,style: TextStyle(color:primary,fontSize:20),),
                                  Text(subday,style: TextStyle(color:primary,fontSize:16))
                                ],
                              ),
                            ),)
                          ],
                        ),

                      ),
                      Expanded(flex:5,
                          child:ListView.builder(itemCount:provider.Items.length,itemBuilder:(context, index) {
                            return TileCard(txt:provider.Items[index][0],
                              color:primary,
                              onChanged:(value)=>provider.onchange_check(value,index),
                              taskcompleted:provider.Items[index][1],
                              isdelete:()=>provider.deleteTask(index),
                            );
                          },)
                      )
                    ],
                  ),
                ))
          ],
        );
        },
      ),
    );
  }



}
