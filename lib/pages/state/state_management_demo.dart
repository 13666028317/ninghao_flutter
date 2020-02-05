import 'package:flutter/material.dart';

class StateManagementDemo extends StatefulWidget {
  StateManagementDemo({Key key}) : super(key: key);

  @override
  _StateManagementDemoState createState() => _StateManagementDemoState();
}

class _StateManagementDemoState extends State<StateManagementDemo> {
  int _count = 0;

  void _increaseCountd() {
    setState(() {
      _count++;
    });
    debugPrint('$_count');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CounterProvider(
        count: _count,
        increaseCount: _increaseCountd,
        child: Scaffold(
        appBar: AppBar(
          title: Text('StateManagementDemo'),
          elevation: 0.0,
        ),
        body: CounterWraper(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            _increaseCountd();
          },
        ),
      ),
      ),
    );
  }
}

class CounterWraper extends StatelessWidget {

  const CounterWraper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Counter();
  }
}

class Counter extends StatelessWidget {

  const Counter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final count = CounterProvider.of(context).count;
    final increaseCount = CounterProvider.of(context).increaseCount;

    return Container(
      child: Center(
        child: ActionChip(
          label: Text('$count'),
          onPressed: increaseCount,
        ),
      ),
    );
  }
}

class CounterProvider extends InheritedWidget {
  final count;
  final VoidCallback increaseCount;
  final Widget child;

  CounterProvider({this.count, this.increaseCount, this.child}) : super(child: child);

  static CounterProvider of(BuildContext context) => context.inheritFromWidgetOfExactType(CounterProvider);
  
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}