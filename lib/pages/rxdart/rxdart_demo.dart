import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class RxDartDemo extends StatelessWidget {
  const RxDartDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('RxDartDemo'),
        ),
        body: RxDartDemoHome(),
      ),
    );
  }
}

class RxDartDemoHome extends StatefulWidget {
  RxDartDemoHome({Key key}) : super(key: key);

  @override
  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {
  PublishSubject<String> _textFieldSubject;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _textFieldSubject = PublishSubject<String>();
    _textFieldSubject
    .where((value) => value.length>9)
    .map((value) => 'value&$value')
    .debounce(Duration(milliseconds: 500))
    .listen((value) {
      print('$value');
    });

    // Observable<String> _observable = Observable(Stream.fromIterable(['hello!', 'marco']));
    // Observable<String> _observable = Observable.fromFuture(Future.value('hello~'));
    // Observable<String> _observable = Observable.fromIterable(['hello!', 'marco']);
    // Observable<String> _observable = Observable.just('hello~');
    // Observable<String> _observable = Observable.periodic(Duration(seconds: 3), (x) => x.toString());
    // _observable.listen(onData);

    // PublishSubject<String> _subject = PublishSubject<String>();
    // _subject.listen((data) {print('listen 1 : $data');});
    // _subject.add('hello~');
    // _subject.listen((data) {print('listen 2 : ${data.toUpperCase()}');});
    // _subject.add('hola~');
    // _subject.close();

    // BehaviorSubject<String> _subject = BehaviorSubject<String>();
    // _subject.add('hello~');
    // _subject.add('hola~');
    // _subject.listen((data) {
    //   print('listen 1 : $data');
    // });
    // _subject.listen((data) {
    //   print('listen 2 : ${data.toUpperCase()}');
    // });

    // ReplaySubject<String> _subject = ReplaySubject<String>(maxSize: 2);
    // _subject.add('hello~');
    // _subject.add('hola~');
    // _subject.add('hi~');
    // _subject.listen((data) {
    //   print('listen 1 : $data');
    // });
    // _subject.listen((data) {
    //   print('listen 2 : ${data.toUpperCase()}');
    // });

    // _subject.close();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _textFieldSubject.close();
    super.dispose();
  }

  void onData(String data) {
    debugPrint('$data');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Theme(
          data: Theme.of(context).copyWith(
            primaryColor: Colors.black,
          ),
          child: TextField(
            onChanged: (value) {
              _textFieldSubject.add('input: $value');
            },
            onSubmitted: (value) {
              _textFieldSubject.add('submit: $value');
            },
            decoration: InputDecoration(
              labelText: 'Title',
              filled: true,
            ),
          )),
    );
  }
}
