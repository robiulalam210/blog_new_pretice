// ignore_for_file: deprecated_member_use, prefer_const_constructors, sized_box_for_whitespace

import 'dart:async';
import 'dart:io';

import 'package:blog_new_pretice/parasol/view/SignUp/singup_bloc/signin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../res/customs/custom_label_for_text_field.dart';
import '../../../../res/customs/custom_text_button.dart';
import '../../../../res/customs/custom_text_field_password.dart';
import '../../../../res/customs/custom_winkwell_button.dart';
import '../../../../res/customs/customs_submit_button.dart';
import '../../../../res/utils/colors_code.dart';
import '../../../../res/utils/images.dart';
import '../../../../res/utils/styles.dart';
import '../../../../view_model/singin_bloc/signin_bloc.dart';
import '../../SignUp/ui/otp_send_for_registration.dart';

// ignore: must_be_immutable
class MobileSignInView extends StatefulWidget {
  const MobileSignInView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MobileSignInViewState createState() => _MobileSignInViewState();
}

class _MobileSignInViewState extends State<MobileSignInView> {
  // SignInSignUpCustomsController signInController =
  //     Get.put(SignInSignUpCustomsController());
  // final bool _canExit = GetPlatform.isWeb ? true : false;
  // LoginController loginController = Get.put(LoginController());
  // OnbordingController onbordingController = Get.put(OnbordingController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: ColorsCode.page_background_color,
        body: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //
                  Center(
                      child: Image.asset(
                    Images.logo,
                    height: MediaQuery.of(context).size.height * .30,
                    // MediaQuery.of(context).size.height * .30,
                    width: MediaQuery.of(context).size.width * .40,
                    fit: BoxFit.contain,
                  )),

                  // Style.distan_size10,
                  const CustomLabelField(
                    text: "Phone Number",
                    style: Style.robotoRegular,
                  ),
                  CustomTextFieldPassword(
                    baseColor: ColorsCode.text_field_base_colors,
                    borderColor: ColorsCode.text_border_color,
                    errorColor: ColorsCode.text_field_error_colors,
                    controller: null,
                    hint: "Phone number",
                    inputType: TextInputType.number,
                    icon: const Icon(
                      Icons.phone,
                      color: ColorsCode.icon_primary_colors,
                    ),
                    eyesIcon: false,
                    onChangedFunction: null,
                    // validator: Validator.validateEmail,
                  ),
                  // Style.distan_size10,
                  const CustomLabelField(
                    text: "Password",
                    style: Style.robotoRegular,
                  ),
                  CustomTextFieldPassword(
                    baseColor: ColorsCode.text_field_base_colors,
                    borderColor: ColorsCode.text_border_color,
                    errorColor: ColorsCode.text_field_error_colors,
                    controller: null,
                    hint: "........",
                    inputType: TextInputType.text,

                    icon: const Icon(
                      Icons.lock,
                      color: ColorsCode.icon_primary_colors,
                    ),
                    eyesIcon: true,
                    // validator: Validator.validateEmail,
                    onChangedFunction: null,
                  ),
                  CustomTextButton(
                    text: "Forget Password?",
                    style: Style.text_style_primary,
                    padding: const EdgeInsets.only(right: 15),
                    // ignore: avoid_print
                    onPressedController: () {
                      //  Get.toNamed(RouteManeger.mobilePhoneVerificationLogin);
                    },
                    alignment: Alignment.centerRight,
                  ),
                  CustomSubmitButton(
                      text: "Sign In",
                      style: Style.submit_button_style,
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      color: ColorsCode.submit_button_primary_color,
                      onPressed: () {
                        // Get.toNamed(RouteManeger.dashboard);
                      },
                      booldata: true,
                      leftpad: 20,
                      rightpad: 20,
                      borderCircular: 8),
                  Style.distan_size10,
                  Center(
                      child: CustomtWinkwellButton(
                          text1: "Don't have an account ?  ",
                          text2: "Sign Up",
                          style1: Style.robotoRegular,
                          style2: Style.text_style,
                          onPressed: () {
                            print("object");
                            // BlocProvider(
                            //     create: (BuildContext context) => OtpSendBloc(),
                            //     child: OtpSendForRegitration());

                            Navigator.push(context, MaterialPageRoute(
                                builder: (context)=>OtpSendForRegitration()));
                            // Get.toNamed(RouteManeger.otpsendForRegistration);
                          })),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
