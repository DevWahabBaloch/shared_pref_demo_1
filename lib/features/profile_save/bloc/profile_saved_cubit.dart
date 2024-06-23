import 'package:injectable/injectable.dart';
import 'package:shared_pref_demo1/features/profile_save/bloc/profile_saved_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class ProfileSavedFormCubit extends Cubit<ProfileSavedFromState> {
  ProfileSavedFormCubit() : super(ProfileSavedFormInitialState());

  void getData() async {
    emit(ProfileSavedFromLoading());
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String name = prefs.getString('name') ?? '';
      String password = prefs.getString('password') ?? '';
      String email = prefs.getString('email') ?? '';
      String phone = prefs.getString('phone') ?? '';
      emit(ProfileSavedFromLoaded(
          name: name, email: email, password: password, phoneNumber: phone));
    } on Exception catch (e) {
      emit(ProfileSavedFromFailure(message: e.toString()));
    }
  }
}
