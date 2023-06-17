// To parse this JSON data, do
//
//     final rs = rsFromJson(jsonString);

import 'dart:convert';

Rs rsFromJson(String str) => Rs.fromJson(json.decode(str));

String rsToJson(Rs data) => json.encode(data.toJson());

class Rs {
  int totalPages;
  int totalCount;
  int pageNumber;
  List<Item> items;

  Rs({
    required this.totalPages,
    required this.totalCount,
    required this.pageNumber,
    required this.items,
  });

  factory Rs.fromJson(Map<String, dynamic> json) => Rs(
    totalPages: json["TotalPages"],
    totalCount: json["TotalCount"],
    pageNumber: json["PageNumber"],
    items: List<Item>.from(json["Items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "TotalPages": totalPages,
    "TotalCount": totalCount,
    "PageNumber": pageNumber,
    "Items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item {
  int storyId;
  String couplePhotoImageUrl;
  String coupleName;
  String story;

  Item({
    required this.storyId,
    required this.couplePhotoImageUrl,
    required this.coupleName,
    required this.story,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    storyId: json["StoryId"],
    couplePhotoImageUrl: json["CouplePhotoImageUrl"],
    coupleName: json["CoupleName"],
    story: json["Story"],
  );

  Map<String, dynamic> toJson() => {
    "StoryId": storyId,
    "CouplePhotoImageUrl": couplePhotoImageUrl,
    "CoupleName": coupleName,
    "Story": story,
  };
}
