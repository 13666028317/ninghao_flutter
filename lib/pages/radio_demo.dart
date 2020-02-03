import 'package:flutter/material.dart';

class RadioDemo extends StatefulWidget {
  RadioDemo({Key key}) : super(key: key);

  @override
  _RadioDemoState createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  int _radioValue = 0;
  void _handleRadioValueChange(value) {
    setState(() {
      _radioValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('RadioDemo'),
          elevation: 0.0,
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('RadioGroupValue：$_radioValue'),
              SizedBox(height: 32.0),
              RadioListTile(
                  value: 0,
                  groupValue: _radioValue,
                  title: Text('Options A'),
                  subtitle: Text('Description'),
                  secondary: Icon(Icons.filter_1),
                  selected: _radioValue == 0,
                  onChanged: _handleRadioValueChange),
              RadioListTile(
                  value: 1,
                  groupValue: _radioValue,
                  title: Text('Options  b '),
                  subtitle: Text('Description'),
                  secondary: Icon(Icons.filter_2),
                  selected: _radioValue == 1,
                  onChanged: _handleRadioValueChange),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Radio(
                  //     value: 0,
                  //     groupValue: _radioValue,
                  //     activeColor: Colors.black,
                  //     onChanged: _handleRadioValueChange),
                  // Radio(
                  //     value: 1,
                  //     groupValue: _radioValue,
                  //     activeColor: Colors.black,
                  //     onChanged: _handleRadioValueChange),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
