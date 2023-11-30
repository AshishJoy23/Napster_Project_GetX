import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:napster_project_getx/controller/controllers.dart';
import 'package:napster_project_getx/model/database/db_all_models.dart';
import 'package:napster_project_getx/view/screens/screens.dart';
import 'package:napster_project_getx/view/widgets/widgets.dart';

class SearchingScreenWidget extends StatelessWidget {
  const SearchingScreenWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final SearchController searchingController = Get.put(SearchController());
    final heightScrn = MediaQuery.of(context).size.height;
    return Obx(
      () => Column(
        children: [
          Expanded(
            child: (searchingController.suggestionSongs.isEmpty)
                ? const EmptyListScreenWidget(
                    imageUrl: 'assets/images/search_not_found.png',
                    message:
                        "Ooops no matches found! \nSearch Other Song You Want..",
                  )
                : ListView.builder(
                    itemCount: searchingController.suggestionSongs.length + 1,
                    itemBuilder: ((context, index) {
                      AllSongs? currentSong;
                      if (index != searchingController.suggestionSongs.length) {
                        currentSong =
                            searchingController.suggestionSongs[index];
                      }
                      return (index ==
                              searchingController.suggestionSongs.length)
                          ? SizedBox(
                              height: heightScrn * 0.08,
                            )
                          : Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: heightScrn * 0.005),
                              child: SearchingListTileWidget(
                                index: index,
                                currentSong: currentSong,
                              ),
                            );
                    }),
                  ),
          ),
        ],
      ),
    );
  }
}
