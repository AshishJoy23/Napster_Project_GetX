import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:napster_project_getx/controller/controllers.dart';
import 'package:napster_project_getx/model/database/db_all_models.dart';
import 'package:napster_project_getx/view/core/cores.dart';
import 'package:napster_project_getx/view/screens/screens.dart';
import 'package:napster_project_getx/view/widgets/widgets.dart';

class SongCarouselWidget extends StatelessWidget {
  final SearchController searchedController;
  const SongCarouselWidget({
    super.key,
    required this.searchedController,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        CustomTitleWidget(
          title: 'Recent Searches',
          isButton: true,
          onTap: () {
            Utils.showAlertDialogBox(
                context,
                'Clear Your Recent Searches',
                'Are you sure, do you want to clear your recent searches?',
                'Clear', () {
              searchedController.clearSearchedSongs();
              Get.back();
              Utils.showSnackBar(
                  'Recent Searches', 'Cleared your recent searches');
            });
          },
        ),
        SizedBox(
          height: size.height * 0.2,
          width: size.width,
          child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.012),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: searchedController.searchedSongs.length,
              itemBuilder: (context, index) {
                RecentSearches currentSong =
                    searchedController.searchedSongs[index];
                return CarouselCardWidget(
                    index: index,
                    currentSong: currentSong,
                    srController: searchedController);
              }),
        ),
      ],
    );
  }
}
