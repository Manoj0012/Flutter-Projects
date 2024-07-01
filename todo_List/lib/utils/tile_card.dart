import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/Provider/task_provider.dart';

class TileCard extends StatelessWidget {
  var txt;
  var color;
  final cmplt="Completed";
 bool taskcompleted;
  Function (bool?)?onChanged;
  VoidCallback isdelete;
   TileCard({super.key,required this.txt,required this.color,required this.onChanged,required this.taskcompleted,required this.isdelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20,10,20,5),
      child: Container(
        decoration: BoxDecoration(color:taskcompleted?Colors.white:Theme.of(context).colorScheme.background,
            borderRadius:BorderRadius.circular(7)),
        child:Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(value:taskcompleted, onChanged:onChanged,activeColor:Theme.of(context).colorScheme.background,side: BorderSide(color: Colors.white),),
              SizedBox(width:10),
              Container(
                width:190,
                  child: Text(txt,style: TextStyle(decoration: taskcompleted ? TextDecoration.lineThrough : TextDecoration.none,
                    color: taskcompleted ? Colors.grey[600] : Colors.white,fontSize:17),)),
              IconButton(onPressed:isdelete, icon:Icon(Icons.delete,color:Colors.red[400],))
            ],
          ),
        ) ,
      ),
    ) ;
  }
}
