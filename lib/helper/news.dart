import 'dart:convert';

import 'package:NewsApp/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = List<ArticleModel>();

  Future<void> getNews() async{
    String url =
        "http://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=***";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if(jsonData["status"] == "ok"){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] != null && element["description"] != null){
          ArticleModel articleModel = ArticleModel(
            url: element["url"],
            urlToImage: element["urlToImage"],
            title: element["title"],
            author: element["author"],
            content: element["content"],
            description: element["description"],
            publishedAt: element["publishedAt"],
          );
          news.add(articleModel);
        }
      });
    }
  }
}


class CategoryNewsClass {
  List<ArticleModel> news = List<ArticleModel>();

  Future<void> getCategoryNews(String category) async{
    String url =
        "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=dc1d3522632c4185b0577b827de1504c";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if(jsonData["status"] == "ok"){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] != null && element["description"] != null){
          ArticleModel articleModel = ArticleModel(
            url: element["url"],
            urlToImage: element["urlToImage"],
            title: element["title"],
            author: element["author"],
            content: element["content"],
            description: element["description"],
            publishedAt: element["publishedAt"],
          );
          news.add(articleModel);
        }
      });
    }
  }
}
