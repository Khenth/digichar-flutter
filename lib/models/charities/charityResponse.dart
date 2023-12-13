import 'dart:convert';

import 'package:digichar/models/models.dart';

class CharityResponse {
    final String msg;
    final Charity data;

    CharityResponse({
        required this.msg,
        required this.data,
    });

    factory CharityResponse.fromRawJson(String str) => CharityResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CharityResponse.fromJson(Map<String, dynamic> json) => CharityResponse(
        msg: json["msg"],
        data: Charity.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": data.toJson(),
    };
}
