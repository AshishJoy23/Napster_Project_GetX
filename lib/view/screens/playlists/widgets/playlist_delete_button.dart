import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:napster_project_getx/controller/controllers.dart';
import 'package:napster_project_getx/model/database/db_all_models.dart';
import 'package:napster_project_getx/view/core/cores.dart';

class PlaylistDeleteButtonWidget extends StatelessWidget {
  const PlaylistDeleteButtonWidget({
    super.key,
    required this.index,
    required this.currentPlaylist,
    required this.btnController,
  });
  final int index;
  final Playlists currentPlaylist;
  final PlaylistController btnController;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Get.back();
        Utils.showAlertDialogBox(
          context,
          'Delete ${currentPlaylist.playlistname} Playlist',
          'Are you sure, do you want to delete this playlist?',
          'Okay',
          () {
            btnController.deletePlaylist(index);
            Get.back();
            Utils.showSnackBar('${currentPlaylist.playlistname} Playlist', 'Playlist Deleted');
            
          },
        );
      },
      child: Text(
        'Delete',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
