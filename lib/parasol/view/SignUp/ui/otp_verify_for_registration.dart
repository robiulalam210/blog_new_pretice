// ignore_for_file: deprecated_member_use, sized_box_for_whitespace, prefer_const_constructors, non_constant_identifier_names, duplicate_ignore, avoid_types_as_parameter_names

import 'dart:async';

import 'package:blog_new_pretice/parasol/view/SignUp/otp_verification_send_bloc/otp_verify_event.dart';
import 'package:blog_new_pretice/parasol/view/SignUp/otp_verification_send_bloc/otpverfy_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../res/customs/custom_winkwell_button.dart';
import '../../../../res/customs/customs_label.dart';
import '../../../../res/customs/customs_submit_button.dart';
import '../../../../res/utils/colors_code.dart';
import '../../../../res/utils/images.dart';
import '../../../../res/utils/styles.dart';
import '../../SigninView/ui/signin_view.dart';
import '../otp_verification_send_bloc/otpsend_bloc.dart';

// ignore: must_be_immutable
class OtpVerifyForRegistration extends StatefulWidget {
  OtpVerifyForRegistration({super.key, required this.mobile});

  var mobile;

  @override
  State<OtpVerifyForRegistration> createState() =>
      _OtpVerifyForRegistrationState();
}

class _OtpVerifyForRegistrationState extends State<OtpVerifyForRegistration> {
  TextEditingController textEditingController = TextEditingController();

  // ..text = "123456";
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;

  String currentText = "";

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          return Future.value(true);
        },
        child: Scaffold(
            backgroundColor: ColorsCode.page_background_color,
            // appBar: ResponsiveHelper.isDesktop(context)
            //     ? const WebMenuBar()
            //     : AppBar(
            //         centerTitle: true,
            //         backgroundColor: ColorsCode.primary_color,
            //         bottomOpacity: 0.0,
            //         elevation: 0.0,
            //         leading: IconButton(
            //           onPressed: () => Get.back(),
            //           // onPressed: () => signInController.showExitWarning(),
            //           icon: Icon(Icons.arrow_back_ios_rounded,
            //               color: Theme.of(context).textTheme.bodyText1!.color),
            //         ),
            //       ),

            body: SafeArea(
                child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CustomLabelText(
                            text: 'Phone Number Verification',
                            style: Style.robotoHeader20primaryColor,
                          ),
                          Style.distan_size15,
                          Image.asset(
                            Images.verification_logo,
                            height: MediaQuery.of(context).size.height * .15,
                            fit: BoxFit.contain,
                            width: MediaQuery.of(context).size.width * 0.4,
                          ),
                          Style.distan_size10,
                          const CustomLabelText(
                            text: 'Verification code',
                            style: Style.robotoHeader30,
                          ),
                          Style.distan_size5,
                          CustomLabelText(
                            text:
                                'We sent the verification code to your Number.',
                            style: Style.text_style_primary,
                          ),
                          Style.distan_size15,
                          BlocBuilder<OtpVerifyBloc, OtpVerifyState>(
                            builder: (BuildContext context, OtpVerifyState state) {
                              if (state is OtpVerifyErrorState) {
                                return Text(
                                  state.errorMessage,
                                  style: TextStyle(color: Colors.red),
                                );
                              } else {
                                return Container();
                              }
                            },
                          ),
                          Style.distan_size5,

                          PinCodeTextField(
                            length: 6,
                            obscureText: false,
                            animationType: AnimationType.fade,
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(5),
                              fieldHeight: 40,
                              fieldWidth: 40,
                              activeFillColor: Colors.white,
                            ),
                            animationDuration: Duration(milliseconds: 300),
                            backgroundColor: Colors.blue.shade50,
                            enableActiveFill: true,
                            errorAnimationController: errorController,
                            controller: textEditingController,
                            onCompleted: (v) {
                              print("Completed $v");
                            },
                            onChanged: (value) {
                              BlocProvider.of<OtpVerifyBloc>(context)
                                  .add(OtpVerifyTextChangeEvent(textEditingController.text));
                              print(value);
                              // setState(() {
                              //   currentText = value;
                              // });
                            },
                            beforeTextPaste: (text) {
                              print("Allowing to paste $text");
                              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                              //but you can show anything you want here, like your pop up saying wrong paste format or etc
                              return true;
                            }, appContext: context,
                          ),
                          Style.distan_size5,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                  child: CustomtWinkwellButton(
                                      text1: "Don’t receive OTP? ",
                                      text2: "",
                                      style1: Style.robotoRegular,
                                      style2: Style.text_style_primary,
                                      // ignore: avoid_print
                                      onPressed: () => (print("aaaa")))),
                              // Countdown(
                              //   seconds: 60,
                              //   build: (BuildContext, double) {
                              //     return Text(double.toString());
                              //   },
                              // )
                            ],
                          ),
                          Style.distan_size2,
                          BlocBuilder<OtpVerifyBloc, OtpVerifyState>(builder:
                              (BuildContext context, OtpVerifyState state) {
                            if (state is OtpVerifyLoadingState) {
                              return CircularProgressIndicator();
                            } else if (state
                                is OtpVerifyFetchingSuccessfulState) {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>MobileSignInView()));

                            }
                            return CustomSubmitButton(
                                text: "Send OTP",
                                style: Style.submit_button_style,
                                padding:
                                    const EdgeInsets.only(top: 15, bottom: 15),
                                color: (state is OtpVerifyValidState)
                                    ? ColorsCode.submit_button_primary_color
                                    : Colors.grey,
                                onPressed: () async {
                                  if (state is OtpVerifyValidState) {
                                    BlocProvider.of<OtpVerifyBloc>(context).add(
                                        OtpVerifySubmittedEvent(
                                            widget.mobile.text,
                                            currentText));
                                    //Navigator.pushNamed(context, Routes.home);
                                  }
                                },
                                booldata: true,
                                leftpad: 20,
                                rightpad: 20,
                                borderCircular: 12);
                          }),


                        ],
                      ),
                    )))));
  }
}
