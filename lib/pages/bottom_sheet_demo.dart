import 'package:flutter/material.dart';
import 'dart:async';

class BottomSheetDemo extends StatefulWidget {
  BottomSheetDemo({Key key}) : super(key: key);

  @override
  _BottomSheetDemoState createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {
  final _bottomSheetScaffolKey = GlobalKey<ScaffoldState>();

  _openBottomSheet() {
    _bottomSheetScaffolKey.currentState.showBottomSheet((BuildContext context) {
      return BottomAppBar(
        child: Container(
          height: 90.0,
          width: double.infinity,
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Icon(Icons.pause_circle_outline),
              SizedBox(width: 16.0),
              Text('01:30 / 03:30'),
              Expanded(
                  child:
                      Text('fix you - Coldplay', textAlign: TextAlign.right)),
            ],
          ),
        ),
      );
    });
  }

  _openModalSheet() async {
    final value = await showModalBottomSheet(context: context, builder: (BuildContext context){
      return Container(
        height: 200.0,
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text('Option A'),
              onTap: (){
                Navigator.pop(context, 'A');
              },
            ),
            ListTile(
              title: Text('Option B'),
              onTap: (){
                Navigator.pop(context, 'B');
              },
            ),
            ListTile(
              title: Text('Option C'),
              onTap: (){
                Navigator.pop(context, 'C');
              },
            ),
          ],
        ),
      );
    });

    debugPrint('value == $value');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        key: _bottomSheetScaffolKey,
        appBar: AppBar(
          title: Text('BottomSheetDemo'),
          elevation: 0.0,
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                      onPressed: _openBottomSheet,
                      child: Text('open bottomSheet')),
                  SizedBox(width: 16.0),
                  RaisedButton(
                      onPressed: _openModalSheet,
                      child: Text('open modalSheet'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
