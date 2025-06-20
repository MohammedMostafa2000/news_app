import 'package:news_app/models/source_d_m.dart';

class SourceResponse {
  String? status;
  String? code;
  String? message;
  List<SourceDM>? sources;

  SourceResponse({
    this.status,
    this.code,
    this.message,
    this.sources,
  });

  SourceResponse.fromJson(dynamic json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    if (json['sources'] != null) {
      sources = [];
      for (var s in json['sources']) {
        sources!.add(SourceDM.fromJson(s));
      }
    }
  }
}
