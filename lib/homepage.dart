import 'package:bloc_test_firebase_demo/OtpPage.dart';
import 'package:bloc_test_firebase_demo/bloc/bloc_login/signin_bloc.dart';
import 'package:bloc_test_firebase_demo/bloc/bloc_login/signin_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc_login/signin_event.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isFetching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      if (state is SignInLoadingState) {
        isFetching = true;
      } else if (state is SignInErrorState) {
        debugPrint("Something went wrong ${state.errorMessage}");
        isFetching = false;
      } else if (state is SignInCompletedState) {
        isFetching = false;

        debugPrint(" Completed ${state.credential}");
      } else if (state is SignInValidateState) {
        isFetching = false;

        String id = state.verificationId;
        debugPrint(" SignInValidateState $id");
        Future.microtask(() {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return OtpPage(
              verificationId: id,
            );
          }));
        });
      } else if (state is SignInTimeoutState) {
        isFetching = false;

        debugPrint(" SignInTimeoutState}");
      }
      return Center(
        child: ElevatedButton(
          onPressed: () {
            debugPrint('clicked');
            BlocProvider.of<SignInBloc>(context)
                .add(LoginInSubmittedEvent("7838108677", context));
          },
          child: isFetching
              ? const CircularProgressIndicator()
              : const Text('Fetch'),
        ),
      );
    }));
  }
}
