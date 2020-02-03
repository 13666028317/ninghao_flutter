import 'package:flutter/material.dart';

class SwitchDemo extends StatefulWidget {
  SwitchDemo({Key key}) : super(key: key);

  @override
  _SwitchDemoState createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  bool _switchItemA = true;

  void _switchItemAction(value) {
    setState(() {
      _switchItemA = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('SwitchDemo'),
          elevation: 0.0,
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SwitchListTile(
                  value: _switchItemA,
                  onChanged: _switchItemAction,
                  title: Text('Switch Item A'),
                  subtitle: Text('Description'),
                  secondary: Icon(_switchItemA ? Icons.visibility : Icons.visibility_off),
                  selected: _switchItemA,
                ),

              // Text(_switchItemA ? '😆' : '😿', style: TextStyle(fontSize: 32.0)),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //     Switch(value: _switchItemA, onChanged: _switchItemAction)
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
