import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
class TaskProvider extends ChangeNotifier{
  List Items=[];
  final _mybox=Hive.box("mybox");
  TaskProvider() {
    _loadTasks();
  }

  List get _items => Items;

  void _loadTasks() async {
    if(_mybox.get("Todolist")==null){
      print("yes");
      final savedTasks = [["GET STARTED",false],["Happy Day",false]];
      Items = List.from(savedTasks);
      notifyListeners();
    }
    else{
      final savedTasks = _mybox.get("Todolist",);
      Items = List.from(savedTasks);
      notifyListeners();
    }
  }

 addTask(txt)async{
     Items.add([txt,false]);
     await _mybox.put("Todolist",Items);
    notifyListeners();
  }
deleteTask(int index)async  {
   Items.removeAt(index);
   await _mybox.put("Todolist",Items);
    notifyListeners();
  }

onchange_check (bool? value,int index)async{
 Items[index][1]=!Items[index][1];
 await _mybox.put("Todolist",Items);
   notifyListeners();
}
}