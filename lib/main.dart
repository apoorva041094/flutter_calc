import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  double _displayNumber = 0.0;
  double _display2 = 0.0;
  String _operator = '';
  double _firstnumber = 0.0, _secondnumber = 0.0;

  void actionPerform(){
    if(_operator == '+'){
      _displayNumber = _firstnumber + _secondnumber;
    }
    else if(_operator == '-'){
      _displayNumber = _firstnumber - _secondnumber;
    }
    else if(_operator == 'x'){
      _displayNumber = _firstnumber * _secondnumber;
    }
    else if(_operator == '/'){
      _displayNumber = _firstnumber / _secondnumber;
    }
    _display2 = 0.0;
  }

  void calcValue(number){
    if(number == 'C'){
      _displayNumber = 0.0;
      _display2 =0.0;
      _firstnumber = 0.0;
      _secondnumber = 0.0;
    }
    else if(number == '='){
      _secondnumber = _displayNumber;
      actionPerform();
    }
    else if(number == '+' || number == '-' || number == 'x' || number == '/') {
      _operator = number;
      _firstnumber = _displayNumber;
      _display2 = _displayNumber;
      _displayNumber = 0.0;
    }
    else if(number == '%') {
      if (_display2 == '0.0') {
        _displayNumber = _firstnumber / 100;
      } else {
        _secondnumber = _displayNumber;
        actionPerform();
        _displayNumber = _displayNumber / 100;
      }
    }
    else {
      _displayNumber = double.parse(_displayNumber.toString()) * 10 + double.parse(number) ;
    }
  }

  Widget _buildButton(String number) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: FlatButton(
          color: Colors.grey[200],
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(number,  style : TextStyle(
              fontSize: 20.0,
            ),),
          ),
          onPressed: (){
            calcValue(number);
            setState(() {
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text("Calculator", style: TextStyle(
            color: Colors.black
        ),),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey[200],
            child: Column(
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),

                      child:  Text(_operator, style: TextStyle(
                        fontSize: 35.0,
                      )),
                    ),

                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          _display2.toString(),
                          style: TextStyle(
                            fontSize: 40.0,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          _displayNumber.toString(),
                          style: TextStyle(
                            fontSize: 40.0,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
            ),
          ),
          Row(
            children: [
              _buildButton('AC'),
              _buildButton('C'),
              _buildButton('%'),
              _buildButton('/'),
            ],
          ),
          Row(
            children: [
              _buildButton('7'),
              _buildButton('8'),
              _buildButton('9'),
              _buildButton('x'),
            ],
          ),
          Row(
            children: [
              _buildButton('4'),
              _buildButton('5'),
              _buildButton('6'),
              _buildButton('-'),
            ],
          ),
          Row(
            children: [
              _buildButton('1'),
              _buildButton('2'),
              _buildButton('3'),
              _buildButton('+'),
            ],
          ),
          Row(
            children: [
              _buildButton('00'),
              _buildButton('0'),
              _buildButton('.'),
              _buildButton('='),
            ],
          ),
        ],
      ),
    );
  }
}
