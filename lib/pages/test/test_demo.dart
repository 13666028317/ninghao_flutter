import 'package:flutter/material.dart';

class TestDemo extends StatelessWidget {
  const TestDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TestDemo'),
      ),
      body: TestDemoHome(),
    );
  }
}

class TestDemoHome extends StatefulWidget {
  TestDemoHome({Key key}) : super(key: key);

  @override
  _TestDemoHomeState createState() => _TestDemoHomeState();
}

class _TestDemoHomeState extends State<TestDemoHome> {
  @override
  Widget build(BuildContext context) {
    return Chip(label: Text('hello'));
  }
}


class NinghaoTestDemo {
  static greet(String name) {
    return 'hello $name';
  }
}