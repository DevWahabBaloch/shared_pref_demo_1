import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_pref_demo1/core/di/service_locator.dart';
import 'package:shared_pref_demo1/features/profile_edit/bloc/profile_edit_cubit.dart';
import 'package:shared_pref_demo1/features/profile_save/bloc/profile_saved_cubit.dart';
import 'package:shared_pref_demo1/features/welcome/welcome_page.dart';

void main() async {
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfileSavedFormCubit>(
          create: (_) => getIt<ProfileSavedFormCubit>(),
        ),
        BlocProvider<ProfileEditCubit>(
          create: (_) => getIt<ProfileEditCubit>(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WelcomePage(),
      ),
    );
  }
}
