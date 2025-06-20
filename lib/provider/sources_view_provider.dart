import 'package:flutter/material.dart';
import 'package:news_app/api/api_services.dart';
import 'package:news_app/models/article_d_m.dart';
import 'package:news_app/models/category_d_m.dart';
import 'package:news_app/models/source_d_m.dart';

class SourcesViewModel extends ChangeNotifier {
  bool isSourcesLoading = true;
  bool isArticlesLoading = true;
  List<SourceDM> sources = [];
  List<ArticleDM> articles = [];
  String sourcesErrorMessage = '';
  String articlesErrorMessage = '';
  Future<void> loadSources(CategoryDM category) async {
    var result = await ApiServices.getSources(category);
    result.fold(
      (left) {
        sources = left;
        isSourcesLoading = false;
        notifyListeners();
      },
      (right) {
        sourcesErrorMessage = right;
        notifyListeners();
      },
    );
  }

  void loadArticles(SourceDM source) async {
    var result = await ApiServices.getArticles(source);
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
