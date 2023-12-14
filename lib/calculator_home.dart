import 'package:flutter/material.dart';

class CalculatorHome extends StatefulWidget {
  static const double fontSizeMedium = 38.0;
  static const double fontSizeBig = 48.0;

  const CalculatorHome({Key? key}) : super (key: key);

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
      child: Text(
        _equationText,
        style: TextStyle(fontSize: _equationFontSize),
      ),
    );
  }

  Widget _resultPanel(){
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.all(1.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        border: Border.all(
          color: Colors.blue.shade200,
          width: 2,
        )
      ),
      padding: EdgeInsets.all(10),
      child: Text(
        _resultText,
        style: TextStyle(
          fontSize: _resultFontSize,
          color: Colors.blue.shade700,
        ),
      ),
    );
  }

  Widget _calcButton(String text, Color color) {
    return Container(
      margin: EdgeInsets.all(1.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(color: color,),
      child: TextButton(
        child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 30.0)
    ),
    onPressed: () { },
    ),
    );
  }

  Widget _buttonsPanel() {
    return Container(
      color: Colors.grey.shade300,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
        children: <Widget>[
          _calcButton('C', Colors.orange),
          _calcButton('DEL', Colors.redAccent),
          _calcButton('%', Colors.lightBlue),
          _calcButton('+', Colors.lightBlue),
        ],
      ),
          Row(
       children: <Widget>[
          _calcButton('7', Colors.grey.shade400),
          _calcButton('8', Colors.grey.shade400),
          _calcButton('9', Colors.grey.shade400),
          _calcButton('x', Colors.lightBlue),
  ],
    ),
           Row(
        children: <Widget>[
          _calcButton('4', Colors.grey.shade400),
          _calcButton('5', Colors.grey.shade400),
          _calcButton('6', Colors.grey.shade400),
          _calcButton('-', Colors.lightBlue),
    ],
    ),
           Row(
        children: <Widget>[
          _calcButton('1', Colors.grey.shade400),
          _calcButton('2', Colors.grey.shade400),
          _calcButton('3', Colors.grey.shade400),
          _calcButton('+', Colors.lightBlue),
    ],
    ),
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculator')),
      body: Column(
        children: <Widget>[
          _equationPanel(),
          _resultPanel(),
        ],
      ),
    );
  }
}