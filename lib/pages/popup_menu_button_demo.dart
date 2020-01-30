import 'package:flutter/material.dart';

class PopupMenuDemo extends StatefulWidget {
  PopupMenuDemo({Key key}) : super(key: key);

  @override
  _PopupMenuDemoState createState() => _PopupMenuDemoState();
}

class _PopupMenuDemoState extends State<PopupMenuDemo> {

  String _currentMenuItem = 'Home';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('PopupMenuDemo'),
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
                  Text(_currentMenuItem),
                  PopupMenuButton(
                    onSelected: (value) {
                      debugPrint(value);
                      setState(() {
                        _currentMenuItem = value;
                      });
                    },
                    itemBuilder: (BuildContext context) => [
                      PopupMenuItem(
                        value: 'Home',
                        child: Text('Home'),
                      ),
                      PopupMenuItem(
                        value: 'Discove',
                        child: Text('Discove'),
                      ),
                      PopupMenuItem(
                        value: 'Community',
                        child: Text('Community'),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}