import 'package:news_app/models/article_d_m.dart';

class ArticleResponse {
  String? status;
  String? code;
  String? message;
  int? totalResults;
  List<ArticleDM>? articles;

  ArticleResponse({
    this.status,
    this.totalResults,
    this.articles,
    this.code,
    this.message,
  });

  ArticleResponse.fromJson(dynamic json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = [];
      for (var a in json['articles']) {
        articles!.add(ArticleDM.fromJson(a));
      }
    }
  }
}
