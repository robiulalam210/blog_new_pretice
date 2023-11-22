abstract class SignInState{}

class SignInInitialState extends SignInState{}
class SingInValidState extends SignInState{}
class SingInErrorState extends SignInState{
  final String errorMessage;
  SingInErrorState(this.errorMessage);
}
class SignInLoadingState extends SignInState{}