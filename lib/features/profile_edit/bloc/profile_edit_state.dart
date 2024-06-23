import 'package:flutter/material.dart';

@immutable
abstract class ProfileEditState {}

class ProfileEditInitialState extends ProfileEditState {}

class ProfileEditLoadingState extends ProfileEditState {}

class ProfileEditSuccessState extends ProfileEditState {
  final String message;
  ProfileEditSuccessState({required this.message});
}

class ProfileEditFailureState extends ProfileEditState {
  final String error;
  ProfileEditFailureState({required this.error});
}
