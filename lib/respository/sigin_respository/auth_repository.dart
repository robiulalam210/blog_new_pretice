import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../data/network/BaseApiServices.dart';
import '../../data/network/NetworkApiService.dart';
import '../../model/auth/login_model.dart';
import '../../res/app_url/urls_and_app_constants.dart';

class AuthRepository {
  BaseApiServices apiService = NetworkApiServices();

  Future<LoginModel> loginApi(body) async {
    try {
      dynamic response = await apiService.postApi(AppUrls.login, body);
      print(response);
      return LoginModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

//
// Future<SendVerificationModel> sendOTP(
//     {required Map<String, dynamic> body}) async {
//   try {
//     dynamic response =
//         await apiService.getPostApiResponse(AppUrls.sendVerification, body);
//     return SendVerificationModel.fromJson(response);
//   } catch (e) {
//     rethrow;
//   }
// }
//
// Future<OtpCheckModel> checkOTP({required Map<String, dynamic> body}) async {
//   try {
//     dynamic response =
//         await apiService.getPostApiResponse(AppUrls.checkOtp, body);
//     return OtpCheckModel.fromJson(response);
//   } catch (e) {
//     rethrow;
//   }
// }
//
// NetworkApiService api = NetworkApiService();
// Future<RegistrationModel> signUpOriginal(BuildContext context, Map<String,dynamic> body)async{
//
//   dynamic responseJson;
//   try{
//     final response = await http.post(
//         body: jsonEncode(body),
//         headers: {
//           'databaseName': 'mhpgmailcom',
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//
//         },
//         Uri.parse(AppUrls.registration)).timeout(const Duration(seconds: 10),
//     );
//     responseJson = api.returnResponse(response);
//     return RegistrationModel.fromJson(responseJson);
//
//   }on SocketException{
//     throw FetchDataException("No Internet Connection");
//   }catch (e){
//     rethrow;
//   }
// }
//
// Future<RegistrationModel> signUpApi(
//     {required Map<String, String> body, required imageBytes}) async {
//   SendImage sendImage = SendImage();
//   try {
//     dynamic response =
//     await sendImage.addImage(body, imageBytes);
//       //   await apiService.getPostApiResponse(AppUrls.registration, body);
//     return RegistrationModel.fromJson(response);
//   } catch (e) {
//     rethrow;
//   }
// }
//
// Future<RegistrationModel> registration(
//     {required File imageFile,
//     required String phoneNumber,
//     required String token,
//     required String verificationCode,
//     required String name,
//     required String genderId,
//     required String bloodGroupId,
//     required String dateOfBirth,
//     required String password,
//     required String email}) async {
//   UserRegistration registration = UserRegistration();
//   try {
//     var json = await registration.sendImageAndData(
//         imageFile: imageFile,
//         phoneNumber: phoneNumber,
//         token: token,
//         verificationCode: verificationCode,
//         name: name,
//         genderId: genderId,
//         bloodGroupId: bloodGroupId,
//         dateOfBirth: dateOfBirth,
//         password: password,
//         email: email);
//     return RegistrationModel.fromJson(json);
//   } catch (e) {
//     rethrow;
//   }
// }
//
// Future<BloodGroupModel> getBloodGroup() async {
//   try {
//     dynamic response = await apiService.getGetApiResponse(AppUrls.bloodGroup);
//     print(response);
//     return BloodGroupModel.fromJson(response);
//   } catch (e) {
//     rethrow;
//   }
// }

// Future<BirthSexModel> getBirthSex() async {
//   try {
//     dynamic response = await apiService.getGetApiResponse(AppUrls.birthSex);
//     print(response);
//
//     return BirthSexModel.fromJson(response);
//   } catch (e) {
//     rethrow;
//   }
// }

// registration(Map<String, String> body, String filepath)async{
//   try{
//     Map<String, String> headers = {
//       'Content-Type': 'multipart/form-data',
//     };
//     var request = http.MultipartRequest('POST', Uri.parse(AppUrls.registration))
//       ..fields.addAll(body)
//       ..headers.addAll(headers)
//       ..files.add(await http.MultipartFile.fromPath('image', filepath));
//     var response = await request.send();
//     // NetworkApiService().returnResponse(response);
//     debugPrint("Response Code: ${response.statusCode}");
//     return RegistrationModel.fromJson(response);
//   }catch (e){
//     rethrow;
//   }
// }
}
