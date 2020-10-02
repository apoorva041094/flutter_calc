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

  int _displayNumber = 0;

  void calcValue(number){
    if(number == 'C'){
      _displayNumber = 0;
    }
    else if(number == '+'){

    }else {
      _displayNumber =
          int.parse((_displayNumber).toString() + number);
    }
  }

  Widget _buildButton(String number) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: FlatButton(
          color: Colors.grey[200],
          child: Text(number,  style : TextStyle(
            fontSize: 20.0,
          ),),
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
          Row(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.grey[200],
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
          Expanded(
            child: Container(
              color: Colors.red[100],
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
