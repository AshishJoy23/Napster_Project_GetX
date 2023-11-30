import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:napster_project_getx/controller/controllers.dart';
import 'package:napster_project_getx/view/core/cores.dart';

class CreateAppbarPlaylistWidget extends StatelessWidget {
  const CreateAppbarPlaylistWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final PlaylistController appbarPlaylistController =
        Get.put(PlaylistController());
    final textController = TextEditingController();
    return InkWell(
      onTap: () {
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
                          backgroundColor:
                              const MaterialStatePropertyAll(kPrimaryColor),
                          textStyle: MaterialStatePropertyAll(
                              Theme.of(context).textTheme.bodyLarge),
                        ),
                        onPressed: (appbarPlaylistController
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
                                appbarPlaylistController.createPlaylist(
                                  null,
                                  textController.text,
                                );
                                textController.clear();
                                FocusManager.instance.primaryFocus?.unfocus();
                                Get.back();
                                Utils.showSnackBar(
                                  'Create Playlist',
                                  'New playlist created',
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
      child: const CircleAvatar(
        backgroundColor: kCardColor,
        child: Icon(
          Icons.add_circle,
          size: 24,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
