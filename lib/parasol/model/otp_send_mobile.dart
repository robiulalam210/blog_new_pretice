// To parse this JSON data, do
//
//     final otpSendModel = otpSendModelFromJson(jsonString);

import 'dart:convert';

OtpSendModel otpSendModelFromJson(String str) => OtpSendModel.fromJson(json.decode(str));

String otpSendModelToJson(OtpSendModel data) => json.encode(data.toJson());

class OtpSendModel {
  bool? success;
  String? message;
  int? data;
  int? status;

  OtpSendModel({
    this.success,
    this.message,
    this.data,
    this.status,
  });

  factory OtpSendModel.fromJson(Map<String, dynamic> json) => OtpSendModel(
    success: json["success"],
    message: json["message"],
    data: json["data"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data,
    "status": status,
  };
}
