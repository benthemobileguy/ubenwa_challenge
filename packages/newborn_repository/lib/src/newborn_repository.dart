import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:ubenwa_challenge/newborn/data/model/newborn.dart';
import 'package:ubenwa_challenge/newborn/data/session-manager.dart';

enum NewBornStatus {loading, loaded, error }

class NewBornRepository {
  NewBorn? newBornList;
  final String _baseUrl = "https://ubenwa-cat-api-stage.herokuapp.com/api/v1/";
  final Map<String, String>? headers = {"Authorization": "Bearer ${SessionManager().authToken}", "Content-Type": "application/json"};
  final _controller = StreamController<NewBornStatus>();

  Future<http.Response> fetchNewborns() async {
    final Map<String, String> headers = {"Authorization": "Bearer ${SessionManager().authToken}", "Content-Type": "application/json"};
    _controller.add(NewBornStatus.loading);
    final response = await http.get(Uri.parse('$_baseUrl/newborns'),
        headers: headers);
    if (response.statusCode == 200) {
      _controller.add(NewBornStatus.loaded);
    } else {
      _controller.add(NewBornStatus.error);
    }
    return response;
  }
  postNewbornInBackground({
    required String name,
    required String gestation,
    required String password,
  }) async {
    String uniqueKey = UniqueKey().toString();
    final directory = await getApplicationDocumentsDirectory();
    final Map<String, String> headers = {"Authorization": "Bearer ${SessionManager().authToken}",
      "Content-Type": "application/vnd.api+json"};
    await postNewborn(
        name: uniqueKey,
        gestation: "2021-08-26T12:04:50.821Z",
        password: "password");
  }
  postNewborn({
    required String name,
    required String gestation,
    required String password,
  }) async {
    final Map<String, String> headers = {"Authorization": "Bearer ${SessionManager().authToken}",
      "Content-Type": "application/vnd.api+json"};
    final response = await http.post(Uri.parse('$_baseUrl/newborns'),
        headers: headers,
        body: json.encode({
          "data": {
            "type": "newborns",
            "attributes": {
              "name": name,
              "gestation": gestation,
              "gender": "male"
            }
          }
        }));
    print(response.body.toString());
    if (response.statusCode == 200) {
      _controller.add(NewBornStatus.loaded);
    } else {
      _controller.add(NewBornStatus.error);
    }
  }

  void dispose() => _controller.close();
}
