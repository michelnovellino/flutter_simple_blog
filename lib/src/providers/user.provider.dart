import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_simple_blog/src/models/user.model.dart';
import 'package:flutter_simple_blog/src/utils/load.env.dart';
import 'package:http/http.dart' as http;

 final Function _env = () async {
  await DotEnv().load('.env');
  return DotEnv().env["API_URL"];
}; 

class UserProvider {
  Future<List<UserModel>> getAll() async {
    var _url = await _env();
    var r = await http.get("$_url/users");
 
    final Map<String, dynamic> decoded = json.decode(r.body);
    final _data = decoded["data"];
    final _list = new UsersModel.fromJsonList(_data);
/*     print('decoded data ${_data.runtimeType}');
    print('decoded data2 ${_list.items}'); */
    return _list.items;
  }

  void getOne(id) async {
    var _url = await _env();
    var r = await http.get("$_url/users/$id");
    print("is dot! $_url");
    final Map<String, dynamic> decoded = json.decode(r.body);
    print('decoded data1 $decoded');
    final _data = decoded["data"];
    final _user = new UserModel.fromJson(_data);
/*     print('decoded data ${_data.runtimeType}');
    print('decoded data2 ${_user}'); */
    print('decoded data2 ${_user.email}');
  }
}
