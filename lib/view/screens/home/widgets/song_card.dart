import 'dart:developer';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee_widget/marquee_widget.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:napster_project_getx/controller/controllers.dart';
import 'package:napster_project_getx/model/database/db_all_models.dart';
import 'package:napster_project_getx/view/core/cores.dart';
import 'package:napster_project_getx/view/screens/screens.dart';
import 'package:napster_project_getx/view/widgets/widgets.dart';

class CarouselCardWidget extends StatelessWidget {
  const CarouselCardWidget({
    super.key,
    required this.index,
    required this.currentSong,
    required this.srController,
  });
  final int index;
  final RecentSearches currentSong;
  final SearchController srController;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final RecentlyController recentlyCtrlr = Get.put(RecentlyController());
    final MostlyController mostlyCtrlr = Get.put(MostlyController());
    AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.withId('0');
    final HomeController hmController = Get.find<HomeController>();
    RecentlyPlayed recentlySong;
    MostlyPlayed mostlySong;
    return Padding(
      padding: EdgeInsets.only(right: size.width * 0.02),
      child: InkWell(
        onTap: () {
          log(currentSong.songname!);
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
                  audios: srController.convertSearchedAudios.toList(),
                  startIndex: index),
              showNotification: true,
              headPhoneStrategy: HeadPhoneStrategy.pauseOnUnplugPlayOnPlug,
              loopMode: LoopMode.playlist);
          showBottomSheet(
            context: context,
            builder: (ctx) {
              return MiniPlayer(
                index: hmController.dbAllSongs.indexWhere(
                  (element) => element.id == currentSong.id,
                ),
              );
            },
          );
        },
        child: Container(
          width: size.width * 0.35,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Stack(
            children: [
              QueryArtworkWidget(
                artworkFit: BoxFit.cover,
                id: currentSong.id!,
                type: ArtworkType.AUDIO,
                artworkQuality: FilterQuality.high,
                artworkWidth: size.width,
                artworkHeight: size.height,
                //size: 2000,
                quality: 100,
                artworkBorder: BorderRadius.circular(10),
                nullArtworkWidget: Container(
                  height: size.height,
                  width: size.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/napster-icon.png')),
                  ),
                  //child: Icon(Icons.abc),
                ),
              ),
              Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        PopupMenuButton<String>(
                          color: Colors.white,
                          padding: const EdgeInsets.all(0.0),
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<String>>[
                            PopupMenuItem<String>(
                              value: "Favorites",
                              child: AddToFavorites(
                                index: hmController.dbAllSongs.indexWhere(
                                  (element) => element.id == currentSong.id,
                                ),
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: "Playlists",
                              child: AddToPlaylists(
                                songIndex: hmController.dbAllSongs.indexWhere(
                                  (element) => element.id == currentSong.id,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Marquee(
                        animationDuration: const Duration(milliseconds: 5500),
                        directionMarguee: DirectionMarguee.oneDirection,
                        pauseDuration: const Duration(milliseconds: 1000),
                        child: Text(
                          currentSong.songname!,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        )),
                    currentSong.artist == '<unknown>'
                        ? const Text(
                            'Unknown Artist',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          )
                        : Marquee(
                            animationDuration:
                                const Duration(milliseconds: 5500),
                            directionMarguee: DirectionMarguee.oneDirection,
                            pauseDuration: const Duration(milliseconds: 1000),
                            child: Text(
                              currentSong.artist!,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                            )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
