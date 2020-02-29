import 'package:flutter/material.dart';
import 'package:flutter_simple_blog/src/models/user.model.dart';
import 'package:flutter_simple_blog/src/providers/user.provider.dart';

class TestPage extends StatefulWidget {
  TestPage({Key key, this.title}) : super(key: key);

  // This widget is the Test page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final _user = UserProvider();

  @override
  Widget build(BuildContext context) {
    _user.getOne(4);
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Page"),
      ),
      body: Center(
        child: _renderlist(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _user.getAll(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _renderlist() {
    return FutureBuilder(
      future: _user.getAll(),
      builder: (BuildContext context, AsyncSnapshot<List<UserModel>> snapshot) {
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

  Widget _renderItem(BuildContext context, UserModel item) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      child: Card(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(item.firstName),
              subtitle: Text(item.email),
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
