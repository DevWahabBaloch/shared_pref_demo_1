import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_pref_demo1/core/constants/app_keys.dart';
import 'package:shared_pref_demo1/core/di/service_locator.dart';
import 'package:shared_pref_demo1/features/profile_save/bloc/profile_saved_cubit.dart';
import 'package:shared_pref_demo1/features/profile_save/bloc/profile_saved_state.dart';

class ProfileSavedFrom extends StatefulWidget {
  const ProfileSavedFrom({super.key});

  @override
  State<ProfileSavedFrom> createState() => _ProfileSavedFromState();
}

class _ProfileSavedFromState extends State<ProfileSavedFrom> {

  final ProfileSavedFormCubit _profileSavedFormCubit =
      getIt<ProfileSavedFormCubit>();

  @override
  void initState() {
    super.initState();
    _profileSavedFormCubit.getData();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileSavedFormCubit, ProfileSavedFromState>(
        bloc: _profileSavedFormCubit,
        builder: (context, state) {
          if (state is ProfileSavedFromLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProfileSavedFromLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      AppKeys.name,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      state.name,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      AppKeys.password,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      state.password,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      AppKeys.email,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      state.phoneNumber,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      AppKeys.phoneNumber,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      state.email,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            );
          }
          if (state is ProfileSavedFromFailure) {
            return Text(
              state.message,
              style: const TextStyle(color: Colors.red),
            );
          }
          return Container();
        },
      ),
    );
  }
}
