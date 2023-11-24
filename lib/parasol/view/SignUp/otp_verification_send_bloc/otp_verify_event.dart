abstract class OtpVerifyEvent {}

class OtpVerifyTextChangeEvent extends OtpVerifyEvent {
  final String mobile;

  OtpVerifyTextChangeEvent(this.mobile);
}

class OtpVerifySubmittedEvent extends OtpVerifyEvent {
  final String mobile;
  final String code;

  OtpVerifySubmittedEvent(this.mobile,this.code);
}
