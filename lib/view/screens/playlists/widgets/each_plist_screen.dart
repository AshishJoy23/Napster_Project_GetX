import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:napster_project_getx/model/database/db_all_models.dart';
import 'package:napster_project_getx/view/screens/screens.dart';

class EachPlaylistScreenWidget extends StatelessWidget {
  const EachPlaylistScreenWidget({
    super.key,
    required this.currentPlaylist,
    required this.playlistIndex,
    required this.currentPlaylistSongs,
  });

  final Playlists currentPlaylist;
  final int playlistIndex;
  final List<AllSongs> currentPlaylistSongs;

  @override
  Widget build(BuildContext context) {
    final height1 = MediaQuery.of(context).size.height;
    return Obx(() => Column(
          children: [
            PlaylistFirstSongImageWidget(
              currentPlaylistSongs: currentPlaylistSongs,
            ),
            ListView.builder(
              padding: const EdgeInsets.all(10),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: currentPlaylistSongs.length+1,
              itemBuilder: (context, index) {
                late AllSongs currentSong;
                if (index != currentPlaylistSongs.length) {
                  currentSong = currentPlaylistSongs[index];
                }
                return (index == currentPlaylistSongs.length)
                    ? SizedBox(
                        height: height1 * 0.08,
                      )
                    : Padding(
                      padding: EdgeInsets.symmetric(vertical: height1 * 0.005),
                      child: EachPlaylistListTileWidget(
                          index: index,
                          playlistIndex: playlistIndex,
                          currentSong: currentSong,
                          currentPlaylist: currentPlaylist,
                        ),
                    );
              },
            ),
          ],
        ));
  }
}
