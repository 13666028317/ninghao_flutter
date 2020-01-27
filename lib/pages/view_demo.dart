import 'package:flutter/material.dart';
import '../model/post.dart';

class ViewDemo extends StatefulWidget {
  ViewDemo({Key key}) : super(key: key);

  @override
  _ViewDemoState createState() => _ViewDemoState();
}

class _ViewDemoState extends State<ViewDemo> {
  @override
  Widget build(BuildContext context) {
    return GridViewBuildDemo();
  }
}

class PageViewDemo extends StatelessWidget {
  const PageViewDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        //  pageSnapping: false,
        // reverse: true,
        // scrollDirection: Axis.vertical,
        onPageChanged: (curentPage) => debugPrint('Page == $curentPage'),
        controller: PageController(
          initialPage: 1,
          keepPage: false,
          // viewportFraction: 0.85,
        ),
        children: <Widget>[
          Container(
            color: Colors.brown[900],
            alignment: Alignment(0.0, 0.0),
            child: Text("ONE",
                style: TextStyle(fontSize: 32.0, color: Colors.white)),
          ),
          Container(
            color: Colors.grey[900],
            alignment: Alignment(0.0, 0.0),
            child: Text("TWO",
                style: TextStyle(fontSize: 32.0, color: Colors.white)),
          ),
          Container(
            color: Colors.blueGrey[900],
            alignment: Alignment(0.0, 0.0),
            child: Text("THREE",
                style: TextStyle(fontSize: 32.0, color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

class PageBuilderDemo extends StatelessWidget {
  const PageBuilderDemo({Key key}) : super(key: key);

  Widget _itemPostBuilder(BuildContext context, int index) {
    return Stack(
      children: <Widget>[
        SizedBox.expand(
          child: Image.network(
            posts[index].imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10.0,
          left: 10.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(posts[index].title,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(posts[index].author,
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 12)),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: posts.length,
      itemBuilder: _itemPostBuilder,
    );
  }
}

class GridViewDemo extends StatelessWidget {
  // const GridViewDemo({Key key}) : super(key: key);

  List<Widget> _buildTiles(int length) {
    return List.generate(length, (int index) {
      return Container(
        color: Colors.grey[300],
        alignment: Alignment(0.0, 0.0),
        child:
            Text('Item $index', style: TextStyle(fontSize: 18.0, color: Colors.grey)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 16.0,
      // scrollDirection: Axis.horizontal,
      children: _buildTiles(100),
    ));
  }
}

class GridViewBuildDemo extends StatelessWidget {

  Widget _itemGrideBuilder(BuildContext context, int index) {
    return Container(
      child: Image.network(
       posts[index].imageUrl,
       fit: BoxFit.cover, 
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8.0),
      itemCount: posts.length,
      itemBuilder: _itemGrideBuilder,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
    );
  }
}