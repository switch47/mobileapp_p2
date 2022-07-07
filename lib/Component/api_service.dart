import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'constants.dart';
import 'user_model.dart';

class ApiService {
  Future<List<UserModel>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl);
      var response = await http.get(url, headers: {'api-key': 'd6svb7BUMzADvhMRcsZcKtC1ROoH4zKV' });
      if (response.statusCode == 200) {
        List<UserModel> _model = userModelFromJson(response.body);
        return _model;
        // print("success");
        // var json = response.body;
        // print("success");
        // return userModelFromJson(json);
        // return List<UserModel>.from(json.decode(response.body));
      }
    } catch (e) {
      print(e.toString());
    }
  }
}