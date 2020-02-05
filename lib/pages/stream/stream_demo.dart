import 'package:flutter/material.dart';
import 'dart:async';

class StreamDemo extends StatefulWidget {
  StreamDemo({Key key}) : super(key: key);

  @override
  _StreamDemoState createState() => _StreamDemoState();
}

class _StreamDemoState extends State<StreamDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
        appBar: AppBar(
          title: Text('StreamDemo'),
        ), 
        body: StreamDemoHome(),
       ),
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  StreamDemoHome({Key key}) : super(key: key);

  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {

  StreamSubscription _streamDemoSubscription;
  StreamController<String> _steamDemo;
  StreamSink _streamSink;

  String _data = '...';

  @override
  void dispose() {
    _steamDemo.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    debugPrint('creart a stream');
    _steamDemo = StreamController.broadcast();
    _streamSink = _steamDemo.sink;
    // Stream<String> _streamDemo = Stream.fromFuture(fetchData());

    debugPrint('start listen');
    _streamDemoSubscription = _steamDemo.stream.listen(onData, onError:onError, onDone: onDone);
    debugPrint('initializa end');
  }

  void onData(String data) {
    setState(() {
      _data = data;
    });
    debugPrint('$data');
  }

  void onError(error) {
    debugPrint('error == $error');
  }

  void onDone() {
    debugPrint('onDone');
  }

  void _addDataStream() async {
    debugPrint('_addStream');
    String data = await fetchData();
    // _steamDemo.add(data);
    _streamSink.add(data);
  }

  void _pauseStream() {
    debugPrint('_pauseStream');
    _streamDemoSubscription.pause();
  }

  void _resumeStream() {
    debugPrint('_resumeStream');
    _streamDemoSubscription.resume();
  }

  void _cancleStream() {
    debugPrint('_cancleStream');
    _streamDemoSubscription.cancel();
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 3));
    return 'hello~';
    // throw 'Some thing happened';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Container(
         child: Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
              //  Text('$_data'),
              StreamBuilder(
                stream: _steamDemo.stream,
                initialData: '...',
                builder: (context, snapshot) {
                  return Text('${snapshot.data}');
                },
              ),
               Wrap(
                //  mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   FlatButton(onPressed: _addDataStream, child: Text('addStream')),
                   FlatButton(onPressed: _pauseStream, child: Text('pauseStream')),
                   FlatButton(onPressed: _resumeStream, child: Text('resumeStream')),
                   FlatButton(onPressed: _cancleStream, child: Text('csncleStream')),
                 ],
               ),
             ],
           ),
         ),
       ),
    );
  }
}