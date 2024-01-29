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
  var answer = 0.0;
  var currentOperation = '';
  final double pi = 3.1415926535897932;

  numberPressed(String buttonText) {
    setState(() {
      userInput += buttonText;
    });
  }

  operationPressed(String operation) {
    if (userInput.isNotEmpty) {
      setState(() {
        answer = calculate(currentOperation, answer, double.parse(userInput));
        currentOperation = operation;
      });
    }
  }

  equalPressed() {
    if (userInput.isNotEmpty) {
      setState(() {
        answer = calculate(currentOperation, answer, double.parse(userInput));
        userInput = answer.toString();
        answer = 0.0;
        currentOperation = '';
      });
    }
  }

  calculate(String operation, double value1, double value2) {
    switch (operation) {
      case '+':
        return value1 + value2;
      case '=':
        return value1 - value2;
      case 'x':
        return value1 * value2;
      case '÷':
        return value1 / value2;
      default:
        return value2;
    }
  }

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'AC') {
        userInput = '';
        answer = 0.0;
      } else if (buttonText == '⌫') {
        userInput = userInput.substring(0, userInput.length - 1);
      } else if (buttonText == '()' && !userInput.contains('(')) {
        userInput += '(';
      } else if (buttonText == '()' && userInput.contains('(')) {
        userInput += ')';
      } else if (buttonText == 'π') {
        userInput += pi.toString();
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
                          style: TextStyle(
                            fontSize: userInput.length > 13 ? 35.0 : 70.0,
                            color: Colors.black,
                          )),
                      Text( answer == 0.0 ? '' : answer.toString(),
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
                          calcButton('÷', btnOperatorColor,
                              () => operationPressed('÷')),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          calcButton(
                              '7', btnNumberColor, () => numberPressed('7')),
                          calcButton(
                              '8', btnNumberColor, () => numberPressed('8')),
                          calcButton(
                              '9', btnNumberColor, () => numberPressed('9')),
                          calcButton('x', btnOperatorColor,
                              () => operationPressed('x')),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          calcButton(
                              '4', btnNumberColor, () => numberPressed('4')),
                          calcButton(
                              '5', btnNumberColor, () => numberPressed('5')),
                          calcButton(
                              '6', btnNumberColor, () => numberPressed('6')),
                          calcButton('-', btnOperatorColor,
                              () => operationPressed('-')),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          calcButton(
                              '1', btnNumberColor, () => numberPressed('1')),
                          calcButton(
                              '2', btnNumberColor, () => numberPressed('2')),
                          calcButton(
                              '3', btnNumberColor, () => numberPressed('3')),
                          calcButton('+', btnOperatorColor,
                              () => operationPressed('+')),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          calcButton(
                              '0', btnNumberColor, () => numberPressed('0')),
                          calcButton(
                              '.', btnNumberColor, () => buttonPressed('.')),
                          calcButton(
                              '⌫', btnNumberColor, () => buttonPressed('⌫')),
                          calcButton(
                              '=', btnEqualColor, () => equalPressed()),
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
