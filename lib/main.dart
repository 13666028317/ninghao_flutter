import 'package:flutter/material.dart';
import './model/post.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: MyHomePage(title: 'NINGHAO'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Widget _listItemBuilder(BuildContext context, int index) {
    Post post = posts[index];
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Image.network(post.imageUrl),
          SizedBox(height: 16.0),
          Text(post.title, style: Theme.of(context).textTheme.title),
          Text(post.author, style: Theme.of(context).textTheme.subhead),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: _listItemBuilder,
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


