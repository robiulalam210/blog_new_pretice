// ignore_for_file: unnecessary_string_interpolations, constant_identifier_names, duplicate_ignore

class AppUrls {
  // ignore: constant_identifier_names
  static const String APP_NAME = 'PARASOL HEALTH';

  // ignore: constant_identifier_names
  static const String APP_TITLE = 'PARASOL HEALTH';

  // ignore: constant_identifier_names
  static const String BASE_URL = "https://parasol.supportreflexsoft.xyz";

  // ignore: constant_identifier_names
  static const String LOGIN = "/api/login";

  // ignore: constant_identifier_names
  static const String REGISTER_MOBILE_OTP_SEND = "/api/send_otp";

  // ignore: constant_identifier_names
  static const String REGISTER_MOBILE_OTP = "/api/verify_otp";

  // ignore: constant_identifier_names
  static const String REGISTER_APP_USER = "/api/register";

  static const String USER_DATA_INFO = "/api/user_profile_detail";
  static const String PROFILE_PHOTO_UPDATE = "/api/update_profile_image";
  static const String PENDING_APPOINTMENT_LIST = "/api/user_appointments";
  static const String CANCEL_APPOINTMENT_LIST = "/api/appointments/";
  static const String NURSE_LIST = "/api/nurse_list";
  static const String SEARCH_NURSE = "/api/nurse_list?search=";
  static const String NURSE_SPECIALITIES_LIST = "/api/specialities";
  static const String SPECIALITIES_NURSE_LIST =
      "/api/nurse_list?speciality_id=";
  static const String NURSE_LIST_PROFILE_DETAILS =
      "/api/nurse_profile_details?user_id=";
  static const String ADD_PATIENTS_LIST = "/api/patients_store";
  static const String PATIENTS_LIST = "/api/user_patients";
  static const String PATIENTS_LIST_DELETE = "/api/patients/";
  static const String SERVICE_LIST = "/api/nurse_services?user=";
  static const String SSL_INFO = "/api/sslcommerz-info";
  static const String ONBOARDING = "/api/onboardings";
  static const String BANNER = "/api/banners";
  static const String USER_PAYMENT = "/api/user_payments";
  static const String USER_TRANSCATION = "/api/transactions?user_id=";
  static const String ATTENDANCE_REPORTS = "/api/attendance_reports?appointment_id=";
  static const String POST_RATING = "/api/reviews";
}
