import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/internet_bloc/internet_bloc.dart';
import '../../view_model/internet_bloc/internet_state.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<InternetBloc, InternetState>(
            listener: (context, state) {
              if(state is InternetLostState){
                print("Lost Internet");

              }else if (state is InternetGainedState){
                print("Gain Internet");
              }
              // do stuff here based on BlocA's state
            },
            builder: (context, state) {
              return Text("Loding");
              // return widget here based on BlocA's state
            }
        )
      ),
    );
  }
}
