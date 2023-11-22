import '../../model/auth/login_model.dart';

abstract class SignInState{}

class SignInInitialState extends SignInState{}
class SingInValidState extends SignInState{}
class Authenticated extends SignInState{}
class SignInErrorState extends SignInState{
  final String errorMessage;
  SignInErrorState(this.errorMessage);
}
class SignInFetchingSuccessfulState extends SignInState {
  final LoginModel login;
  SignInFetchingSuccessfulState({
    required this.login,
  });
}
class SignInLoadingState extends SignInState{}