
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repository/auth_repository.dart';
import 'otp_verify_event.dart';
import 'otpverfy_state.dart';

class OtpVerifyBloc extends Bloc<OtpVerifyEvent, OtpVerifyState> {
  OtpVerifyBloc() : super(OtpVerifyInitialState()) {
    //  AuthRepository? authApi;

    on<OtpVerifyTextChangeEvent>((event, emit) {
      if (event.mobile.length < 6) {
        emit(OtpVerifyErrorState("Please enter a valid Otp"));
      } else {
        emit(OtpVerifyValidState());
      }
    });
    on<OtpVerifySubmittedEvent>((event, emit) async {
      if (event is OtpVerifyEvent) {
        try {
          emit(OtpVerifyInitialState());

          Map body = {
            "phone": event.mobile,
            "otp": event.code,

          };

          final repo = AuthParasolRepository();
          final otpsend = await repo.otpverify(body);

          emit(OtpVerifyFetchingSuccessfulState());
          print(otpsend);
        } catch (error) {
          emit(OtpVerifyErrorState(error.toString()));

          print("Error $error");
        }
      }
    });
  }
}
