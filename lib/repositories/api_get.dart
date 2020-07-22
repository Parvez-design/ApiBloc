import 'dart:convert';

import '../api_model.dart';
import 'package:http/http.dart' as http;

class ApiCalling {
  Future<List<ApiModel>> getApi() async {
    final List<ApiModel> allApis = [];
    final url = 'https://jsonplaceholder.typicode.com/posts';
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw Exception();
    }
    List<dynamic> body = jsonDecode(response.body);
    body.forEach((singleApi) {
      allApis.add(
          ApiModel(userId: singleApi['userId'], title: singleApi['title']));
    });
    return allApis;
  }
}
