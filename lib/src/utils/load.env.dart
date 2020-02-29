import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static dynamic _data = "";
  static final Env _env = new Env._internal();
  Future loadEnv() async {
    await DotEnv().load('.env');
    return DotEnv().env["API_URL"];
  }
  factory Env() {
    return _env;
  }

  Env._internal();
}
