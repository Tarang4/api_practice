import 'dart:convert';

import 'package:api_prectic/my%20derectory/modal/post_modal.dart';
import 'package:http/http.dart' as http;


class ApiHelper{
  ApiHelper._();
 static final ApiHelper db=ApiHelper._();


  getApiData() async {
    final uri = Uri.parse("https://jsonplaceholder.typicode.com/posts/1");
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
       var model = PostModal.fromJson(jsonDecode(response.body));
        return model;
      } else {
        throw Exception("No data found");
      }
    } catch (e) {
      throw Exception('Failed to load post ');
    }
  }
}