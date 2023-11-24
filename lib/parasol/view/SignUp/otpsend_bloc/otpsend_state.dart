
import '../../../model/otp_send_mobile.dart';

abstract class OtpSendState{}

class OtpSendInitialState extends OtpSendState{}
class OtpSendValidState extends OtpSendState{}
class OtpSendErrorState extends OtpSendState{
  final String errorMessage;
  OtpSendErrorState(this.errorMessage);
}
class OtpSendFetchingSuccessfulState extends OtpSendState {
  final OtpSendModel otpSendModel;
  OtpSendFetchingSuccessfulState({
    required this.otpSendModel,
  });
}
class OtpSendLoadingState extends OtpSendState{}