import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee_widget/marquee_widget.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:napster_project_getx/view/core/cores.dart';
import 'package:napster_project_getx/view/screens/screens.dart';

class MiniPlayer extends StatelessWidget {
  int index;
  MiniPlayer({required this.index, super.key});

  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.withId('0');

  @override
  Widget build(BuildContext context) {
    final widthDsp = MediaQuery.of(context).size.width;
    final heightDsp = MediaQuery.of(context).size.height;
    return audioPlayer.builderCurrent(
      builder: (context, playing) {
        return Container(
          height: heightDsp * 0.09,
          width: widthDsp,
          decoration: const BoxDecoration(
            color: kPrimaryColor,
          ),
          child: ListTile(
            onTap: (() {
              Get.to(() => ScreenNowPlaying(index: index));
            }),
            // contentPadding: const EdgeInsets.all(5),
            leading: QueryArtworkWidget(
              id: int.parse(playing.audio.audio.metas.id!),
              type: ArtworkType.AUDIO,
              artworkWidth: widthDsp * 0.13,
              artworkHeight: widthDsp * 0.13,
              artworkFit: BoxFit.fill,
              nullArtworkWidget: Container(
                width: widthDsp * 0.13,
                height: widthDsp * 0.13,
                decoration: BoxDecoration(
                  border: Border.all(color: kNavbarColor),
                  borderRadius:
                      BorderRadius.all(Radius.circular(widthDsp * 0.13 / 2)),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/napster-icon.png')),
                ),
                //child: Icon(Icons.abc),
              ),
            ),
            title: Marquee(
              animationDuration: const Duration(milliseconds: 5500),
              directionMarguee: DirectionMarguee.oneDirection,
              pauseDuration: const Duration(milliseconds: 1000),
              child: Text(
                audioPlayer.getCurrentAudioTitle,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
            subtitle: audioPlayer.getCurrentAudioArtist == '<unknown>'
                ? const Text(
                    'Unknown Artist',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  )
                : Text(
                    audioPlayer.getCurrentAudioArtist,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  ),
            trailing: PlayerBuilder.isPlaying(
                player: audioPlayer,
                builder: (context, isPlaying) {
                  return InkWell(
                    onTap: () {
                      audioPlayer.playOrPause();
                    },
                    child: Icon(
                      isPlaying ? Icons.pause_circle : Icons.play_circle,
                      size: 50,
                      color: kNavbarColor,
                    ),
                  );
                }),
          ),
        );
      },
    );
  }
}
