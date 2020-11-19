// To parse this JSON data, do
//
//     final getMediaList = getMediaListFromJson(jsonString);

import 'dart:convert';

GetMediaList getMediaListFromJson(String str) =>
    GetMediaList.fromJson(json.decode(str));

String getMediaListToJson(GetMediaList data) => json.encode(data.toJson());

class GetMediaList {
  GetMediaList({
    this.data,
    this.links,
    this.meta,
  });

  List<Datum> data;
  Links links;
  Meta meta;

  factory GetMediaList.fromJson(Map<String, dynamic> json) => GetMediaList(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "links": links.toJson(),
        "meta": meta.toJson(),
      };
}

class Datum {
  Datum({
    this.id,
    this.type,
    this.title,
    this.description,
    this.url,
    this.fileName,
    this.createdAt,
  });

  int id;
  MediaType type;
  String title;
  Description description;
  String url;
  String fileName;
  int createdAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        type: typeValues.map[json["type"]],
        title: json["title"],
        description: json["description"] == null
            ? null
            : descriptionValues.map[json["description"]],
        url: json["url"],
        fileName: json["file_name"] == null ? null : json["file_name"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": typeValues.reverse[type],
        "title": title,
        "description":
            description == null ? null : descriptionValues.reverse[description],
        "url": url,
        "file_name": fileName == null ? null : fileName,
        "created_at": createdAt,
      };
}

enum Description { EMPTY, THIS_IS_WHAT_WE_USE, AJAB_SIRLAR, DESCRIPTION }

final descriptionValues = EnumValues({
  "ajab sirlar": Description.AJAB_SIRLAR,
  "description": Description.DESCRIPTION,
  "": Description.EMPTY,
  "this is what we use?": Description.THIS_IS_WHAT_WE_USE
});

enum MediaType {
  IMAGE,
  VIDEO,
  DOC,
}

final typeValues = EnumValues(
    {"doc": MediaType.DOC, "image": MediaType.IMAGE, "video": MediaType.VIDEO});

class Links {
  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  String first;
  String last;
  dynamic prev;
  String next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
      };
}

class Meta {
  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  int currentPage;
  int from;
  int lastPage;
  String path;
  int perPage;
  int to;
  int total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
