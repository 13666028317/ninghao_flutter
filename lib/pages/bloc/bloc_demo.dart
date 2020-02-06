import 'package:flutter/material.dart';
import './counter_bloc_demo.dart';

class BlocDemo extends StatelessWidget {
  const BlocDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      bloc: CountBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('BlocDemo'),
        ),
        body: CounterHome(),
        floatingActionButton: CounterFloatButton(),
      ),
    );
  }
}
