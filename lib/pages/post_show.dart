import 'package:flutter/material.dart';
import '../model/post.dart';

class PostShow extends StatefulWidget {

  final Post post;

  PostShow({Key key, this.post}) : super(key: key);

  @override
  _PostShowState createState() => _PostShowState();
}

class _PostShowState extends State<PostShow> {

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
         appBar: AppBar(
           title: Text('${this.widget.post.title}'),
         ),
         body: Column(
           children: <Widget>[
             Image.network(
               this.widget.post.imageUrl
             ),
             Container(
               padding: EdgeInsets.all(32.0),
               width: double.infinity,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   Text('${this.widget.post.title}', style: Theme.of(context).textTheme.title),
                   Text('${this.widget.post.author}', style: Theme.of(context).textTheme.subtitle),
                   SizedBox(height: 32.0),
                   Text('${this.widget.post.description}', style: Theme.of(context).textTheme.body1),
                 ],
               ),
             )
           ],
         ),
       ),
    );
  }
}