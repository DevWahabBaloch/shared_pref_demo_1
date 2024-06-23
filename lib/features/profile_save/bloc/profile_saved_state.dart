import 'package:flutter/material.dart';

@immutable
abstract class ProfileSavedFromState {}

class ProfileSavedFormInitialState extends ProfileSavedFromState {}

class ProfileSavedFromLoading extends ProfileSavedFromState {}

class ProfileSavedFromLoaded extends ProfileSavedFromState {
  final String name;
  final String email;
  final String password;
  final String phoneNumber;

  ProfileSavedFromLoaded(
      {required this.name,
      required this.email,
      required this.password,
      required this.phoneNumber});
}

class ProfileSavedFromFailure extends ProfileSavedFromState {
  final String message;
  ProfileSavedFromFailure({required this.message});
}
