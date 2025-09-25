import 'dart:convert';

class CategorieModel {
  String? id;
  String? name;
  String? imagefrontsmallurl;

  CategorieModel({this.id, this.name, this.imagefrontsmallurl});

  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory CategorieModel.fromRawJson(String str) =>
      CategorieModel.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------

  factory CategorieModel.fromMap(Map<String, dynamic> json) {
    return CategorieModel(
      id: json['id'],
      name: json['name'],
      imagefrontsmallurl: json['image_front_small_url'],
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image_front_small_url'] = imagefrontsmallurl;
    return data;
  }
}
