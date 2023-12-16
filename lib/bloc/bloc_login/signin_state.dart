import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class SignInState extends Equatable {
  const SignInState();
  @override
  List<Object> get props => [];
}

class SignInInitialState extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignInTimeoutState extends SignInState {
  final String verificationId;

  const SignInTimeoutState(this.verificationId);
  @override
  List<Object> get props => [verificationId];
}

class SignInCompletedState extends SignInState {
  PhoneAuthCredential credential;
  SignInCompletedState(this.credential);
  @override
  List<Object> get props => [credential];
}

class SignInValidateState extends SignInState {
  final String verificationId;
  final int? resendToken;

  const SignInValidateState(this.verificationId, this.resendToken);
  @override
  List<Object> get props => [verificationId, resendToken!];
}

class SignInErrorState extends SignInState {
  final String errorMessage;

  const SignInErrorState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
