import 'package:flutter/material.dart';

class NavigatorDemo extends StatefulWidget {
  NavigatorDemo({Key key}) : super(key: key);

  @override
  _NavigatorDemoState createState() => _NavigatorDemoState();
}

class _NavigatorDemoState extends State<NavigatorDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
         body: Center(
           child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               FlatButton(
                 child: Text("Home"),
                 onPressed: null,
               ),
               FlatButton(
                 child: Text("About"),
                 onPressed: (){
                   Navigator.of(context).push(
                     MaterialPageRoute(
                       builder: (context) => Page(title: 'About'),
                     )
                   );
                 },
               ),
             ],
           ),
         ),
       ),
    );
  }
}

class Page extends StatelessWidget {
  final String title;

  const Page({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          elevation: 0.0,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}