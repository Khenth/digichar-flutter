import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environments {
  static initEnvironmet() async {
    await dotenv.load(fileName: ".env");
  }

  static String apiUrl = dotenv.env['API_URL'] ?? 'No existe API_URL';
}
