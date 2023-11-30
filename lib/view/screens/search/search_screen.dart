import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:napster_project_getx/controller/controllers.dart';
import 'package:napster_project_getx/view/core/cores.dart';
import 'package:napster_project_getx/view/screens/screens.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  // bool isSearched = false;
  @override
  Widget build(BuildContext context) {
    final SearchController sController = Get.put(SearchController());
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0.0,
        backgroundColor: kNavbarColor,
        centerTitle: true,
        title: const SearchAppbarWidget(),
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(8),
          child: (sController.isSearched.value)
              ? const SearchingScreenWidget()
              : const ScreenAllSongs(),
        ),
      ),
    );
  }
}

