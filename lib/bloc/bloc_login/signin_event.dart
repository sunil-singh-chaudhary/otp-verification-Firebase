import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SignInEvent extends Equatable {
  String get phoneNumber;
}

class LoginInSubmittedEvent extends SignInEvent {
  @override
  final String phoneNumber;
  final BuildContext context;

  LoginInSubmittedEvent(this.phoneNumber, this.context);
  @override
  List<Object> get props => [phoneNumber, context];
}
