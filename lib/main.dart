import 'package:blog_new_pretice/parasol/view/SignUp/ui/otp_send_for_registration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'parasol/view/SignUp/otp_verification_send_bloc/otpsend_bloc.dart';
import 'parasol/view/SignUp/otpsend_bloc/otpsend_bloc.dart';
import 'parasol/view/SignUp/ui/otp_verify_for_registration.dart';
import 'parasol/view/SigninView/ui/signin_view.dart';
import 'view/home_view/home_view.dart';
import 'view/sign_in_view/sigin_view.dart';
import 'view_model/internet_bloc/internet_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
     // create: (BuildContext context) => InternetBloc(),
      providers: [
        // BlocProvider(create: (BuildContext context) => InternetBloc(),),
        BlocProvider(create: (BuildContext context) => OtpSendBloc(),),
        BlocProvider(create: (BuildContext context) => OtpVerifyBloc(),),


      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Bloc',
        theme: ThemeData(
          // This is the theme of your application.
          //idn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:
       BlocProvider(create: (BuildContext context) => OtpSendBloc(),child: OtpSendForRegitration(),),

      ),
    );
  }
}
