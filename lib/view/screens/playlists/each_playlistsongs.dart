import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:napster_project_getx/controller/controllers.dart';
import 'package:napster_project_getx/model/database/db_all_models.dart';
import 'package:napster_project_getx/view/core/cores.dart';
import 'package:napster_project_getx/view/screens/screens.dart';
import 'package:napster_project_getx/view/widgets/widgets.dart';

class EachPlaylistSongs extends StatelessWidget {
  final Playlists currentPlaylist;
  final int playlistIndex;
  final List<AllSongs> currentPlaylistSongs;
  const EachPlaylistSongs({
    super.key,
    required this.currentPlaylist,
    required this.playlistIndex,
    required this.currentPlaylistSongs,
  });

  @override
  Widget build(BuildContext context) {
    final PlaylistController plstController = Get.put(PlaylistController());
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: CustomAppbarWidget(
        title: '${currentPlaylist.playlistname}',
        isLeading: true,
      ),
      body: Obx(
        () => (plstController
                .allDbPlaylists[playlistIndex].playlistssongs!.isEmpty)
            ? const EmptyListScreenWidget(
                message: "You haven't added anything ! \nAdd What You Love..",
              )
            : SingleChildScrollView(
                child: EachPlaylistScreenWidget(
                  currentPlaylist: currentPlaylist,
                  playlistIndex: playlistIndex,
                  currentPlaylistSongs: plstController.currentPlaylistSongs,
                ),
              ),
      ),
    );
  }
}
