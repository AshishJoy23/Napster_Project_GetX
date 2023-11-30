import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:napster_project_getx/controller/controllers.dart';
import 'package:napster_project_getx/view/core/cores.dart';
import 'package:napster_project_getx/view/screens/screens.dart';

class AddPlstFromNow extends StatelessWidget {
  int songIndex;
  AddPlstFromNow({super.key, required this.songIndex});

  @override
  Widget build(BuildContext context) {
    final PlaylistController playlstController = Get.put(PlaylistController());
    final HomeController hmCntrl = Get.find<HomeController>();
    return InkWell(
      onTap: (playlstController.allDbPlaylists.isEmpty)
          ? () {
              // Get.back();
              Get.bottomSheet(
                CreatePlaylist(currentIndex: songIndex),
              );
            }
          : () {
              Get.bottomSheet(
                DraggableScrollableSheet(
                  initialChildSize: 0.7,
                  maxChildSize: 0.7,
                  minChildSize: 0.1,
                  builder: (context, controller) {
                    return Container(
                      color: kNavbarColor,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              CreatePlaylist(currentIndex: songIndex),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount:
                                    playlstController.allDbPlaylists.length,
                                physics: const NeverScrollableScrollPhysics(),
                                controller: controller, // set this too
                                itemBuilder: (context, index) =>
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                                      child: BottomSheetListTileWidget(
                                                                      songIndex: songIndex,
                                                                      playlistIndex: index,
                                                                      playlstController: playlstController,
                                                                      hmCntrl: hmCntrl,
                                                                    ),
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
              // Get.back();
              // Get.bottomSheet(
              //   DraggableScrollableSheet(
              //     initialChildSize: 0.7,
              //     maxChildSize: 0.7,
              //     minChildSize: 0.1,
              //     builder: (context, controller) {
              //       return Container(
              //         color: const Color.fromARGB(255, 14, 17, 42),
              //         child: Padding(
              //           padding: const EdgeInsets.all(10.0),
              //           child: SingleChildScrollView(
              //             child: Column(
              //               children: [
              //                 CreatePlaylist(currentIndex: songIndex),
              //                 ListView.builder(
              //                   shrinkWrap: true,
              //                   itemCount:
              //                       playlstController.allDbPlaylists.length,
              //                   physics: const NeverScrollableScrollPhysics(),
              //                   controller: controller, // set this too
              //                   itemBuilder: (context, index) =>
              //                       BottomSheetListTileWidget(
              //                     songIndex: songIndex,
              //                     playlistIndex: index,
              //                     playlstController: playlstController,
              //                     hmCntrl: hmCntrl,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // );
            },
      child: const CircleAvatar(
        backgroundColor: Colors.transparent,
        child: Icon(
          Icons.playlist_add,
          color: kNavbarColor,
          size: 24,
        ),
      ),
    );
  }
}
