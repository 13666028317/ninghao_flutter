import 'package:flutter/material.dart';

class CheckBoxDemo extends StatefulWidget {
  CheckBoxDemo({Key key}) : super(key: key);

  @override
  _CheckBoxDemoState createState() => _CheckBoxDemoState();
}

class _CheckBoxDemoState extends State<CheckBoxDemo> {
  bool _checkItemA = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('BasicDemo'),
          elevation: 0.0,
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CheckboxListTile(
                value: _checkItemA,
                onChanged: (value) {
                  setState(() {
                    _checkItemA = value;
                  });
                },
                title: Text('Checkbox Item A'),
                subtitle: Text('Description'),
                secondary: Icon(Icons.bookmark),
                selected: _checkItemA,
                checkColor: Colors.white,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Checkbox(
                  //   value: _checkItemA,
                  //   onChanged: (value) {
                  //     setState(() {
                  //       _checkItemA = value;
                  //     });
                  //   },
                  //   activeColor: Colors.black,
                  // ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
