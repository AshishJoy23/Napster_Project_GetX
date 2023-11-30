import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:napster_project_getx/controller/controllers.dart';
import 'package:napster_project_getx/view/core/cores.dart';

class CreatePlaylist extends StatelessWidget {
  int currentIndex;
  CreatePlaylist({super.key, required this.currentIndex});

  // final TextEditingController playlistController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final PlaylistController createPlaylistController =
        Get.put(PlaylistController());
    final HomeController homeController = Get.find<HomeController>();
    final TextEditingController textController = TextEditingController();
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            style: ButtonStyle(
              backgroundColor: const MaterialStatePropertyAll(kPrimaryColor),
              padding: MaterialStateProperty.all(const EdgeInsets.all(5)),
            ),
            onPressed: () {
              Get.back();
              Get.defaultDialog(
                title: 'Create New Playlist',
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
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
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
                                  'Create Playlist',
                                  'Please enter a name',
                                );
                              },
                              child: Text(
                                'Create',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            )
                          : ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: const MaterialStatePropertyAll(
                                    kPrimaryColor),
                                textStyle: MaterialStatePropertyAll(
                                    Theme.of(context).textTheme.bodyLarge),
                              ),
                              onPressed: (createPlaylistController
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
                                      createPlaylistController.createPlaylist(
                                        homeController.dbAllSongs[currentIndex],
                                        textController.text,
                                      );
                                      textController.clear();
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                      Get.back();
                                      Utils.showSnackBar(
                                        'Create Playlist',
                                        'New playlist created and the song is added to it.',
                                      );
                                    },
                              child: Text(
                                'Create',
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
            icon: const Icon(Icons.playlist_add),
            label: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
              child: Text(
                  'Create New Playlist',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white)),
            ),
          ),
        ),
      ],
    );
  }
}
