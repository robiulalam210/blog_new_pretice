import 'package:blog_new_pretice/view/home_view/home_view.dart';
import 'package:blog_new_pretice/view_model/singin_bloc/sigin_state.dart';
import 'package:blog_new_pretice/view_model/singin_bloc/signin_bloc.dart';
import 'package:blog_new_pretice/view_model/singin_bloc/signin_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignView extends StatefulWidget {
  const SignView({super.key});

  @override
  State<SignView> createState() => _SignViewState();
}

TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();

class _SignViewState extends State<SignView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            BlocBuilder<SignInBloc, SignInState>(
              builder: (BuildContext context, SignInState state) {
                if (state is SignInErrorState) {
                  return Text(
                    state.errorMessage,
                    style: TextStyle(color: Colors.red),
                  );
                } else {
                  return Container();
                }
              },
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              onChanged: (val) {
                BlocProvider.of<SignInBloc>(context)
                    .add(SignInTextChangeEvent(email.text, password.text));
              },
              controller: email,
              decoration: InputDecoration(hintText: "Email"),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              onChanged: (val) {
                BlocProvider.of<SignInBloc>(context)
                    .add(SignInTextChangeEvent(email.text, password.text));
              },
              controller: password,
              decoration: InputDecoration(hintText: "Password"),
            ),
            SizedBox(
              height: 60,
            ),
            BlocBuilder<SignInBloc, SignInState>(
                builder: (BuildContext context, SignInState state) {
              if (state is SignInLoadingState) {
                return CircularProgressIndicator();
              } else if (state is SignInFetchingSuccessfulState) {
                WidgetsBinding.instance?.addPostFrameCallback((_) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PostsPage(),
                    ),
                  );
                });
              }
              return MaterialButton(
                  color:
                      (state is SingInValidState) ? Colors.blue : Colors.grey,
                  onPressed: () {
                    if (state is SingInValidState) {
                      BlocProvider.of<SignInBloc>(context)
                          .add(SignInSubmittedEvent(email.text, password.text));
                      //Navigator.pushNamed(context, Routes.home);
                    }
                  },
                  child: Text("Sign In"));
            })
          ],
        ),
      ),
    );
  }
}
