import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_pref_demo1/core/constants/app_keys.dart';
import 'package:shared_pref_demo1/core/di/service_locator.dart';
import 'package:shared_pref_demo1/core/widgets/app_button.dart';
import 'package:shared_pref_demo1/features/profile_edit/bloc/profile_edit_cubit.dart';
import 'package:shared_pref_demo1/features/profile_edit/bloc/profile_edit_state.dart';
import 'package:shared_pref_demo1/features/profile_save/profile_saved_from.dart';
import 'package:shared_pref_demo1/features/widget/app_text_field.dart';

class ProfileEditForm extends StatefulWidget {
  const ProfileEditForm({super.key});

  @override
  State<ProfileEditForm> createState() => _ProfileEditFormState();
}

class _ProfileEditFormState extends State<ProfileEditForm> {
  final ProfileEditCubit _profileEditCubit = getIt<ProfileEditCubit>();

  final nameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final phoneTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppTextField(
            type: TextInputType.name,
            hint: AppKeys.nameHint,
            textEditingController: nameTextController,
            inputAction: TextInputAction.next,
          ),
          const SizedBox(height: 25),
          AppTextField.password(
            hint: AppKeys.passwordHint,
            type: TextInputType.visiblePassword,
            textEditingController: passwordTextController,
            inputAction: TextInputAction.next,
          ),
          const SizedBox(height: 25),
          AppTextField(
            type: TextInputType.phone,
            hint: AppKeys.phoneNumberHint,
            textEditingController: phoneTextController,
            inputAction: TextInputAction.next,
          ),
          const SizedBox(height: 25),
          AppTextField(
            type: TextInputType.emailAddress,
            hint: AppKeys.emailHint,
            textEditingController: emailTextController,
            inputAction: TextInputAction.next,
          ),
          const SizedBox(height: 50),
          BlocConsumer<ProfileEditCubit, ProfileEditState>(
            bloc: _profileEditCubit,
            listener: (context, state) {
              if (state is ProfileEditSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                  ),
                );
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileSavedFrom(),
                    ));
              }

              if (state is ProfileEditFailureState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                  ),
                );
              }
            },
            builder: (context, state) {
              return AppButton(
                isProcessing: state is ProfileEditLoadingState,
                title: 'Save Data',
                onPressed: () => _attemptToSaveData(context),
              );
            },
          ),
        ],
      ),
    );
  }

  void _attemptToSaveData(BuildContext context) {
    FocusManager.instance.primaryFocus!.unfocus();
    if (nameTextController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(AppKeys.nameInputChecker),
        ),
      );
    } else if (passwordTextController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(AppKeys.passwordInputChecker),
        ),
      );
    } else if (phoneTextController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(AppKeys.phoneNumberInputChecker),
        ),
      );
    } else if (emailTextController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(AppKeys.emailInputChecker),
        ),
      );
    } else if (!emailTextController.text.contains("@")) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(AppKeys.wrongEmailFormat),
        ),
      );
    } else {
      _profileEditCubit.attemptToSaveData(
        name: nameTextController.text,
        password: passwordTextController.text,
        phone: phoneTextController.text,
        email: emailTextController.text,
      );
    }
  }
}
