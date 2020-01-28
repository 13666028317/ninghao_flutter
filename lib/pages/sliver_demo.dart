import 'package:flutter/material.dart';
import '../model/Post.dart';

class SliverDemo extends StatefulWidget {
  SliverDemo({Key key}) : super(key: key);

  @override
  _SliverDemoState createState() => _SliverDemoState();
}

class _SliverDemoState extends State<SliverDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              // title: Text('NINGHAO'),
              // pinned: true,
              floating: true,
              expandedHeight: 178.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'ninghao flutter'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 15.0,
                    letterSpacing: 3.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                background: Image.network(
                  'https://resources.ninghao.org/images/space-skull.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverSafeArea(
              sliver: SliveGridDemo(),
            ),
          ],
        ),
      ),
    );
  }
}

class SliveGridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(8.0),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 16 / 9.5,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(6.0, 7.0),
                          color: Colors.black87,
                          blurRadius: 25.0,
                          spreadRadius: -9.0,
                        )
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image.network(
                          posts[index].imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 30.0,
                    top: 30.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(posts[index].title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 21.0)),
                        Text(posts[index].author, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300)),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
          childCount: posts.length,
        ),
      ),
    );
  }
}
