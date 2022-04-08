import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/response.dart';

class HttpServices {
  Future<ResponseModel?> getPostsData() async {
    final url =
        Uri.parse('https://www.reddit.com/r/flutterdev/top.json?count=20#');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final extractedData = json.decode(response.body);

        ResponseModel responseModel = ResponseModel.fromJson(extractedData);

        return responseModel;
      } else {
        throw Exception('hata');
      }
    } catch (e) {
      e.toString();
      return null;
    }
  }
}
