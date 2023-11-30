import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:napster_project_getx/controller/controllers.dart';
import 'package:napster_project_getx/model/database/db_all_models.dart';
import 'package:napster_project_getx/model/db_functions.dart';
import 'package:napster_project_getx/view/core/cores.dart';
import 'package:napster_project_getx/view/screens/screens.dart';
import 'package:napster_project_getx/view/widgets/widgets.dart';

class ScreenRecently extends StatefulWidget {
  const ScreenRecently({super.key});

  @override
  State<ScreenRecently> createState() => _ScreenRecentlyState();
}

class _ScreenRecentlyState extends State<ScreenRecently> {
  String selectedItem = "Favorites";
  late int currentIndex;
  final box = AllSongsBox.getInstance();
  late List<AllSongs> allDbSongs;
  List<Audio> convertRSongs = [];
  List<RecentlyPlayed> recentlyDbSongs = [];
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.withId("0");

  @override
  void initState() {
    allDbSongs = box.values.toList();
    recentlyDbSongs = recentlyPlayedBox.values.toList().reversed.toList();
    for (var element in recentlyDbSongs) {
      convertRSongs.add(Audio.file(element.songuri!,
          metas: Metas(
              artist: element.artist,
              title: element.songname,
              id: element.id.toString())));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final RecentlyController rController = Get.put(RecentlyController());
    final height1 = MediaQuery.of(context).size.height;
    final width1 = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: CustomAppbarWidget(
        title: 'Recently Played',
        isLeading: true,
        actionsList: [
          InkWell(
            onTap: () {
              Utils.showAlertDialogBox(
                  context,
                  'Clear All Songs',
                  'Are you sure, you want to clear all your recently played songs?',
                  'Clear', () {
                rController.clearRecentlyPlayedSongs();
                Get.back();
                Utils.showSnackBar(
                    'Recently Played Songs', 'Cleared Your Songs',);
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
      // appBar: AppBar(
      //     actions: [
      //       IconButton(
      //         onPressed: () {
      //           Get.to(() => const ScreenSearch());
      //         },
      //         icon: const Icon(Icons.search_sharp,
      //             size: 28, color: Color.fromARGB(255, 152, 248, 72)),
      //       ),
      //       SizedBox(
      //         width: width1 * 0.01,
      //       ),
      //       IconButton(
      //           onPressed: () {
      //             Get.defaultDialog(
      //               title: 'Clear Your Recently Played Songs',
      //               content: const Text('Are You Sure?'),
      //               actions: [
      //                 TextButton(
      //                   onPressed: () {
      //                     Get.back();
      //                   },
      //                   child: const Text('Cancel'),
      //                 ),
      //                 ElevatedButton(
      //                   onPressed: () {
      //                     rController.clearRecentlyPlayedSongs();
      //                     Get.back();
      //                     Get.snackbar(
      //                       'Recently Played Songs',
      //                       'Cleared Your Songs',
      //                       colorText: Colors.black,
      //                       duration: const Duration(milliseconds: 1500),
      //                       snackPosition: SnackPosition.BOTTOM,
      //                       backgroundColor: Colors.grey,
      //                       reverseAnimationCurve: Curves.easeOut,
      //                     );
      //                   },
      //                   child: const Text('Clear'),
      //                 ),
      //               ],
      //             );
      //           },
      //           icon: const Icon(Icons.clear_all_sharp, size: 28)),
      //       SizedBox(
      //         width: width1 * 0.02,
      //       ),
      //     ],
      //     leading: IconButton(
      //         onPressed: () {
      //           //Navigator.pop(context);
      //           Get.back();
      //         },
      //         icon: const Icon(
      //           Icons.arrow_back_ios,
      //           size: 28,
      //         )),
      //     title: const Text(
      //       'Recently Played',
      //       style: TextStyle(
      //         fontSize: 24,
      //         fontFamily: 'Poppins',
      //         color: Color.fromARGB(255, 152, 248, 72),
      //       ),
      //     )),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(10),
          child: (rController.recentlyDbSongs.isEmpty)
              ? const EmptyListScreenWidget(
                  message:
                      "You haven't played anything ! \nPlay What You Love..")
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: rController.recentlyDbSongs.length,
                  itemBuilder: (context, index) {
                    if (index == rController.recentlyDbSongs.length) {
                      return SizedBox(
                        height: height1 * 0.08,
                      );
                    }
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: height1 * 0.005),
                      child: RecentlyListTileWidget(
                        currentSong: rController.recentlyDbSongs[index],
                        convertAudios: rController.convertRecentlyAudios,
                        index: index,
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
