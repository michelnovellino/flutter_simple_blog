import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static Future loadEnv() async {
    return await DotEnv().load('.env');
  }

  Future getProp(prop) async {
    await DotEnv().load('.env');
    return DotEnv().env[prop];
  }
}
