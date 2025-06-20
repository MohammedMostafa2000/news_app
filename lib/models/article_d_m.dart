class ArticleDM {
  String? title;
  String? description;
  String? author;
  String? publishedAt;
  String? url;
  String? urlToImage;

  ArticleDM({
    required this.title,
    required this.description,
    required this.author,
    required this.publishedAt,
    required this.url,
    required this.urlToImage,
  });

  ArticleDM.fromJson(dynamic json) {
    title = json['title'];
    description = json['description'];
    author = json['author'];
    publishedAt = json['publishedAt'];
    url = json['url'];
    urlToImage = json['urlToImage'];
  }
}
