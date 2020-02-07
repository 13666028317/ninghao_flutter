import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ninghao_flutter/model/Post.dart';

class HttpDemo extends StatelessWidget {
  const HttpDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('HttpDemo'),
        ),
        body: HttpDemoHome(),
      ),
    );
  }
}

class HttpDemoHome extends StatefulWidget {
  HttpDemoHome({Key key}) : super(key: key);

  @override
  _HttpDemoHomeState createState() => _HttpDemoHomeState();
}

class _HttpDemoHomeState extends State<HttpDemoHome> {
  String path = 'https://resources.ninghao.net/demo/posts.json';

  @override
  void initState() {
    super.initState();

    // fecthPost().then((value) => print(value));
  }

  Future<List<Post>> fecthPost() async {
    final reponse = await http.get(path);
    print('reponse== ${reponse.statusCode}');
    if (reponse.statusCode == 200) {
      final body = json.decode(reponse.body);
      List<Post> posts =
          body['posts'].map<Post>((item) => Post.fromJson(item)).toList();
      return posts;
    } else {
      throw Exception('Faild to fetch post');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fecthPost(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Text('lading...'),
          );
        } else {
          return ListView(
            children: snapshot.data.map<Widget>((Post post) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(post.imageUrl),
                ),
                title: Text(post.title),
                subtitle: Text(post.author),
              );
            }).toList(),
          );
        }
      },
    );
  }
}

class Post {
  final int id;
  final String title;
  final String author;
  final String desc;
  final String imageUrl;

  Post(this.id, this.title, this.author, this.desc, this.imageUrl);

  Post.fromJson(Map json)
      : id = json['id'],
        title = json['title'],
        desc = json['description'],
        author = json['author'],
        imageUrl = json['imageUrl'];

  Map toJson() => {
        'id': id,
        'title': title,
        'author': author,
        'description': desc,
        'imageUrl': imageUrl,
      };
}
