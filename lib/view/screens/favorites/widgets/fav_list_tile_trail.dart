import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:napster_project_getx/controller/controllers.dart';
import 'package:napster_project_getx/view/screens/screens.dart';

class FavListTileTrailing extends StatelessWidget {
  final dynamic currentSong;
  const FavListTileTrailing({super.key, required this.currentSong});

  @override
  Widget build(BuildContext context) {
    final FavoritesController favController = Get.put(FavoritesController());
    final HomeController homeCtr = Get.find<HomeController>();
    return PopupMenuButton<String>(
      color: Colors.white,
          icon: const Icon(
            Icons.more_vert,
            color: Colors.black,
          ),
          padding: const EdgeInsets.all(0.0),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: "Favorites",
          child: TextButton(
            onPressed: () {
              Get.back();
              Get.defaultDialog(
                title: 'Remove from Favorites',
                content: const Text('Are You Sure?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      int index = homeCtr.dbAllSongs.indexWhere(
                          (element) => element.id == currentSong.id);
                      favController.removeFromFavorites(
                          song: homeCtr.dbAllSongs[index]);
                      Get.back();
                      Get.snackbar(
                        'Favorites Songs',
                        'Removed from Favorites',
                        colorText: Colors.black,
                        duration: const Duration(milliseconds: 1500),
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.grey,
                        reverseAnimationCurve: Curves.easeOut,
                      );
                    },
                    child: const Text('Remove'),
                  ),
                ],
              );
            },
            child: Text(
              'Remove from Favorites',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
        PopupMenuItem<String>(
          value: "Playlists",
          child: AddToPlaylists(
            songIndex: homeCtr.dbAllSongs
                .indexWhere((element) => element.id == currentSong.id),
          ),
        ),
      ],
    );
  }
}
