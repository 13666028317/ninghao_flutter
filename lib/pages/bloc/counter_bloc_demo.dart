import 'dart:async';
import 'package:flutter/material.dart';

class CounterHome extends StatelessWidget {
  const CounterHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CountBloc _countBloc = CounterProvider.of(context).bloc;
    return Center(
      child: StreamBuilder(
        stream: _countBloc.count,
        initialData: 0,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            child: ActionChip(
                label: Text('${snapshot.data}'),
                onPressed: () {
                  // _countBloc.log();
                  _countBloc.counter.add(1);
                }),
          );
        },
      ),
    );
  }
}

class CounterFloatButton extends StatelessWidget {
  const CounterFloatButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CountBloc _countBloc = CounterProvider.of(context).bloc;

    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        //  _countBloc.log();
        _countBloc.counter.add(1);
      },
    );
  }
}

class CounterProvider extends InheritedWidget {
  CounterProvider({Key key, this.child, this.bloc})
      : super(key: key, child: child);

  final Widget child;
  final CountBloc bloc;

  static CounterProvider of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(CounterProvider)
        as CounterProvider);
  }

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return true;
  }
}

class CountBloc {
  int _count = 0;

  final _counterActionController = StreamController<int>.broadcast();
  StreamSink<int> get counter => _counterActionController.sink;

  final _counterController = StreamController<int>.broadcast();
  Stream<int> get count => _counterController.stream;

  CountBloc() {
    _counterActionController.stream.listen(onData);
  }

  void onData(data) {
    print('data == $data');
    _count = _count + data;
    _counterController.add(_count);
  }

  void disponse() {
    _counterActionController.close();
    _counterController.close();
  }

  void log() {
    print('Block');
  }
}
