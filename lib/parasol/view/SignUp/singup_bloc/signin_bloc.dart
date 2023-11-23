import 'package:blog_new_pretice/parasol/view/SignUp/singup_bloc/sigin_state.dart';
import 'package:blog_new_pretice/view_model/singin_bloc/sigin_state.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repository/auth_repository.dart';
import 'signin_event.dart';

class OtpSendBloc extends Bloc<OtpSendEvent, OtpSendState> {
  OtpSendBloc() : super(OtpSendInitialState()) {
    //  AuthRepository? authApi;

    on<OtpSendTextChangeEvent>((event, emit) {
      if (event.mobile.length < 11) {
        emit(OtpSendErrorState("Please enter a valid mobile"));
      } else {
        emit(OtpSendValidState());
      }
    });
    on<OtpSendSubmittedEvent>((event, emit) async {
      if (event is OtpSendEvent) {
        try {
          emit(OtpSendInitialState());

          Map body = {'phone': event.mobile};

          final repo = AuthParasolRepository();
          final otpsend = await repo.otpsendApi(body);

          emit(OtpSendFetchingSuccessfulState(otpSendModel: otpsend));
          print(otpsend);
        } catch (error) {
          emit(OtpSendErrorState(error.toString()));

          print("Error $error");
        }
      }
    });
  }
}
