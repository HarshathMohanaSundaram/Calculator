import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorModel extends ChangeNotifier{
  bool themeLight = true;
  String userInput='';
  String answer = '';
  final List<String> button=['C','+/-','%','DEL','7','8','9','/','4','5','6','x','1','2','3','-','0','.','=','+'];
  void themeMode(){
    themeLight = !themeLight;
    notifyListeners();
  }
  buttonTapped(int index){
    if(index==0){
      userInput='';
      answer='';
    }
    else if(index == 2){
      userInput += button[index];
    }
    else if(index==3){
      userInput = userInput.substring(0,userInput.length-1);
    }
    else if(index==18){
      equalPressed();
    }
    else{
      userInput+=button[index];
    }
    notifyListeners();
  }
  void equalPressed(){
    String _uInput = userInput;
    _uInput=_uInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression ep = p.parse(_uInput);
    ContextModel cm = ContextModel();
    double eval = ep.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }

  bool isOperator(String o){
    if(o=='+'||o=='-'||o=='/'||o=='x'||o=='='){
      return true;
    }
    return false;
  }
}