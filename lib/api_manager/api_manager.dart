import 'dart:convert';
import 'package:news_application/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:news_application/model/news_response.dart';
import 'package:news_application/model/source_response.dart';

class ApiManager {

  ApiManager._();
  static ApiManager? _instance;

   static ApiManager getInstance(){
    _instance ??= ApiManager._();
    return _instance!;
  }


   Future<SourceResponse> getSources(String categoryId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.sourceApi,
        {'apiKey': ApiConstants.apiKey,
         'category':categoryId
           });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return SourceResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

   Future<NewsResponse> getNews(String sourceId) async {

    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newsApi,
        {'apiKey': ApiConstants.apiKey, 'sources': sourceId});
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
