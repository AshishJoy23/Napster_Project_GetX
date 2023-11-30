// ignore_for_file: prefer_const_literals_to_create_immutables
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:napster_project_getx/controller/controllers.dart';
import 'package:napster_project_getx/model/db_functions.dart';
import 'package:napster_project_getx/view/core/cores.dart';
import 'package:napster_project_getx/view/screens/screens.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  final HomeController homeController = Get.put(HomeController());
  @override
  void initState() {
    log('fetching');
    // requestPermission();
    goToMyApp();
    homeController.fetchAllSongs();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // ignore: todo
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: kPrimaryColor,
                child: Text(
                  'N',
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                      color: kSecondaryColor,
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Text(
                'APSTER',
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> goToMyApp() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.off(() => MyMusicApp());
  }
}
