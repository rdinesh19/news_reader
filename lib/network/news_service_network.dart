import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import '../constant/endpoints.dart';
import '../model/artical_model.dart';
import 'api_client.dart';

class NewsServiceNetwork {

  // Method to fetch articles for a specific country
  Future<List<Article>> fetchArticles(String country) async {
    final url = '$baseUrl?country=$country&apiKey=$apiKey';
Response response;
    DateTime today = DateTime.now();
    DateTime fromDay = today.subtract(Duration(days: 5));
    final dio = userClient();
    var payload = {
      "q":"apple",
      "from":fromDay,
    "to":today,
    "sortBy":"popularity",
            "apiKey":apiKey};
    try {
      var data = dio.then((value) async {
        response = await value.get(baseUrl, queryParameters:  payload);
        log('response=${response.realUri}');
        log(response.statusCode.toString());
        log(response.data.toString());
        if (response.statusCode == 200) {
          // final Map<String, dynamic> jsonData = json.decode(response.data);
          final List<dynamic> articlesJson = response.data['articles'];

          // Convert JSON to a list of Article objects
          return articlesJson.map((json) => Article.fromJson(json)).toList();
        } else {
          // Handle API errors
          throw Exception('Failed to load news articles');
        }
      });
      return data;
    } catch (e) {
      throw e;
    }

  }
}
