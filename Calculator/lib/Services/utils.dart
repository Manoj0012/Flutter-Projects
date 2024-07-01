
import 'package:math_expressions/math_expressions.dart';
bool isoperator(String x){
  if(x=='%'||x=='/'||x=='*'||x=='-'||x=='+'||x=='='){
    return true;}
  else{
    return false;
  }
}
String iscal(String question){
  String finalans=question;
  Parser p = Parser();
  Expression exp = p.parse(finalans);
  ContextModel cm = ContextModel();
  double eval = exp.evaluate(EvaluationType.REAL, cm);
   var answer=eval.toString();
   return answer;
}
