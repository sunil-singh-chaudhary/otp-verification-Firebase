import 'dart:async';

import 'package:bloc_test_firebase_demo/OtpPage.dart';
import 'package:bloc_test_firebase_demo/webservice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'signin_event.dart';
import 'signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final service = WebServices();

  SignInBloc() : super(SignInInitialState()) {
    on<LoginInSubmittedEvent>((event, emit) async {
      await _verifyPhoneNumber(event, emit);
    });
  }
  Completer<SignInState> c = Completer<SignInState>();
  Future<void> _verifyPhoneNumber(
      LoginInSubmittedEvent event, Emitter<SignInState> emit) async {
    emit(
        SignInLoadingState()); //TODO DONT USE COMPLETER HERER OTHERWISE IT WILL COMPLETED ON START

    String phone = "+91${event.phoneNumber}";
    debugPrint('blc phone no $phone');
    try {
      await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) {
          c.complete(SignInCompletedState(credential));
        },
        verificationFailed: (FirebaseAuthException e) {
          debugPrint('code erorr $e');

          c.complete(SignInErrorState(e.toString()));
        },
        codeSent: (String verificationId, int? resendToken) {
          debugPrint('code sended $verificationId');

          c.complete(SignInValidateState(verificationId, resendToken));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          debugPrint('Timeout  $verificationId');

          c.complete(SignInTimeoutState(verificationId));
        },
      );
    } catch (e) {
      c.complete(SignInErrorState(e.toString()));
    }
    var stateToRetern = await c.future;
    emit(stateToRetern);
  }
}

//   Future _callMyApi(SignInEvent event, Emitter<SignInState> emit) async {
//     emit(SignInLoadingState());

//     var responseInList = await service.callProfileApi();

//     if (responseInList == null) {
//       emit(const SignInErrorState("response have error"));
//     } else {
//       List listdata = jsonDecode(responseInList.body);
//       var data = listdata.map((e) => ProfileModel.fromJson(e)).toList();
//       debugPrint('response is -> $data');
//       emit(const SignInCompletedState());
//     }
//   }
// }
