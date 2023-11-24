
import '../../../model/otp_send_mobile.dart';

abstract class OtpVerifyState{}

class OtpVerifyInitialState extends OtpVerifyState{}
class OtpVerifyValidState extends OtpVerifyState{}
class OtpVerifyErrorState extends OtpVerifyState{
  final String errorMessage;
  OtpVerifyErrorState(this.errorMessage);
}
class OtpVerifyFetchingSuccessfulState extends OtpVerifyState {
  // final OtpSendModel otpSendModel;
  OtpVerifyFetchingSuccessfulState(
    // required this.otpSendModel,
  );
}
class OtpVerifyLoadingState extends OtpVerifyState{}