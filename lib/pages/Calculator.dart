import 'package:calcunvertor/widgets/calcButton.dart';
import 'package:flutter/material.dart';
import 'package:calcunvertor/utils/colors.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  // storing user-input and answer
  var userInput = '';
  var answer = '';
  final double pi = 3.1415926535897932;

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'AC') {
        userInput = '';
        answer = '';
      } else if (buttonText == '⌫') {
        userInput = userInput.substring(0, userInput.length - 1);
      } else if (buttonText == '()' && !userInput.contains('(')) {
        userInput += '(';
      } else if (buttonText == '()' && userInput.contains('(')) {
        userInput += ')';
      } else if (buttonText == 'π') {
        userInput += pi.toString();
      } else if (buttonText == '+') {
        userInput += "+";
      } else if ( userInput.contains('+')) {
        userInput += buttonText;
      }
      else{
        userInput += buttonText;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(userInput,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            fontSize: 70.0,
                            color: Colors.black,
                          )),
                      Text(answer.toString(),
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            fontSize: 70.0,
                            color: Color(0xff595959),
                          )),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: const Color(0xff262525),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          calcButton('AC', btnOperatorColor,
                              () => buttonPressed('AC')),
                          calcButton('()', btnOperatorColor,
                              () => buttonPressed('()')),
                          calcButton(
                              'π', btnOperatorColor, () => buttonPressed('π')),
                          calcButton(
                              '÷', btnOperatorColor, () => buttonPressed('÷')),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          calcButton(
                              '7', btnNumberColor, () => buttonPressed('7')),
                          calcButton(
                              '8', btnNumberColor, () => buttonPressed('8')),
                          calcButton(
                              '9', btnNumberColor, () => buttonPressed('9')),
                          calcButton(
                              'x', btnOperatorColor, () => buttonPressed('x')),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          calcButton(
                              '4', btnNumberColor, () => buttonPressed('4')),
                          calcButton(
                              '5', btnNumberColor, () => buttonPressed('5')),
                          calcButton(
                              '6', btnNumberColor, () => buttonPressed('6')),
                          calcButton(
                              '-', btnOperatorColor, () => buttonPressed('-')),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          calcButton(
                              '1', btnNumberColor, () => buttonPressed('1')),
                          calcButton(
                              '2', btnNumberColor, () => buttonPressed('2')),
                          calcButton(
                              '3', btnNumberColor, () => buttonPressed('3')),
                          calcButton(
                              '+', btnOperatorColor, () => buttonPressed('+')),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          calcButton(
                              '0', btnNumberColor, () => buttonPressed('0')),
                          calcButton(
                              '.', btnNumberColor, () => buttonPressed('.')),
                          calcButton(
                              '⌫', btnNumberColor, () => buttonPressed('⌫')),
                          calcButton(
                              '=', btnEqualColor, () => buttonPressed('=')),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
