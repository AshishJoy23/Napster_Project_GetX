import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:napster_project_getx/controller/controllers.dart';
import 'package:napster_project_getx/view/core/cores.dart';

class BottomSheetListTileWidget extends StatelessWidget {
  const BottomSheetListTileWidget({
    super.key,
    required this.songIndex,
    required this.playlistIndex,
    required this.playlstController,
    required this.hmCntrl,
  });

  final int songIndex;
  final int playlistIndex;
  final PlaylistController playlstController;
  final HomeController hmCntrl;

  @override
  Widget build(BuildContext context) {
    final widthDsp = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kCardColor,
      ),
      child: ListTile(
        onTap: (playlstController.checkSongExistsInPlaylist(
                playlistIndex, hmCntrl.dbAllSongs[songIndex]))
            ? () {
                Get.back();
                Get.snackbar(
                  'Add to Playlist',
                  'Song Already Exist in ${playlstController.allDbPlaylists[playlistIndex].playlistname}',
                  colorText: Colors.black,
                  duration: const Duration(milliseconds: 1500),
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.grey,
                  reverseAnimationCurve: Curves.easeOut,
                );
              }
            : () {
                Get.back();
                playlstController.addToPlaylist(
                    playlistIndex, hmCntrl.dbAllSongs[songIndex]);
                Get.snackbar(
                  'Add to Playlist',
                  'Song Added to ${playlstController.allDbPlaylists[playlistIndex].playlistname}',
                  colorText: Colors.black,
                  duration: const Duration(milliseconds: 1500),
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.grey,
                  reverseAnimationCurve: Curves.easeOut,
                );
              },
        leading: (playlstController
                .allDbPlaylists[playlistIndex].playlistssongs!.isEmpty)
            ? Container(
                width: widthDsp * 0.065,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/napster-icon.png')),
                ),
                //child: Icon(Icons.abc),
              )
            : QueryArtworkWidget(
                artworkFit: BoxFit.cover,
                id: playlstController
                    .allDbPlaylists[playlistIndex].playlistssongs!.first.id!,
                type: ArtworkType.AUDIO,
                artworkQuality: FilterQuality.high,
                size: 2000,
                quality: 100,
                artworkBorder: BorderRadius.circular(10),
                nullArtworkWidget: Container(
                  width: widthDsp * 0.065,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/napster-icon.png')),
                  ),
                  //child: Icon(Icons.abc),
                ),
              ),
        title: Text(
          playlstController.allDbPlaylists[playlistIndex].playlistname!,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(
          (playlstController
                      .allDbPlaylists[playlistIndex].playlistssongs!.length <=
                  1)
              ? '${playlstController.allDbPlaylists[playlistIndex].playlistssongs!.length.toString()} Song'
              : '${playlstController.allDbPlaylists[playlistIndex].playlistssongs!.length.toString()} Songs',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        trailing: const CircleAvatar(
          backgroundColor: kSecondaryColor,
          child: Icon(
            Icons.add_circle,
            size: 24,
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
