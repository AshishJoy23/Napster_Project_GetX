import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:napster_project_getx/controller/controllers.dart';
import 'package:napster_project_getx/model/database/db_all_models.dart';
import 'package:napster_project_getx/view/core/cores.dart';

class MyMusicApp extends StatelessWidget {
  MyMusicApp({super.key});
  int? currentIndex;
  int? totalLength;
  AllSongs? currentSong;

  @override
  Widget build(BuildContext context) {
    final AppController appController = Get.put(AppController());
    final size = MediaQuery.of(context).size;
    return Obx(
      () => SafeArea(
        top: false,
        child: Container(
          color: kNavbarColor,
          child: Scaffold(
            //extendBody: true,
            body: appController.screens[appController.selectedIndex.value],
            bottomNavigationBar: Container(
              padding: EdgeInsets.symmetric(horizontal: size.width*0.04,vertical: size.width*0.01,),
              color: kNavbarColor,
              child: GNav(
                  duration: const Duration(milliseconds: 300),
                  color: kNavbarColor,
                  backgroundColor: kNavbarColor,
                  activeColor: kNavbarColor,
                  tabBackgroundColor: kPrimaryColor,
                  padding: EdgeInsets.all(size.width * 0.03),
                  curve: Curves.easeInCirc,
                  iconSize: 24,
                  onTabChange: (index) {
                    appController.changeSelectedIndex(index);
                  },
                  tabs: const [
                    GButton(
                      icon: Icons.home,
                      iconColor: kPrimaryColor,
                    ),
                    GButton(
                      icon: CupertinoIcons.search,
                      iconColor: kPrimaryColor,
                    ),
                    GButton(
                      icon: Icons.library_music,
                      iconColor: kPrimaryColor,
                    ),
                    GButton(
                      icon: CupertinoIcons.settings,
                      iconColor: kPrimaryColor,
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }


}
