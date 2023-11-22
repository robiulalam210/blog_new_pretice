// ignore_for_file: deprecated_member_use, avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../../res/customs/custom_text_field_password.dart';
import '../../../../res/customs/custom_winkwell_button.dart';
import '../../../../res/customs/customs_submit_button.dart';
import '../../../../res/utils/colors_code.dart';
import '../../../../res/utils/images.dart';
import '../../../../res/utils/styles.dart';


// ignore: must_be_immutable
class OtpSendForRegitration extends StatelessWidget {
  OtpSendForRegitration({super.key});
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
                  CustomTextFieldPassword(
                    baseColor: ColorsCode.text_field_base_colors,
                    borderColor: ColorsCode.text_border_color,
                    errorColor: ColorsCode.text_field_error_colors,
                    controller: null,
                    hint: "Mobile number",
                    inputType: TextInputType.number,

                    icon: Icon(
                      Icons.phone,
                      color: ColorsCode.hint_text_color,
                    ),
                    eyesIcon: false,
                    // validator: Validator.validateEmail,
                  ),
                  Style.distan_size10,
                  CustomSubmitButton(
                      text: "Send OTP",
                      style: Style.submit_button_style,
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      color: ColorsCode.submit_button_primary_color,
                      onPressed: ()async {

                      },
                      booldata: true,
                      leftpad: 20,
                      rightpad: 20,
                      borderCircular: 12),
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
