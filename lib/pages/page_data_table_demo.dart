import 'package:flutter/material.dart';
import '../model/Post.dart';

class PostDataSource extends DataTableSource {
  final List<Post> _posts = posts;
  int _selectedCount = 0;
  @override
  // TODO: implement rowCount
  int get rowCount => _posts.length;

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => _selectedCount;

  @override
  DataRow getRow(int index) {
    // TODO: implement getRow
    final post = _posts[index];
    return DataRow(cells: [
      DataCell(Text(post.title)),
      DataCell(Text(post.author)),
      DataCell(Image.network(post.imageUrl)),
    ]);
  }

  void _sort(getField(post), bool ascending) {
    _posts.sort((a, b) {
      if (!ascending) {
        final c = a;
        a = b;
        b = c;
      }
      final aV = getField(a);
      final bV = getField(b);
      return Comparable.compare(aV, bV);
    });
    notifyListeners();
  }
}

class PageDataTableDemo extends StatefulWidget {
  PageDataTableDemo({Key key}) : super(key: key);

  @override
  _PageDataTableDemoState createState() => _PageDataTableDemoState();
}

class _PageDataTableDemoState extends State<PageDataTableDemo> {
  int _sortColumnIndex = 0;
  bool _sortAscending = true;
  final PostDataSource _postsDataSource = PostDataSource();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('PageDataTableDemo'),
          elevation: 0.0,
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              PaginatedDataTable(
                header: Text('Posts'),
                source: _postsDataSource,
                rowsPerPage: 8,
                sortColumnIndex: _sortColumnIndex,
                sortAscending: _sortAscending,
                columns: [
                  DataColumn(
                      label: Text('Title'),
                      onSort: (int index, bool ascending) {
                        _postsDataSource._sort((post) => post.title.length, ascending);
                        setState(() {
                          _sortColumnIndex = index;
                          _sortAscending = ascending;
                        });
                      }),
                  DataColumn(label: Text('Author')),
                  DataColumn(label: Text('image')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
