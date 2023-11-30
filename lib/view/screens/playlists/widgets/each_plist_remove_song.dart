import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:napster_project_getx/controller/controllers.dart';
import 'package:napster_project_getx/model/database/db_all_models.dart';
import 'package:napster_project_getx/view/core/cores.dart';

class PlaylistRemoveButtonWidget extends StatelessWidget {
  const PlaylistRemoveButtonWidget({
    super.key,
    required this.songIndex,
    required this.playlistIndex,
    required this.currentPlaylist,
    required this.eachPlistListCntrl,
  });

  final int songIndex;
  final int playlistIndex;
  final Playlists currentPlaylist;
  final PlaylistController eachPlistListCntrl;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Get.back();
        Utils.showAlertDialogBox(
            context,
            'Remove from ${currentPlaylist.playlistname} Playlist',
            'Are you sure, you want to remove this song?',
            'Okay', () {
          eachPlistListCntrl.removeFromPlaylist(songIndex, playlistIndex);
          Get.back();
          Utils.showSnackBar('Remove Song',
              'Removed from ${currentPlaylist.playlistname} playlist');
        });
      },
      child: Text(
        'Remove Song',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
