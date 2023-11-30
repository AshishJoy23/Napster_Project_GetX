import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee_widget/marquee_widget.dart';
import 'package:napster_project_getx/controller/controllers.dart';
import 'package:napster_project_getx/view/core/cores.dart';
import 'package:napster_project_getx/view/screens/screens.dart';
import 'package:napster_project_getx/view/widgets/widgets.dart';

class MostlyListTileWidget extends StatelessWidget {
  dynamic currentSong;
  List<Audio> convertAudios;
  int index;
  MostlyListTileWidget({
    super.key,
    required this.currentSong,
    required this.convertAudios,
    required this.index,
  });

  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.withId('0');

  @override
  Widget build(BuildContext context) {
    final HomeController hController = Get.find<HomeController>();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kCardColor,
      ),
      child: ListTile(
        onTap: () {
          audioPlayer.open(Playlist(audios: convertAudios, startIndex: index),
              headPhoneStrategy: HeadPhoneStrategy.pauseOnUnplugPlayOnPlug,
              loopMode: LoopMode.playlist,
              showNotification: true);
          //setState(() {});
          showBottomSheet(
            context: context,
            builder: (ctx) {
              return MiniPlayer(
                index: hController.dbAllSongs.indexWhere(
                  (element) => element.id == currentSong.id,
                ),
              );
            },
          );
        },
        leading: ListTileLeadingWidget(
          currentSong: currentSong,
        ),
        title: Marquee(
            animationDuration: const Duration(milliseconds: 5500),
            directionMarguee: DirectionMarguee.oneDirection,
            pauseDuration: const Duration(milliseconds: 1000),
            child: Text(
              currentSong.songname!,
              style: Theme.of(context).textTheme.titleMedium,
            )),
        subtitle: currentSong.artist == '<unknown>'
            ? Text(
                'Unknown Artist',
                style: Theme.of(context).textTheme.bodyLarge,
              )
            : Text(
                currentSong.artist!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
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
              value: "Favorites",
              child: AddToFavorites(
                  index: hController.dbAllSongs
                      .indexWhere((element) => element.id == currentSong.id)),
            ),
            PopupMenuItem<String>(
              value: "Playlists",
              child: AddToPlaylists(
                  songIndex: hController.dbAllSongs
                      .indexWhere((element) => element.id == currentSong.id)),
            ),
          ],
        ),
      ),
    );
  }
}
