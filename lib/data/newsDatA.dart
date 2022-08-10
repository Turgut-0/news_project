import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/modelsNews.dart';



class news_servies {
  news_servies._privateConstructor();

  static final news_servies _instance = news_servies._privateConstructor();

  factory news_servies() {
    return _instance;
  }

  static Future<List<Article>?> getNewsInfo() async {
    var response = await http.get(
      Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=tr&category=business&apiKey=0684c92663814e6e9132cc4ee781d569'),
    );

    try {
      if (response.statusCode==200){
        final usermodels = jsonDecode(response.body);
        NewS news=NewS.fromJson(usermodels);
        return news.articles;
      }
      return null;
    } on Exception catch (e) {
      print(e);
    }
  }
}
