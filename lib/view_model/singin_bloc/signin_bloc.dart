import 'package:blog_new_pretice/view_model/singin_bloc/sigin_state.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../respository/sigin_respository/auth_repository.dart';
import 'signin_event.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    //  AuthRepository? authApi;

    on<SignInTextChangeEvent>((event, emit) {
      if (EmailValidator.validate(event.emailValue) == false) {
        emit(SignInErrorState("Please enter a valid email address"));
      } else if (event.passwordValue.length < 8) {
        emit(SignInErrorState("Plase enter a valid password"));
      } else {
        emit(SingInValidState());
      }
    });
    on<SignInSubmittedEvent>((event, emit) async {
      if (event is SignInEvent) {
        try {
          emit(SignInLoadingState());

          Map body = {'email': event.email, 'password': event.password};
          // Make API call to authenticate user
          // final response = await http.post(
          //   Uri.parse(AppUrls.login),
          //   body: {'email': event.email, 'password': event.password},
          // );
          final repo = AuthRepository();
          final posts = await repo.loginApi(body);

          emit(SignInFetchingSuccessfulState(login: posts));
          print(posts);
          // if (response.statusCode == 201) {
          //   // Authenticated();
          //   // Navigator.push(
          //   //   context,
          //   //   MaterialPageRoute(
          //   //     builder: (context) => HomeView(),
          //   //   ),
          //   // );
          //   print("Successful");
          // } else {
          //   print("Successful Failes");
          //
          //   // yield AuthError(message: 'Login failed');
          // }
        } catch (error) {
          emit(SignInLoadingState());

          print("Error $error");
        }
      }
    });
  }
}
