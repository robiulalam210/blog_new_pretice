import 'dart:async';

import 'package:blog_new_pretice/view_model/singin_bloc/sigin_state.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../respository/sigin_respository/auth_repository.dart';
import 'signin_event.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthRepository authApi;

  SignInBloc({ this.authApi}) : super(SignInInitialState()) {
    on<SignInTextChangeEvent>((event, emit) {
      if (EmailValidator.validate(event.emailValue) == false) {
        emit(SingInErrorState("Please enter a valid email address"));
      } else if (event.passwordValue.length < 8) {
        emit(SingInErrorState("Plase enter a valid password"));
      } else {
        emit(SingInValidState());
      }
    });
    on<SignInSubmittedEvent>((event, emit)async {
      if (event is SignInEvent) {
        emit(SignInLoadingState());

        try {
          Map<String, dynamic>  body = {
            'email' : event.email,
            'password' : event.password
          };
          final token = await authApi.loginApi(body).then((value){
            print(value);
          });

        } catch (error) {
        }
      }
    });
  }
}
