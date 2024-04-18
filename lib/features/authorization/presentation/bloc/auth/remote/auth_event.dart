part of 'auth_bloc.dart';

abstract class AuthEvent {}

class GetAuth extends AuthEvent {
  String login;
  String pass;

  GetAuth({
    required this.login,
    required this.pass,
  });
}

class AuthMsgErr extends AuthEvent {
  final String msg;

  AuthMsgErr(this.msg);
}
