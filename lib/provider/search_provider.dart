import 'package:flutter/material.dart';
import 'package:news_app/api/api_services.dart';
import 'package:news_app/models/article_d_m.dart';

class SearchViewModel extends ChangeNotifier {
  bool isArticlesLoading = true;
  List<ArticleDM> articles = [];
  String articlesErrorMessage = '';

  void loadArticles(String query) async {
    if (query.isEmpty) {
      articles = [];
      notifyListeners();
      return;
    }
    var result = await ApiServices.search(query);
    result.fold(
      (left) {
        articles = left;
        isArticlesLoading = false;
        notifyListeners();
      },
      (right) {
        articlesErrorMessage = right;
        notifyListeners();
      },
    );
  }
}
