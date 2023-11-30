import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';

class PlaylistFirstSongImageWidget extends StatelessWidget {
  const PlaylistFirstSongImageWidget({
    super.key,
    required this.currentPlaylistSongs,
  });

  final List currentPlaylistSongs;

  @override
  Widget build(BuildContext context) {
    final height1 = MediaQuery.of(context).size.height;
    final width1 = MediaQuery.of(context).size.width;
    return Container(
      height: height1 * 0.35,
      width: width1,
      padding: EdgeInsets.all(width1 * 0.03),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Container(
            height: height1 * 0.35,
            width: width1,
            foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.9),
                    Colors.black.withOpacity(0.7),
                    Colors.black.withOpacity(0.7),
                    Colors.black.withOpacity(0.9),
                  ]),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: QueryArtworkWidget(
                artworkFit: BoxFit.contain,
                artworkHeight: height1 * 0.35,
                artworkWidth: width1,
                id: currentPlaylistSongs.first.id!,
                type: ArtworkType.AUDIO,
                artworkQuality: FilterQuality.high,
                size: 2000,
                quality: 100,
                artworkBorder: BorderRadius.circular(10),
                nullArtworkWidget: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/napster-icon.png')),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: height1 * 0.04),
              child: Text(
                (currentPlaylistSongs.length <= 1)
                    ? '${currentPlaylistSongs.length.toString()} Song'
                    : '${currentPlaylistSongs.length.toString()} Songs',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
