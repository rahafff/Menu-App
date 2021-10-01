// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

Categories categoryFromJson(String str) => Categories.fromJson(json.decode(str));


class Categories {
  Categories({
   required this.result,
  });

  List<Result> result;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
  );
}

class Result {
  Result({
   required this.categoryName,
   required this.item,
  });


  CategoryName categoryName;
  List<Item> item;

  factory Result.fromJson(Map<String, dynamic> json) => Result(

    categoryName: CategoryName.fromJson(json["categoryName"]),

    item: List<Item>.from(json["item"].map((x) => Item.fromJson(x))),
  );
}

class CategoryName {
  CategoryName({
    this.ar,
    this.en,
  });

  String? ar;
  String? en;

  factory CategoryName.fromJson(Map<String, dynamic> json) => CategoryName(
    ar: json["ar"],
    en: json["en"],
  );

  Map<String, dynamic> toJson() => {
    "ar": ar,
    "en": en,
  };
}

class Item {
  Item({
    this.itemName,
    this.price,
    this.option,
    this.photo,
  });


  CategoryName? itemName;
  Price? price;
  List<Option>? option;
  String? photo;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    itemName: CategoryName.fromJson(json["itemName"]),
    price: Price.fromJson(json["price"]),
    option: List<Option>.from(json["option"].map((x) => Option.fromJson(x))),
    photo: json["photo"],
  );
}

class Option {
  Option({
    this.ar,
    this.en,
    this.price,
  });
  String? ar;
  String? en;
  Price? price;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
    ar: json["ar"],
    en: json["en"],
    price: Price.fromJson(json["price"]),
  );

}

class Price {
  Price({
    this.amount,
    this.currency,
  });

  int? amount;
  String? currency;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    amount: json["amount"],
    currency: json["currency"],
  );

}