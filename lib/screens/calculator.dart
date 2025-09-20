import 'package:flutter/material.dart';
import 'package:whatsapp/constants.dart';

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
                              MyButton(title: '9',onpress: (){},),
                              MyButton(title: '*',color: Colors.orangeAccent,onpress: (){},),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Row(
                            children: [
                              MyButton(title: '4',onpress: (){},),
                              MyButton(title: '5',onpress: (){},),
                              MyButton(title: '6',onpress: (){},),
                              MyButton(title: '-',color: Colors.orangeAccent,onpress: (){},),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Row(
                            children: [
                              MyButton(title: '1',onpress: (){},),
                              MyButton(title: '2',onpress: (){},),
                              MyButton(title: '3',onpress: (){},),
                              MyButton(title: '+',color: Colors.orangeAccent,onpress: (){},),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Row(
                            children: [
                              MyButton(title: '0',onpress: (){},),
                              MyButton(title: '.',onpress: (){},),
                              MyButton(title: 'DEL',onpress: (){},),
                              MyButton(title: '=',color: Colors.orangeAccent,onpress: (){},),
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
}


