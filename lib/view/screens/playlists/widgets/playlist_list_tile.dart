import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:napster_project_getx/controller/controllers.dart';
import 'package:napster_project_getx/model/database/db_all_models.dart';
import 'package:napster_project_getx/view/core/cores.dart';
import 'package:napster_project_getx/view/screens/screens.dart';
import 'package:napster_project_getx/view/widgets/widgets.dart';

class PlaylistListTileWidget extends StatelessWidget {
  const PlaylistListTileWidget({
    super.key,
    required this.index,
    required this.currentPlaylist,
    required this.tileController,
  });
  final int index;
  final Playlists currentPlaylist;
  final PlaylistController tileController;

  @override
  Widget build(BuildContext context) {
    final widthDsp = MediaQuery.of(context).size.height;
    return Obx(() => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: kCardColor,
          ),
          child: ListTile(
            onTap: () {
              tileController.currentPlaylistSongs.value =
                  tileController.allDbPlaylists[index].playlistssongs!;
              tileController.convertPlaylistSongs(index);
              Get.to(
                () => EachPlaylistSongs(
                  currentPlaylist: currentPlaylist,
                  playlistIndex: index,
                  currentPlaylistSongs:
                      tileController.currentPlaylistSongs.value,
                ),
              );
            },
            leading: (tileController
                    .allDbPlaylists[index].playlistssongs!.isEmpty)
                ? Container(
                    width: widthDsp * 0.065,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/napster-icon.png')),
                    ),
                  )
                : ListTileLeadingWidget(
                    currentSong: tileController
                        .allDbPlaylists[index].playlistssongs!.first),
            title: Text(
              currentPlaylist.playlistname!,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            subtitle: Text(
              (currentPlaylist.playlistssongs!.length <= 1)
                  ? '${currentPlaylist.playlistssongs!.length.toString()} Song'
                  : '${currentPlaylist.playlistssongs!.length.toString()} Songs',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            trailing: PopupMenuButton<String>(
              color: Colors.white,
              icon: const Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
              padding: const EdgeInsets.all(0.0),
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: "Delete",
                  child: PlaylistDeleteButtonWidget(
                    index: index,
                    currentPlaylist: currentPlaylist,
                    btnController: tileController,
                  ),
                ),
                PopupMenuItem<String>(
                  value: "Rename",
                  child: PlaylistRenameButtonWidget(
                    index: index,
                    currentPlaylist: currentPlaylist,
                    btnController: tileController,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
