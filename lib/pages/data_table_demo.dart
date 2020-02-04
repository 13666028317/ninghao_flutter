import 'package:flutter/material.dart';
import '../model/Post.dart';

class DataTableDemo extends StatefulWidget {
  DataTableDemo({Key key}) : super(key: key);

  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  int _sortColumnIndex = 0;
  bool _sortAscending = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('DataTableDemo'),
          elevation: 0.0,
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              DataTable(
                sortColumnIndex: _sortColumnIndex,
                sortAscending: _sortAscending,
                columns: [
                  DataColumn(
                      label: Text('Title'),
                      onSort: (int index, bool ascending) {
                        setState(() {
                          _sortColumnIndex = index;
                          _sortAscending = ascending;
                          posts.sort((a, b){
                            if (!ascending) {
                              final c = a;
                              a = b;
                              b = c;
                            }
                            return a.title.length.compareTo(b.title.length);
                          });
                        });
                      }),
                  DataColumn(label: Text('Author')),
                  DataColumn(label: Text('image')),
                ],
                rows: posts.map<DataRow>((post) {
                  return DataRow(
                    selected: post.selected,
                    onSelectChanged: (bool value){
                      setState(() {
                        if (post.selected != value) {
                          post.selected = value;
                        }
                      });
                    },
                    cells: [
                    DataCell(Text(post.title)),
                    DataCell(Text(post.author)),
                    DataCell(Image.network(post.imageUrl)),
                  ]);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
