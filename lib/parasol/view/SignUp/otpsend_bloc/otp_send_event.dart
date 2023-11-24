abstract class OtpSendEvent {}

class OtpSendTextChangeEvent extends OtpSendEvent {
  final String mobile;

  OtpSendTextChangeEvent(this.mobile);
}

class OtpSendSubmittedEvent extends OtpSendEvent {
  final String mobile;

  OtpSendSubmittedEvent(this.mobile);
}
