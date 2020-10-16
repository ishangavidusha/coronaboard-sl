import 'dart:convert';

import 'package:coronaboard/models/apiData.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService with ChangeNotifier {
  // ignore: non_constant_identifier_names
  final String URL = 'https://www.hpb.health.gov.lk/api/get-current-statistical';
  ApiData apiData;
  bool loading = false;

  Future<ApiData> getData() async {
    try {
      http.Response response = await http.get(URL);
      if (response.statusCode == 200) {
        apiData = ApiData.fromJson(jsonDecode(response.body));
        if (apiData.success) {
          notifyListeners();
          return apiData;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}