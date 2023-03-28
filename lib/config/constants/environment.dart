import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {
  static String movieDB = dotenv.env['MOVIEDB_KEY'] ?? 'NO API KEY';
}
