import 'package:http/http.dart' as http;
import 'package:newzapp/Models/article_model.dart';
import 'dart:convert';

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?category=general&sortBy=publishedAt&pageSize=100&page=1&language=en&apiKey=18d693fa738a4aaf91070ff86f9b1b39";

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element['author'] != null &&
            element['urlToImage'] != null &&
            element['description'] != null &&
            element['content'] != null) {
          //model
          ArticleModel articleModel = ArticleModel(
              title: element['title'],
              description: element['description'],
              author: element['author'],
              content: element["content"],
              urlToImage: element['urlToImage'],
              articleUrl: element['url']);

          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNews {
  List<ArticleModel> categoryNews = [];

  Future<void> getCategoryNews(String category) async {
    String url =
        "http://newsapi.org/v2/top-headlines?category=$category&pageSize=100&page=1&language=en&apiKey=18d693fa738a4aaf91070ff86f9b1b39";

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element['author'] != null &&
            element['urlToImage'] != null &&
            element['description'] != null &&
            element['content'] != null) {
          //model
          ArticleModel articleModel = ArticleModel(
              title: element['title'],
              description: element['description'],
              author: element['author'],
              content: element["content"],
              urlToImage: element['urlToImage'],
              articleUrl: element['url']);
          categoryNews.add(articleModel);
        }
      });
    }
  }
}

class SearchedNews {
  List<ArticleModel> searchedNews = [];

  Future<void> getSearchedNews(String search) async {
    String url =
        "http://newsapi.org/v2/everything?q=$search&pageSize=100&page=1&language=en&apiKey=18d693fa738a4aaf91070ff86f9b1b39";

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element['author'] != null &&
            element['urlToImage'] != null &&
            element['description'] != null &&
            element['content'] != null) {
          //model
          ArticleModel articleModel = ArticleModel(
              title: element['title'],
              description: element['description'],
              author: element['author'],
              content: element["content"],
              urlToImage: element['urlToImage'],
              articleUrl: element['url']);
          searchedNews.add(articleModel);
        }
      });
    }
  }
}
