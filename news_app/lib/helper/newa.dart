import 'dart:convert';

import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];
  Future<void> getNews() async {
    final response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=4d169fba14844908a58e2268eef91e24"));
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      data['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel article = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            content: element["content"],
            url: element["url"],
          );
          news.add(article);
        }
      });
    }
  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];
  Future<void> getCategory(String category) async {
    final response = await http.get(Uri.parse(
        'http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=4d169fba14844908a58e2268eef91e24'));
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      data['articles'].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel article = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            content: element["content"],
            url: element["url"],
          );
          news.add(article);
        }
      });
    }
  }
}
