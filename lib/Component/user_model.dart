import 'dart:convert';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from((json.decode(str)["result"]["records"]).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  UserModel({
    required this.id,
    required this.priceDate,
    this.prProdName,
    this.marketName,
    this.priceDay,
  });

  int id;
  DateTime priceDate;
  String? prProdName;
  String? marketName;
  double? priceDay;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["_id"],
    priceDate: DateTime.parse(json["PRICE_DATE"]),
    prProdName: json["PR_PROD_NAME"],
    marketName: json["MARKET_NAME"],
    priceDay: json["PRICE_DAY"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "PRICE_DATE": priceDate.toIso8601String(),
    "PR_PROD_NAME": prProdName,
    "MARKET_NAME": marketName,
    "PRICE_DAY": priceDay,
  };
}
