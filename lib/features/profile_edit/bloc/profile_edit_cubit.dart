import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_pref_demo1/core/constants/app_keys.dart';
import 'package:shared_pref_demo1/features/profile_edit/bloc/profile_edit_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class ProfileEditCubit extends Cubit<ProfileEditState> {
  ProfileEditCubit() : super(ProfileEditInitialState());

  void attemptToSaveData(
      {required String name,
      required String password,
      required String phone,
      required String email}) async {
    try {
      emit(ProfileEditLoadingState());
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('name', name);
      prefs.setString('password', password);
      prefs.setString('phone', phone);
      prefs.setString('email', email);
      prefs.setBool(AppKeys.isAlreadyVisited, true);
      Future.delayed(const Duration(seconds: 2), () {
        emit(ProfileEditSuccessState(message: 'Data saved successfully!'));
      });
    } on Exception catch (e) {
      emit(ProfileEditFailureState(error: e.toString()));
    }
  }
}
