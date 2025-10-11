import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import '../components/my_buttons.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body:
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      child: Column(
                        children: [
                          Text(userInput.toString(),style: TextStyle(
                            fontSize: 30,
                            color: Colors.white
                          ),),
                          Text(answer.toString(),style: TextStyle(
                            fontSize: 30,color: Colors.white
                          ),),
                          Expanded(

                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    MyButton(title: 'Ac',onpress: (){
                                      userInput = '';
                                      answer = '';
                                      setState(() {

                                      });
                                    },),
                                    MyButton(title: '+/_',onpress: (){
                                      userInput += '+/-';
                                      setState(() {

                                      });
                                    },),
                                    MyButton(title: '%',onpress: (){
                                      userInput += '%';
                                      setState(() {

                                      });
                                    },),
                                    MyButton(title: '/',color: Colors.orangeAccent,onpress: (){
                                      userInput += '/';
                                      equalPress();
                                      setState(() {

                                      });
                                    },),
                                  ],
                                ),
                          SizedBox(height: 15,),
                          Row(
                            children: [
                              MyButton(title: '7',onpress: (){
                                userInput = userInput + '7';
                                setState(() {

                                });
                              },),
                              MyButton(title: '8',onpress: (){
                                userInput = userInput + '8';
                                setState(() {

                                });
                              },),
                              MyButton(title: '9',onpress: (){
                                userInput = userInput + '9';
                                setState(() {

                                });
                              },),
                              MyButton(title: '*',color: Colors.orangeAccent,onpress: (){
                                userInput += '*';
                                equalPress();
                                setState(() {

                                });


                              },),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Row(
                            children: [
                              MyButton(title: '4',onpress: (){
                                userInput = userInput + '4';
                                setState(() {

                                });
                              },),
                              MyButton(title: '5',onpress: (){
                                userInput = userInput + '5';
                                setState(() {

                                });
                              },),
                              MyButton(title: '6',onpress: (){
                                userInput = userInput +'6';
                                setState(() {

                                });
                              },),
                              MyButton(title: '-',color: Colors.orangeAccent,onpress: (){
                                userInput = userInput + '-';
                              },),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Row(
                            children: [
                              MyButton(title: '1',onpress: (){
                                userInput = userInput + '1';
                                setState(() {

                                });
                              },),
                              MyButton(title: '2',onpress: (){
                                userInput = userInput + '2';
                                setState(() {

                                });
                              },),
                              MyButton(title: '3',onpress: (){
                                userInput = userInput + '3';
                                setState(() {

                                });
                              },),
                              MyButton(title: '+',color: Colors.orangeAccent,onpress: (){
                                userInput = userInput + '+';
                                setState(() {

                                });
                              },),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Row(
                            children: [
                              MyButton(title: '0',onpress: (){
                                userInput = userInput + '0';
                                setState(() {

                                });
                              },),
                              MyButton(title: '.',onpress: (){},),
                              MyButton(title: 'DEL',onpress: (){},),
                              MyButton(title: '=',color: Colors.orangeAccent,onpress: (){
                                equalPress();
                                setState(() {

                                });
                              },),
                            ],
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
                  ),

                  SizedBox(height: 20,),
                 ],
              ),
            )
      ),
    );
  }
  void equalPress(){
    Parser parser = Parser();
    //parser take string like 12+8 and convert to expression tree
    Expression expression = parser.parse(userInput);
    //expression object is like tree = - * / which will use first dmas rule
    ContextModel contextModel = ContextModel();
    //evaluate expression mean 5+2 =7 etc
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    // this will calculate numeric result
    // contextModel gives value in expressions
    answer = eval.toString();
    //result will give to us in double
  }
}


