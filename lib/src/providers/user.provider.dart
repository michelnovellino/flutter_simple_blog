import 'dart:convert';
import 'package:flutter_simple_blog/src/models/user.model.dart';
import 'package:http/http.dart' as http;
/* <List<UserModel>> 

0{ean[1]}_001_c.jpg
0{ean[1]}_002_c.jpg
0{ean[1]}_003_c.jpg
0{ean[1]}_004_c.jpg
*/

class UserProvider {
  Future<List<UserModel>> getAll() async {
    var r = await http.get("https://jsonplaceholder.typicode.com/users/");
    final decoded = json.decode(r.body);
    final _list = new UsersModel.fromJsonList(decoded);
    print(_list);
    
    return _list.items;
  }
/*     Future<List<ProductModel>> getAll() async {
    final url = '$baseUrl/products.json';
    final result = await http.get(url);
    final Map<String, dynamic> decoded = json.decode(result.body);
    print('decoded data $decoded');
    final List<ProductModel> products = new List();
    if (decoded == null) return [];

    decoded.forEach((id, el) {
      final temp = ProductModel.fromJson(el);
      temp.id = id;

      products.add(temp);
    });

    return products;
  } */
}
