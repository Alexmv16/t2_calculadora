import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorHome extends StatefulWidget {
  static const double fontSizeMedium = 36.0;
  static const double fontSizeBig = 48.0;

  const CalculatorHome({Key? key}) : super(key: key);

  @override
  State<CalculatorHome> createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  String _equationText = '0';
  String _resultText = '0';
  double _equationFontSize = CalculatorHome.fontSizeMedium;
  double _resultFontSize = CalculatorHome.fontSizeBig;

  Widget _equationPanel() {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.all(10),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          _equationText,
          style: TextStyle(fontSize: _equationFontSize),
        ),
      ),
    );
  }

  Widget _resultPanel() {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.all(1.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        border: Border.all(
          color: Colors.blue.shade200,
          width: 2,
        ),
      ),
      padding: EdgeInsets.all(10),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          _resultText,
          style: TextStyle(
            fontSize: _resultFontSize,
            color: Colors.blue.shade700,
          ),
        ),
      ),
    );
  }

  Widget _calcButton(String text, Color color, {double fontSize = 28.0}) {
    return Container(
      margin: EdgeInsets.all(1.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(color: color),
      child: TextButton(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: fontSize),
          ),
        ),
        onPressed: () => _onCalcButtonPressed(text),
      ),
    );
  }

  Widget _buttonsPanel() {
    return Container(
      color: Colors.grey.shade300,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(child: _calcButton('C', Colors.orange)),
              Expanded(child: _calcButton('DEL', Colors.redAccent)),
              Expanded(child: _calcButton('%', Colors.lightBlue)),
              Expanded(child: _calcButton('+', Colors.lightBlue)),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(child: _calcButton('7', Colors.grey.shade400)),
              Expanded(child: _calcButton('8', Colors.grey.shade400)),
              Expanded(child: _calcButton('9', Colors.grey.shade400)),
              Expanded(child: _calcButton('x', Colors.lightBlue)),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(child: _calcButton('4', Colors.grey.shade400)),
              Expanded(child: _calcButton('5', Colors.grey.shade400)),
              Expanded(child: _calcButton('6', Colors.grey.shade400)),
              Expanded(child: _calcButton('-', Colors.lightBlue)),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(child: _calcButton('1', Colors.grey.shade400)),
              Expanded(child: _calcButton('2', Colors.grey.shade400)),
              Expanded(child: _calcButton('3', Colors.grey.shade400)),
              Expanded(child: _calcButton('+', Colors.lightBlue)),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(child: _calcButton('0', Colors.grey.shade400, fontSize: 24.0)),
              Expanded(child: _calcButton('.', Colors.grey.shade400)),
              Expanded(child: _calcButton('=', Colors.orange)),
            ],
          ),
        ],
      ),
    );
  }

  String _evaluateEquation() {
    Parser parser = Parser();
    String expression = _equationText;
    String operationResult = '';

    expression = expression.replaceAll('x', '*');
    expression = expression.replaceAll('%', '/');
    try {
      Expression exp = parser.parse(expression);
      operationResult = '${exp.evaluate(EvaluationType.REAL, ContextModel())}';
    } catch (e) {
      operationResult = 'Error in expression';
    }
    return operationResult;
  }

  void _onCalcButtonPressed(String text) {
    setState(() {
      if (text == 'C') {
        _equationText = '0';
        _resultText = '0';
        _equationFontSize = CalculatorHome.fontSizeMedium;
        _resultFontSize = CalculatorHome.fontSizeBig;
      } else if (text == 'DEL') {
        _equationText = _equationText.substring(0, _equationText.length - 1);
        if (_equationText.isEmpty) {
          _equationText = '0';
        }
        _equationFontSize = CalculatorHome.fontSizeBig;
        _resultFontSize = CalculatorHome.fontSizeMedium;
      } else if (text == '=') {
        _equationFontSize = CalculatorHome.fontSizeBig;
        _resultFontSize = CalculatorHome.fontSizeMedium;
        _resultText = _evaluateEquation();
      } else {
        if (_equationText == '0') {
          _equationText = text;
        } else {
          _equationText += text;
        }
      }
    });
  }
//TODO ACTIVIDAD 2  He utilizado "SingleChildScrollView" para permitir el desplazamiento vertical de los widgets cuando se sobrepasa el espacio disponible
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculadora')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _equationPanel(),
              _resultPanel(),
              _buttonsPanel(),
            ],
          ),
        ),
      ),
    );
  }
}
