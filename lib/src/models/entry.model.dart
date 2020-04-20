/* import 'package:flutter_simple_blog/src/models/user.model.dart';
import 'package:flutter_simple_blog/src/models/category.model.dart'; */

class EntriesModel {
  List<EntryModel> items = List();
  EntriesModel();
  EntriesModel.fromJsonList(List<dynamic> list) {
    if (list == null) return;
    for (var item in list) {
      final entry = EntryModel.fromJson(item);
      items.add(entry);
    }
  }
}

class EntryModel {
  int id;
  String title;
  String content;
  DateTime createdAt;
  DateTime updatedAt;
  int userId;
  int categoryId;
/*   UserModel user;
  CategoryModel category; */

  EntryModel({
    this.id,
    this.title,
    this.content,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.categoryId,
/*     this.user,
    this.category, */
  });
  factory EntryModel.fromJson(Map<String, dynamic> json) => EntryModel(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        userId: json["user_id"],
        categoryId: json["category_id"],
/*         user: json[""],
        category: json[""], */
      );
}
