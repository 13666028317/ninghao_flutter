import 'package:flutter/material.dart';

class ExpansionPanelItem {
  final String headerText;
  final Widget body;
  bool isExpanded;

  ExpansionPanelItem({
    this.headerText,
    this.body,
    this.isExpanded,
  });
}

class ExpansionPanelDemo extends StatefulWidget {
  ExpansionPanelDemo({Key key}) : super(key: key);

  @override
  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
  // bool _isExpansion = false;
  List<ExpansionPanelItem> _expansionPanelItems;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _expansionPanelItems = [
      ExpansionPanelItem(
          headerText: 'Panel A',
          body: Container(
            padding: EdgeInsets.all(16.0),
            width: double.infinity,
            child: Text('Content for Panel A.'),
          ),
          isExpanded: false),
      ExpansionPanelItem(
          headerText: 'Panel B',
          body: Container(
            padding: EdgeInsets.all(16.0),
            width: double.infinity,
            child: Text('Content for Panel B.'),
          ),
          isExpanded: false),
      ExpansionPanelItem(
          headerText: 'Panel C',
          body: Container(
            padding: EdgeInsets.all(16.0),
            width: double.infinity,
            child: Text('Content for Panel C.'),
          ),
          isExpanded: false),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('ExpansionPanelDemo'),
          elevation: 0.0,
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ExpansionPanelList(
                expansionCallback: (int panelIndex, bool isExpansion) {
                  setState(() {
                    _expansionPanelItems[panelIndex].isExpanded = !isExpansion;
                  });
                },
                children: _expansionPanelItems.map((ExpansionPanelItem e) {
                  return ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpansion) {
                        return Container(
                          padding: EdgeInsets.all(16.0),
                          child: Text('Panel A',
                              style: Theme.of(context).textTheme.title),
                        );
                      },
                      body: e.body,
                      isExpanded: e.isExpanded);
                }).toList(),
                // children: [
                //   ExpansionPanel(
                //     headerBuilder: (BuildContext context, bool isExpansion) {
                //       return Container(
                //         padding: EdgeInsets.all(16.0),
                //         child: Text('Panel A',
                //             style: Theme.of(context).textTheme.title),
                //       );
                //     },
                //     body: Container(
                //       padding: EdgeInsets.all(16.0),
                //       width: double.infinity,
                //       child: Text('Content for Panel A.'),
                //     ),
                //     isExpanded: _isExpansion,
                //   ),
                // ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
