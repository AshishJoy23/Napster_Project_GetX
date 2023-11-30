import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee_widget/marquee_widget.dart';
import 'package:napster_project_getx/controller/controllers.dart';
import 'package:napster_project_getx/model/database/db_all_models.dart';
import 'package:napster_project_getx/view/core/cores.dart';
import 'package:napster_project_getx/view/screens/screens.dart';
import 'package:napster_project_getx/view/widgets/widgets.dart';

class SearchingListTileWidget extends StatelessWidget {
  const SearchingListTileWidget({
    super.key,
    required this.index,
    required this.currentSong,
  });

  final int index;
  final dynamic currentSong;

  @override
  Widget build(BuildContext context) {
    final SearchController searchingCtrl = Get.put(SearchController());
    final HomeController hmController = Get.put(HomeController());
    AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.withId('0');
    RecentSearches searchedSong;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kCardColor,
      ),
      child: ListTile(
        onTap: () {
          searchedSong = RecentSearches(
              songname: currentSong!.songname,
              artist: currentSong.artist,
              duration: currentSong.duration,
              songuri: currentSong.songuri,
              id: currentSong.id);
          searchingCtrl.addToSearchedSongs(currentSong: searchedSong);
          audioPlayer.open(
            Playlist(
                audios: searchingCtrl.convertSuggestionAudios, startIndex: index),
            showNotification: true,
            headPhoneStrategy: HeadPhoneStrategy.pauseOnUnplugPlayOnPlug,
            loopMode: LoopMode.playlist,
          );
          FocusManager.instance.primaryFocus?.unfocus();
          showBottomSheet(
            context: context,
            builder: (ctx) {
              return MiniPlayer(
                index: hmController.dbAllSongs.indexWhere(
                  (element) => element.id == currentSong!.id,
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
            currentSong!.songname!,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
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
                  index: hmController.dbAllSongs
                      .indexWhere((element) => element.id == currentSong.id)),
            ),
            PopupMenuItem<String>(
              value: "Playlists",
              child: AddToPlaylists(
                  songIndex: hmController.dbAllSongs
                      .indexWhere((element) => element.id == currentSong.id)),
            ),
          ],
        ),
      ),
    );
  }
}
