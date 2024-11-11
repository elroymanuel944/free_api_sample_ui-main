// To parse this JSON data, do
//
//     final loginResponeModel = loginResponeModelFromJson(jsonString);

import 'dart:convert';

LoginResponeModel loginResponeModelFromJson(String str) => LoginResponeModel.fromJson(json.decode(str));

String loginResponeModelToJson(LoginResponeModel data) => json.encode(data.toJson());

class LoginResponeModel {
    String? refresh;
    String? access;
    int? id;
    String? name;
    String? place;
    String? email;

    LoginResponeModel({
        this.refresh,
        this.access,
        this.id,
        this.name,
        this.place,
        this.email,
    });

    factory LoginResponeModel.fromJson(Map<String, dynamic> json) => LoginResponeModel(
        refresh: json["refresh"],
        access: json["access"],
        id: json["id"],
        name: json["name"],
        place: json["place"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "refresh": refresh,
        "access": access,
        "id": id,
        "name": name,
        "place": place,
        "email": email,
    };
}
