import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee_widget/marquee_widget.dart';
import 'package:napster_project_getx/controller/controllers.dart';
import 'package:napster_project_getx/model/database/db_all_models.dart';
import 'package:napster_project_getx/view/core/cores.dart';
import 'package:napster_project_getx/view/screens/screens.dart';
import 'package:napster_project_getx/view/widgets/widgets.dart';

class FavoriteListTile extends StatelessWidget {
  final dynamic currentSong;
  final List<Audio> convertAudios;
  final int index;
  const FavoriteListTile({
    super.key,
    required this.currentSong,
    required this.convertAudios,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final HomeController home = Get.find<HomeController>();
    final RecentlyController recentlyCtrlr = Get.put(RecentlyController());
    final MostlyController mostlyCtrlr = Get.put(MostlyController());
    AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.withId('0');
    //final height1 = MediaQuery.of(context).size.height;
    RecentlyPlayed recentlySong;
    MostlyPlayed mostlySong;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kCardColor,
      ),
      child: ListTile(
        onTap: () {
          recentlySong = RecentlyPlayed(
              songname: currentSong.songname,
              artist: currentSong.artist,
              duration: currentSong.duration,
              songuri: currentSong.songuri,
              id: currentSong.id);
          mostlySong = MostlyPlayed(
              songname: currentSong.songname!,
              songuri: currentSong.songuri,
              duration: currentSong.duration,
              artist: currentSong.artist,
              count: 1,
              id: currentSong.id);
          recentlyCtrlr.updateRecentlyPlayedSongs(recentlySong);
          mostlyCtrlr.updateMostlyPlayedSongs(mostlySong);
          audioPlayer.open(
              Playlist(
                  audios: convertAudios.reversed.toList(), startIndex: index),
              showNotification: true,
              headPhoneStrategy: HeadPhoneStrategy.pauseOnUnplugPlayOnPlug,
              loopMode: LoopMode.playlist);
          showBottomSheet(
            context: context,
            builder: (ctx) {
              return MiniPlayer(
                index: home.dbAllSongs.indexWhere(
                  (element) => element.id == currentSong.id,
                ),
              );
            },
          );
        },
        leading: ListTileLeadingWidget(currentSong: currentSong),
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
        trailing: FavListTileTrailing(
          currentSong: currentSong,
        ),
      ),
    );
  }
}
