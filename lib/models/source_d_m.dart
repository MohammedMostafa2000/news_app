class SourceDM {
  String? id;
  String? name;

  SourceDM({
    this.id,
    this.name,
  });

  SourceDM.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
}
