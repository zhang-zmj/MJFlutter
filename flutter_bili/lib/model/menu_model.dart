import 'dart:convert';

class MenuModel {
  Data? data;
  MenuModel({this.data});
  MenuModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['data'] = jsonEncode(data);
    return data;
  }
}

class Data {
  String? name;
  String? type;
  List<Sub>? sub;

  Data({this.name, this.type, this.sub});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    if (json['sub'] != null) {
      sub = <Sub>[];
      json['sub'].forEach((v) {
        sub!.add( Sub.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['name'] = name;
    data['type'] = type;
    if (sub != null) {
      data['sub'] = sub!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sub {
  int? id;
  String? name;
  String? cover;
  String? logo;
  String? type;
  int? sort;
  String? link;
  String? showNavigator;

  Sub(
      {this.id,
        this.name,
        this.cover,
        this.logo,
        this.type,
        this.sort,
        this.link,
        this.showNavigator});

  Sub.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cover = json['cover'];
    logo = json['logo'];
    type = json['type'];
    sort = json['sort'];
    link = json['link'];
    showNavigator = json['showNavigator'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['cover'] = cover;
    data['logo'] = logo;
    data['type'] = type;
    data['sort'] = sort;
    data['link'] = link;
    data['showNavigator'] = showNavigator;
    return data;
  }
}