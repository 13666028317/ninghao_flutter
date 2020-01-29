import 'package:flutter/material.dart';
import './pages/bottom_navigation_bar_demo.dart';
import './pages/listview-demo.dart';
import './pages/basic_demo.dart';
import './pages/layout_demo.dart';
// import './pages/view_demo.dart';
import './pages/sliver_demo.dart';
import './pages/navgitor_demo.dart';
import './pages/form_demo.dart';
import 'pages/form_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
        splashColor: Colors.white70,
        accentColor: Color.fromRGBO(3, 54, 255, 1.0),
      ),
      // home: MyHomePage(title: 'NINGHAO'),
      // home: NavigatorDemo(),
      initialRoute: '/',
      routes: {
        '/' : (context) => MyHomePage(title: 'NINGHAO'),
        '/about':(context) => Page(title: 'About'),
        '/form' : (context) => FormDemo(),
      },
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
  

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search',
              onPressed: () {
                debugPrint('search button is pressed');
              },
            ),
          ],
          elevation: 0.0,
          bottom: TabBar(
            unselectedLabelColor: Colors.black38,
            indicatorColor: Colors.black54,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 1.0,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.local_florist)),
              Tab(icon: Icon(Icons.change_history)),
              Tab(icon: Icon(Icons.directions_bike)),
              Tab(icon: Icon(Icons.view_quilt)),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListViewDemo(),
            BasicDemo(),
            LayoutDemo(),
            // ViewDemo(),
            SliverDemo(),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              // DrawerHeader(
              //   child: Text('header'.toUpperCase()),
              //   decoration: BoxDecoration(
              //     color: Colors.grey[100],
              //   ),
              // ),
              UserAccountsDrawerHeader(
                accountName: Text("WangHao", style: TextStyle(fontWeight: FontWeight.w800, color: Colors.black)),
                accountEmail: Text("wanghao@email.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage('https://resources.ninghao.org/images/wanghao.jpg'),
                ),
                decoration: BoxDecoration(
                  color: Colors.yellow[400],
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(Colors.yellow[400].withOpacity(0.6), BlendMode.hardLight),
                    image: NetworkImage('https://resources.ninghao.org/images/childhood-in-a-picture.jpg'),
                  )
                ),
              ),
              ListTile(
                title: Text("Message", textAlign: TextAlign.right),
                trailing:
                    Icon(Icons.message, color: Colors.black12, size: 22.0),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                title: Text("Favorite", textAlign: TextAlign.right),
                trailing:
                    Icon(Icons.favorite, color: Colors.black12, size: 22.0),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                title: Text("Setting", textAlign: TextAlign.right),
                trailing:
                    Icon(Icons.settings, color: Colors.black12, size: 22.0),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBarDemo(),
      ),
    );
  }
}
