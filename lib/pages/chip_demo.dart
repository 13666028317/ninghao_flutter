import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  ChipDemo({Key key}) : super(key: key);

  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {

  List<String> _tags = [
    'Apple', 'Banana', 'Lemon'
  ];

  String _action = 'Nothings';
  List<String> _selected = [];

  String _choic = 'Lemon';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('ChipDemo'),
          elevation: 0.0,
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: <Widget>[
                  Chip(label: Text('Life')),
                  SizedBox(width: 10.0),
                  Chip(label: Text('wuyu'), backgroundColor: Colors.orange),
                  SizedBox(width: 10.0),
                  Chip(
                    label: Text('朱龙海'),
                    avatar: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Text('龙'),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Chip(
                    label: Text('zhulonghai'),
                    avatar: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://resources.ninghao.net/images/wanghao.jpg'),
                      // child: Text('龙'),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Chip(
                    label: Text('zhulonghai'),
                    avatar: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://resources.ninghao.net/images/wanghao.jpg'),
                      // child: Text('龙'),
                    ),
                  ),
                  Chip(
                    label: Text('City'),
                    onDeleted: () {},
                    deleteIcon: Icon(Icons.delete),
                    deleteIconColor: Colors.redAccent,
                    deleteButtonTooltipMessage: 'Remove this tag',
                  ),
                  Divider(
                    color: Colors.grey,
                    indent: 32.0,
                  ),
                  Wrap(
                    spacing: 8.0,
                    children: _tags.map((String tag) {
                      return Chip(label: Text(tag), onDeleted: (){
                        setState(() {
                          _tags.remove(tag);
                        });
                      },);
                    }).toList(),
                  ),
                  Divider(
                    color: Colors.grey,
                    indent: 32.0,
                  ),
                  Container(
                    width: double.infinity,
                    child: Text('AcionChip: $_action'),
                  ),
                  Wrap(
                    spacing: 8.0,
                    children: _tags.map((String tag) {
                      return ActionChip(label: Text(tag), onPressed: (){
                        setState(() {
                          _action = tag;
                        });
                      },);
                    }).toList(),
                  ),
                  Divider(
                    color: Colors.grey,
                    indent: 32.0,
                  ),
                  Container(
                    width: double.infinity,
                    child: Text('FilterChip: ${_selected.toString()}'),
                  ),
                  Wrap(
                    spacing: 8.0,
                    children: _tags.map((String tag) {
                      return FilterChip(label: Text(tag), selected: _selected.contains(tag), onSelected: (value){
                        setState(() {
                          if (_selected.contains(tag)) {
                            _selected.remove(tag);
                          }else{
                            _selected.add(tag);
                          }
                        });
                      },);
                    }).toList(),
                  ),
                  Divider(
                    color: Colors.grey,
                    indent: 32.0,
                  ),
                  Container(
                    width: double.infinity,
                    child: Text('ChoicChip: $_choic'),
                  ),
                  Wrap(
                    spacing: 8.0,
                    children: _tags.map((String tag) {
                      return ChoiceChip(label: Text(tag), selectedColor: Colors.black, selected: _choic==tag, onSelected: (value){
                        setState(() {
                          _choic = tag;
                        });
                      },);
                    }).toList(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
