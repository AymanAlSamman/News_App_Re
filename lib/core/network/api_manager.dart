import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_re/core/config/constants.dart';
import 'package:news_app_re/models/source_model.dart';

class ApiManager {
  static Future<List<SourceModel>> fetchDataSources(String categoryId) async {
    var url = Uri.https(Constants.baseUrl, "/v2/top-headlines/sources", {
      "apiKey": Constants.apiKey,
      "category": categoryId,
    });

    final response = await http.get(url);
    List<SourceModel> sourcesDataList = [];
    if (response.statusCode == 200) {
      print(response.body);
      var data = jsonDecode(response.body);
      var sourcesList = data["sources"] as List;
      for (var element in sourcesList) {
        SourceModel.fromJson(element);
        sourcesDataList.add(SourceModel.fromJson(element));
      }
      return sourcesDataList;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
