
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repository/auth_repository.dart';
import 'otp_send_event.dart';
import 'otpsend_state.dart';

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
