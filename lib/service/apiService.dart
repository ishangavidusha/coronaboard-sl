import 'dart:convert';

import 'package:coronaboard/models/apiData.dart';
import 'package:coronaboard/models/historyData.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService with ChangeNotifier {
  // ignore: non_constant_identifier_names
  final String URL = 'https://www.hpb.health.gov.lk/api/get-current-statistical';
  // ignore: non_constant_identifier_names
  final String HISTORYURL = 'http://hpb.health.gov.lk/api/get-statistical-history-data';
  ApiData apiData;
  ApiHistoryData apiHistoryData;
  bool loading = false;

  Future<ApiHistoryData>  getHistoryData() async {
    try {
      http.Response response = await http.get(HISTORYURL);
      if (response.statusCode == 200) {
        apiHistoryData = ApiHistoryData.fromJson(jsonDecode(response.body));
        if (apiHistoryData.success) {
          notifyListeners();
          return apiHistoryData;
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

  Future<ApiData> getData({bool shouldUpdate = false}) async {
    print('fatching data..');
    if (shouldUpdate) {
      loadingState(true);
    }
    try {
      http.Response response = await http.get(URL);
      final result = await getHistoryData();
      if (response.statusCode == 200 && result != null) {
        apiData = ApiData.fromJson(jsonDecode(response.body));
        if (apiData.success) {
          notifyListeners();
          return apiData;
        } else {
          loadingState(false);
          return null;
        }
      } else {
        loadingState(false);
        return null;
      }
    } catch (e) {
      print(e);
      loadingState(false);
      return null;
    }
  }

  void loadingState(bool value) {
    if (value) {
      loading = true;
      notifyListeners();
    } else {
      loading = false;
      notifyListeners();
    }
  }
}