import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:napster_project_getx/view/screens/screens.dart';

class AppController extends GetxController {
  var selectedIndex = 0.obs;
  var isRepeat = false.obs;
  var isShuffle = false.obs;
  
  void changeSelectedIndex(int index) {
    selectedIndex.value = index;
  }
  
  final screens = <Widget>[
    const ScreenHome(),
    const ScreenSearch(),
    const ScreenLibrary(),
    const ScreenSettings(),
  ];
}