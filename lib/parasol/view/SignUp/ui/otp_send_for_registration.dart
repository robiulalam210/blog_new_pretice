// ignore_for_file: deprecated_member_use, avoid_unnecessary_containers, prefer_const_constructors

import 'package:blog_new_pretice/parasol/view/SignUp/singup_bloc/sigin_state.dart';
import 'package:blog_new_pretice/parasol/view/SignUp/singup_bloc/signin_bloc.dart';
import 'package:blog_new_pretice/parasol/view/SignUp/singup_bloc/signin_event.dart';
import 'package:blog_new_pretice/parasol/view/SignUp/ui/otp_verify_for_registration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../res/customs/custom_text_field_password.dart';
import '../../../../res/customs/custom_winkwell_button.dart';
import '../../../../res/customs/customs_submit_button.dart';
import '../../../../res/utils/colors_code.dart';
import '../../../../res/utils/images.dart';
import '../../../../res/utils/styles.dart';


// ignore: must_be_immutable
class OtpSendForRegitration extends StatefulWidget {
  OtpSendForRegitration({super.key});

  @override
  State<OtpSendForRegitration> createState() => _OtpSendForRegitrationState();
}
TextEditingController mobile = TextEditingController();

class _OtpSendForRegitrationState extends State<OtpSendForRegitration> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          return Future.value(true);
        },
        child: Scaffold(
          backgroundColor: ColorsCode.page_background_color,
          body: SafeArea(
              child: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    Images.logo,
                    height: MediaQuery.of(context).size.height * .15,
                    width: MediaQuery.of(context).size.width * .4,
                  ),
                  BlocBuilder<OtpSendBloc, OtpSendState>(
                    builder: (BuildContext context, OtpSendState state) {
                      if (state is OtpSendErrorState) {
                        return Text(
                          state.errorMessage,
                          style: TextStyle(color: Colors.red),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),

                  CustomTextFieldPassword(
                    baseColor: ColorsCode.text_field_base_colors,
                    borderColor: ColorsCode.text_border_color,
                    errorColor: ColorsCode.text_field_error_colors,
                    controller: mobile,
                    hint: "Mobile number",
                    inputType: TextInputType.number,

                    icon: Icon(
                      Icons.phone,
                      color: ColorsCode.hint_text_color,
                    ),
                    eyesIcon: false,
                    onChanged: (val){
                      BlocProvider.of<OtpSendBloc>(context)
                          .add(OtpSendTextChangeEvent(mobile.text));

                    },
                  ),
                  Style.distan_size10,


                  BlocBuilder<OtpSendBloc, OtpSendState>(
                      builder: (BuildContext context, OtpSendState state) {
                        if (state is OtpSendLoadingState) {
                          return CircularProgressIndicator();
                        } else if (state is OtpSendFetchingSuccessfulState) {
                          WidgetsBinding.instance?.addPostFrameCallback((_) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OtpVerifyForRegistration(),
                              ),
                            );
                          });
                        }
                        return  CustomSubmitButton(
                            text: "Send OTP",
                            style: Style.submit_button_style,
                            padding: const EdgeInsets.only(top: 15, bottom: 15),
                            color: (state is OtpSendValidState) ? ColorsCode.submit_button_primary_color : Colors.grey ,
                            onPressed: ()async {

                                  if (state is OtpSendValidState) {
                                    BlocProvider.of<OtpSendBloc>(context)
                                        .add(OtpSendSubmittedEvent(mobile.text));
                                    //Navigator.pushNamed(context, Routes.home);
                                  }
                            },
                            booldata: true,
                            leftpad: 20,
                            rightpad: 20,
                            borderCircular: 12);

                          // MaterialButton(
                          //   color:
                          //   (state is SingInValidState) ? Colors.blue : Colors.grey,
                          //   onPressed: () {
                          //     if (state is SingInValidState) {
                          //       BlocProvider.of<SignInBloc>(context)
                          //           .add(SignInSubmittedEvent(email.text, password.text));
                          //       //Navigator.pushNamed(context, Routes.home);
                          //     }
                          //   },
                          //   child: Text("Sign In"));
                      }),
                  Style.distan_size10,
                  Style.distan_size10,
                  Center(
                    child: CustomtWinkwellButton(
                        text1: "Already have an account ?  ",
                        text2: "Log In",
                        style1: Style.robotoRegular,
                        style2: Style.text_style,
                        onPressed: () =>
                            ()),
                  )
                ]),
          )),
        ));
  }
}
