import 'dart:convert';
import 'package:flutter_simple_blog/src/models/entry.model.dart';
import 'package:flutter_simple_blog/src/utils/load.env.dart';
import 'package:http/http.dart' as http;

class EntryProvider {
  Future<List<EntryModel>> getAll() async {
    var _url = await Env().getProp("API_URL");
    var r = await http.get("$_url/entries");

    final Map<String, dynamic> decoded = json.decode(r.body);
    final _data = decoded["data"];
    final _list = new EntriesModel.fromJsonList(_data);
    return _list.items;
  }

  void getOne(id) async {
    var _url = await Env().getProp("API_URL");
    var r = await http.get("$_url/entries/$id");
    final Map<String, dynamic> decoded = json.decode(r.body);
    final _data = decoded["data"];
    final _user = new EntryModel.fromJson(_data);
    print('decoded data2 ${_user.title}');
  }
}
