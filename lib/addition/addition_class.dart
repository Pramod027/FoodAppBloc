import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodappbloc/addition/addition_bloc.dart';

class AdditionScreen extends StatelessWidget {
  final TextEditingController _controllerNumberA = TextEditingController();
  final TextEditingController _controllerNumberB = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final CalculatorBloc _calculatorBloc =
        BlocProvider.of<CalculatorBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter BLoC Calculator'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextField(
                  controller: _controllerNumberA,
                  decoration: InputDecoration(
                    labelText: 'Number A',
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: _controllerNumberB,
                  decoration: InputDecoration(
                    labelText: 'Number B',
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 8.0),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        child: Text('+'),
                        onPressed: () {
                          _calculatorBloc.add(CalculatorEvent(
                              Operation.plus,
                              int.parse(_controllerNumberA.text.toString()),
                              int.parse(_controllerNumberB.text.toString())));
                        },
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: RaisedButton(
                        child: Text('-'),
                        onPressed: () {
                          _calculatorBloc.add(CalculatorEvent(
                              Operation.minus,
                              int.parse(_controllerNumberA.text.toString()),
                              int.parse(_controllerNumberB.text.toString())));
                        },
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: RaisedButton(
                        child: Text('X'),
                        onPressed: () {
                          _calculatorBloc.add(CalculatorEvent(
                              Operation.multiple,
                              int.parse(_controllerNumberA.text.toString()),
                              int.parse(_controllerNumberB.text.toString())));
                        },
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: RaisedButton(
                        child: Text('/'),
                        onPressed: () {
                          _calculatorBloc.add(CalculatorEvent(
                              Operation.divide,
                              int.parse(_controllerNumberA.text.toString()),
                              int.parse(_controllerNumberB.text.toString())));
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                BlocBuilder<CalculatorBloc, CalculatorState>(
                  builder: (context, state) {
                    if (state is CalculatorInitial) {
                      return Text('Result: -');
                    } else if (state is CalculatorSuccess) {
                      return Text('Result: ${state.result}');
                    } else if (state is CalculatorFailed) {
                      return Text('Error: ${state.error}');
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
          ),
        ));
    //     ),
    //   ),
    // );
  }

  // void calculate(Operation operation) {
  //   int numberA = int.parse(_controllerNumberA.text.toString());
  //   int numberB = int.parse(_controllerNumberB.text.toString());
  //   _calculatorBloc.add(CalculatorEvent(operation, numberA, numberB));
  // }
}
