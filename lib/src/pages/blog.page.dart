import 'package:flutter/material.dart';
import 'package:flutter_simple_blog/src/models/entry.model.dart';
import 'package:flutter_simple_blog/src/providers/entry.provider.dart';

class BlogPage extends StatefulWidget {
  BlogPage({Key key, this.title}) : super(key: key);

  // This widget is the Test page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  final _entries = EntryProvider();

  @override
  Widget build(BuildContext context) {
    /*  _entries.getOne(4); */
    return Scaffold(
      appBar: AppBar(
        title: Text("Blog Page"),
      ),
      body: Center(
        child: _renderlist(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _entries.getAll(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _renderlist() {
    return FutureBuilder(
      future: _entries.getAll(),
      builder:
          (BuildContext context, AsyncSnapshot<List<EntryModel>> snapshot) {
        print(snapshot.hasData);
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        } else {
          final items = snapshot.data;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int i) {
              return _renderItem(context, items[i]);
            },
          );
        }
      },
    );
  }

  Widget _renderItem(BuildContext context, EntryModel item) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      child: Card(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(item.title),
              subtitle: Text(
                item.content,
                softWrap: false,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () {
                /*      Navigator.of(context).pushNamed('item', arguments: item); */
              },
            )
          ],
        ),
      ),
      onDismissed: (dir) {
/*         itemProvider.deleteOne(item.id); */
      },
    );
  }
}
