import 'dart:convert';

import 'package:coding_apk_store/models/apk.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class CodingApkServices {
  static final _token = dotenv.env['CODING_APK_TOKEN'];

  static Future<Apk> downloadApp(String appName) async {
    final response = await http.get(
      Uri.parse("https://codingapk.vercel.app/apk?token=$_token&app=$appName"),
    );

    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      return Apk.fromJson(jsonBody);
    } else {
      throw "App Not Found";
    }
  }
}
