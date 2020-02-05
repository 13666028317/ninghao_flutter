import 'package:flutter/material.dart';

class StateManagementDemo extends StatelessWidget {
  const StateManagementDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
       appBar: AppBar(
         title: Text('StateManagementDemo'),
         elevation: 0.0,
       ), 
      ),
    );
  }
}