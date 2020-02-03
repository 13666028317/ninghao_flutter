import 'package:flutter/material.dart';
import './popup_menu_button_demo.dart';
import './form_demo.dart';
import './basic_check_demo.dart';
import './radio_demo.dart';
import './switch_demo.dart';
class MaterialCompontents extends StatefulWidget {
  MaterialCompontents({Key key}) : super(key: key);

  @override
  _MaterialCompontentsState createState() => _MaterialCompontentsState();
}

class _MaterialCompontentsState extends State<MaterialCompontents> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('MaterialCompontents'),
        ),
        body: ListView(
          children: <Widget>[
            ListItem(
                title: 'flotActionButtonDemo', page: FloatActionButtonDemo()),
            ListItem(title: 'ButtonDemo', page: ButtonDemo()),
            ListItem(title: 'PopmenuDemo', page: PopupMenuDemo()),
            ListItem(title: 'formDemo', page: FormDemo()),
            ListItem(title: 'checkBox', page: CheckBoxDemo()),
            ListItem(title: 'radioDemo', page: RadioDemo()),
            ListItem(title: 'switchDemo', page: SwitchDemo()),
          ],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget page;

  const ListItem({Key key, this.title, this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(title),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => page),
          );
        },
      ),
    );
  }
}

class FloatActionButtonDemo extends StatefulWidget {
  FloatActionButtonDemo({Key key}) : super(key: key);

  @override
  _FloatActionButtonDemoState createState() => _FloatActionButtonDemoState();
}

class _FloatActionButtonDemoState extends State<FloatActionButtonDemo> {
  final Widget _floatingActionButton = FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
    backgroundColor: Colors.black,
    elevation: 0.0,
    shape: BeveledRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
  );

  final Widget _floatingActionExtentedButton = FloatingActionButton.extended(
    onPressed: () {},
    elevation: 0.0,
    icon: Icon(Icons.add),
    label: Text('Add'),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('FloatActionButtonDemo'),
          elevation: 0.0,
        ),
        floatingActionButton: _floatingActionButton,
        // floatingActionButton: _floatingActionExtentedButton,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 80.0,
            color: Colors.red,
          ),
          shape: CircularNotchedRectangle(),
        ),
      ),
    );
  }
}

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> listWidgets = <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 130.0,
            child: OutlineButton(
              child: Text('Button'),
              onPressed: () {},
              splashColor: Colors.grey,
              textColor: Theme.of(context).accentColor,
              highlightedBorderColor: Theme.of(context).accentColor,
              borderSide: BorderSide(
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: OutlineButton(
              child: Text('Button'),
              onPressed: () {},
              splashColor: Colors.grey,
              textColor: Theme.of(context).accentColor,
              highlightedBorderColor: Theme.of(context).accentColor,
              borderSide: BorderSide(
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: OutlineButton(
              child: Text('Button'),
              onPressed: () {},
              splashColor: Colors.grey,
              textColor: Theme.of(context).accentColor,
              highlightedBorderColor: Theme.of(context).accentColor,
              borderSide: BorderSide(
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
          SizedBox(width: 20.0),
          Expanded(
            flex: 2,
            child: OutlineButton(
              child: Text('Button'),
              onPressed: () {},
              splashColor: Colors.grey,
              textColor: Theme.of(context).accentColor,
              highlightedBorderColor: Theme.of(context).accentColor,
              borderSide: BorderSide(
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
        ],
      ),
    ];
    final Widget flatButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          child: Text('Button'),
          onPressed: () {},
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
        SizedBox(width: 20.0),
        FlatButton.icon(
          icon: Icon(Icons.add),
          label: Text('Button'),
          onPressed: () {},
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
      ],
    );
    final Widget outLinetButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        OutlineButton(
          child: Text('Button'),
          onPressed: () {},
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
          highlightedBorderColor: Theme.of(context).accentColor,
          borderSide: BorderSide(
            color: Theme.of(context).accentColor,
          ),
        ),
        SizedBox(width: 20.0),
        OutlineButton.icon(
          icon: Icon(Icons.add),
          label: Text('Button'),
          onPressed: () {},
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
          highlightedBorderColor: Theme.of(context).accentColor,
          borderSide: BorderSide(
            color: Theme.of(context).accentColor,
          ),
        ),
      ],
    );
    final Widget raisedButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
              buttonColor: Theme.of(context).accentColor,
              buttonTheme: ButtonThemeData(
                textTheme: ButtonTextTheme.primary,
                // shape: BeveledRectangleBorder(
                //   borderRadius: BorderRadius.circular(6.0),
                // ),
                shape: StadiumBorder(),
              )),
          child: RaisedButton(
            child: Text('Button'),
            onPressed: () {},
            splashColor: Colors.grey,
            elevation: 0.0,
            color: Theme.of(context).accentColor,
          ),
        ),
        SizedBox(width: 20.0),
        RaisedButton(
          child: Text('Button'),
          onPressed: () {},
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
          elevation: 0.0,
        ),
        SizedBox(width: 20.0),
        RaisedButton.icon(
          icon: Icon(Icons.add),
          label: Text('Button'),
          onPressed: () {},
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
          elevation: 10.0,
        ),
      ],
    );
    final Widget buttonBarDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
            buttonTheme: ButtonThemeData(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
            ),
          ),
          child: ButtonBar(
            children: <Widget>[
              OutlineButton(
                child: Text('Button'),
                onPressed: () {},
                splashColor: Colors.grey,
                textColor: Theme.of(context).accentColor,
                highlightedBorderColor: Theme.of(context).accentColor,
                borderSide: BorderSide(
                  color: Theme.of(context).accentColor,
                ),
              ),
              OutlineButton(
                child: Text('Button'),
                onPressed: () {},
                splashColor: Colors.grey,
                textColor: Theme.of(context).accentColor,
                highlightedBorderColor: Theme.of(context).accentColor,
                borderSide: BorderSide(
                  color: Theme.of(context).accentColor,
                ),
              ),
            ],
          ),
        )
      ],
    );

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('ButtonDemo'),
          elevation: 0.0,
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              flatButtonDemo,
              raisedButtonDemo,
              outLinetButtonDemo,
              buttonBarDemo,
            ],
            // children: listWidgets,
          ),
        ),
      ),
    );
  }
}

class _WidgetDemo extends StatelessWidget {
  const _WidgetDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('_WidgetDemo'),
          elevation: 0.0,
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[],
              )
            ],
          ),
        ),
      ),
    );
  }
}
