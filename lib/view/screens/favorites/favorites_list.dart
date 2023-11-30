import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:napster_project_getx/controller/controllers.dart';
import 'package:napster_project_getx/model/database/db_all_models.dart';
import 'package:napster_project_getx/view/core/cores.dart';
import 'package:napster_project_getx/view/screens/screens.dart';
import 'package:napster_project_getx/view/widgets/widgets.dart';

class ScreenFavorites extends StatelessWidget {
  const ScreenFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    final FavoritesController fController = Get.put(FavoritesController());

    final height1 = MediaQuery.of(context).size.height;
    final width1 = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: CustomAppbarWidget(
        title: 'Favorites',
        isLeading: true,
        actionsList: [
          InkWell(
            onTap: () {
              Utils.showAlertDialogBox(
                  context,
                  'Clear All Songs',
                  'Are you sure, you want to clear all your favorite songs?',
                  'Clear', () {
                fController.clearFavoritesSongs();
                Get.back();
                Utils.showSnackBar(
                  'Favorite Songs',
                  'Cleared Your Songs',
                );
              });
            },
            child: const CircleAvatar(
              backgroundColor: kCardColor,
              child: Icon(
                Icons.clear_all_sharp,
                size: 24,
                color: kPrimaryColor,
              ),
            ),
          ),
          SizedBox(
            width: width1 * 0.02,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Obx(
          () => (fController.favDbSongs.isEmpty)
              ? const EmptyListScreenWidget(
                  message: "You haven't added anything ! \nAdd What You Love..")
              : Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: fController.favDbSongs.length + 1,
                    itemBuilder: (context, index) {
                      List<Favorites> favoriteList =
                          fController.favDbSongs.toList().reversed.toList();
                      if (index == fController.favDbSongs.length) {
                        return SizedBox(
                          height: height1 * 0.08,
                        );
                      }
                      Favorites currentSong = favoriteList[index];
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: height1 * 0.005),
                        child: FavoriteListTile(
                          currentSong: currentSong,
                          convertAudios: fController.convertFavAudios,
                          index: index,
                        ),
                      );
                    },
                  ),
                ),
        ),
      ),
    );
  }
}
