import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_pref_demo1/core/constants/app_keys.dart';
import 'package:shared_pref_demo1/features/profile_edit/profile_edit.dart';
import 'package:shared_pref_demo1/features/profile_save/profile_saved_from.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      decidingNavigation();
    });
  }

  void decidingNavigation() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    log('this is before is already visited ${prefs.getBool(AppKeys.isAlreadyVisited)}');
    final bool isAlreadyVisited =
        prefs.getBool(AppKeys.isAlreadyVisited) ?? false;
    log('this is already visited $isAlreadyVisited');


    if (!isAlreadyVisited) {
      Navigator.push(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
          builder: (context) => const ProfileEditForm(),
        ),
      );
    } else {
      Navigator.push(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
          builder: (context) => const ProfileSavedFrom(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FlutterLogo(
          size: 150,
        ),
      ),
    );
  }
}
