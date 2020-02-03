import 'package:flutter/material.dart';

class SnaclBarDemo extends StatefulWidget {
  SnaclBarDemo({Key key}) : super(key: key);

  @override
  _SnaclBarDemoState createState() => _SnaclBarDemoState();
}

class _SnaclBarDemoState extends State<SnaclBarDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('SnaclBarDemo'),
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
                  SnackBarButton(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SnackBarButton extends StatelessWidget {
  const SnackBarButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: () {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('Processing...'),
              action: SnackBarAction(label: 'OK', onPressed: () {}),
            ),
          );
        },
        child: Text('Open SnackBar'));
  }
}
