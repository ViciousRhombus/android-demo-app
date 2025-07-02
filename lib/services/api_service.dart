import 'dart:convert';
import 'package:atlanta_assignment/model/user.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String url = "https://jsonplaceholder.typicode.com/users";

  Future<List<User>> fetchUsers() async {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/users"),
      headers: {'Accept': 'application/json', 'User-Agent': 'FlutterApp/1.0'},
    );
    if (kDebugMode) {
      print('status code ${response.statusCode}');
    }
    if (response.statusCode == 200) {
      final List jsonList = jsonDecode(response.body);
      final users = jsonList.map((json) => User.fromJson(json)).toList();
      if (kDebugMode) {
        for (var user in users) {
          print(user.name);
        }
      }
      return jsonList.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('failed to load users');
    }
  }
}
