import 'package:flutter/material.dart';

class BottomNavigationBarDemo extends StatefulWidget {
  @override
  _BottomNavigationBarDemoState createState() =>
      _BottomNavigationBarDemoState();
}

class _BottomNavigationBarDemoState extends State<BottomNavigationBarDemo> {
  int _currentIndex = 0;

  void _onHandler(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      fixedColor: Colors.black,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.explicit), title: Text("Explicit")),
        BottomNavigationBarItem(
            icon: Icon(Icons.history), title: Text("History")),
        BottomNavigationBarItem(icon: Icon(Icons.list), title: Text("List")),
        BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("My")),
      ],
    );
  }
}
