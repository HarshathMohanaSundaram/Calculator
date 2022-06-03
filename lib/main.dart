import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calculator/button.dart';
import 'package:simple_calculator/data.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
        create: (context)=>CalculatorModel(),
        child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColorDark: Colors.black,
        primaryColorLight: Colors.white,
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CalculatorModel>(
        builder: (context,cal,child){
          return Scaffold(
            backgroundColor: cal.themeLight?Theme.of(context).primaryColorLight:Theme.of(context).primaryColorDark,
            appBar: AppBar(
              backgroundColor: cal.themeLight?Theme.of(context).primaryColorLight:Theme.of(context).primaryColorDark,
              elevation: 0.0,
              title: Text(
                  "Calculator",
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: cal.themeLight?Theme.of(context).primaryColorDark:Theme.of(context).primaryColorLight,
                  ),
              ),
              actions: [
                IconButton(
                    onPressed: (){cal.themeMode();},
                    icon: Icon(cal.themeLight?
                    Icons.dark_mode:Icons.light_mode,
                      size: 28,
                      color:!cal.themeLight? Theme.of(context).primaryColorLight:Theme.of(context).primaryColorDark,
                    )
                )
              ],
            ),
            body: Column(
              children: <Widget>[
                (cal.userInput!='' || cal.answer!='')?Expanded(
                  child:Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          padding:const EdgeInsets.all(20),
                          alignment: Alignment.centerRight,
                          child: Text(
                            cal.userInput,
                            style: TextStyle(
                              color: cal.themeLight?Theme.of(context).primaryColorDark:Theme.of(context).primaryColorLight,
                              fontSize: 18
                            ),
                          ),
                        ),
                        Container(
                          padding:const EdgeInsets.all(15),
                          alignment: Alignment.centerRight,
                          child: Text(
                            cal.answer,
                            style: TextStyle(
                                color: cal.themeLight?Theme.of(context).primaryColorDark:Theme.of(context).primaryColorLight,
                                fontSize: 30,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
                : Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.25,
                  child:FittedBox(
                    fit: BoxFit.cover,
                    child: Image.asset("assets/images/empty.jpg"),
                  ),
                ),
                Expanded(
                  flex: 3,
                    child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                        itemCount: cal.button.length,
                        itemBuilder: (BuildContext context,int index){
                          if(index==0){
                            return Button(
                                color: cal.themeLight?Theme.of(context).primaryColorLight:Theme.of(context).primaryColorDark,
                                textColor: Colors.blue,
                                buttonText: cal.button[index],
                                buttonTapped: (){ cal.buttonTapped(index);}
                            );
                          }
                          else if(index==1){
                            return Button(
                                color: cal.themeLight?Theme.of(context).primaryColorLight:Theme.of(context).primaryColorDark,
                                textColor: Colors.blue,
                                buttonText: cal.button[index],
                                buttonTapped: null
                            );
                          }
                          else if(index==2){
                            return Button(
                                color: cal.themeLight?Theme.of(context).primaryColorLight:Theme.of(context).primaryColorDark,
                                textColor: Colors.blue,
                                buttonText: cal.button[index],
                                buttonTapped:(){ cal.buttonTapped(index);}
                            );
                          }
                          else if(index==3){
                            return Button(
                                color: cal.themeLight?Theme.of(context).primaryColorLight:Theme.of(context).primaryColorDark,
                                textColor: Colors.blue,
                                buttonText: cal.button[index],
                                buttonTapped:(){ cal.buttonTapped(index);}
                            );
                          }
                          else if(index==18){
                            return Button(
                                color: cal.themeLight?Theme.of(context).primaryColorLight:Theme.of(context).primaryColorDark,
                                textColor: Colors.blue,
                                buttonText: cal.button[index],
                                buttonTapped:(){ cal.buttonTapped(index);}
                            );
                          }
                          else{
                            return Button(
                                color: cal.themeLight?Theme.of(context).primaryColorLight:Theme.of(context).primaryColorDark,
                                textColor: cal.isOperator(cal.button[index])?Colors.blue:cal.themeLight?Theme.of(context).primaryColorDark:Theme.of(context).primaryColorLight,
                                buttonText: cal.button[index],
                                buttonTapped:(){ cal.buttonTapped(index);}
                            );
                          }
                        }
                    )
                )
              ],
            ),
          );
        });
  }
}

