import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:napster_project_getx/controller/controllers.dart';
import 'package:napster_project_getx/model/database/db_all_models.dart';
import 'package:napster_project_getx/view/core/cores.dart';

class PlaylistRenameButtonWidget extends StatelessWidget {
  const PlaylistRenameButtonWidget({
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
    final textController = TextEditingController();
    return TextButton(
      onPressed: () {
        textController.text = currentPlaylist.playlistname!;
        Get.back();
        Get.defaultDialog(
          title: 'Rename the Playlist',
          content: GestureDetector(
            child: TextField(
              controller: textController,
              cursorColor: Colors.black,
              cursorHeight: 28,
              onTapOutside: (_) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              onChanged: (value) {},
              decoration: InputDecoration(
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                prefixIcon: const Icon(
                  Icons.playlist_add,
                  color: Colors.black,
                  size: 26,
                ),
                focusColor: Colors.black,
                hintText: 'Enter the Name...',
                hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.black54),
              ),
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
                textController.clear();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Text(
                'Cancel',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            ValueListenableBuilder(
              valueListenable: textController,
              builder: (context, value, child) {
                return (textController.text.isEmpty)
                    ? TextButton(
                        onPressed: () {
                          Utils.showSnackBar(
                            'Rename Playlist',
                            'Please enter a name',
                          );
                        },
                        child: Text('Rename',
                            style: Theme.of(context).textTheme.bodyLarge),
                      )
                    : ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll(kPrimaryColor),
                          textStyle: MaterialStatePropertyAll(
                              Theme.of(context).textTheme.bodyLarge),
                        ),
                        onPressed: (btnController
                                .checkIfPlaylistNameAlreadyExists(
                                    textController.text))
                            ? () {
                                textController.clear();
                                Utils.showSnackBar(
                                  'Create Playlist',
                                  'Playlist name already exists',
                                );
                              }
                            : () {
                                btnController.renamePlaylist(
                                    index, textController.text);
                                textController.clear();
                                FocusManager.instance.primaryFocus?.unfocus();
                                Get.back();
                                Utils.showSnackBar(
                                  'Rename Playlist',
                                  'Playlist renamed',
                                );
                              },
                        child: Text(
                          'Rename',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: Colors.white),
                        ),
                      );
              },
            ),
          ],
        );
      },
      child: Text(
        'Rename',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
