import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:napster_project_getx/controller/controllers.dart';
import 'package:napster_project_getx/view/core/cores.dart';
import 'package:napster_project_getx/view/screens/screens.dart';
import 'package:napster_project_getx/view/widgets/widgets.dart';

class ScreenPlaylists extends StatelessWidget {
  const ScreenPlaylists({super.key});

  @override
  Widget build(BuildContext context) {
    final PlaylistController controller = Get.put(PlaylistController());
    final heightDsp = MediaQuery.of(context).size.height;
    final widthDsp = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: CustomAppbarWidget(
        title: 'Playlists',
        isLeading: true,
        actionsList: [
          const CreateAppbarPlaylistWidget(),
          SizedBox(
            width: widthDsp * 0.02,
          )
        ],
      ),
      body: Obx(
        () => (controller.allDbPlaylists.isEmpty)
            ? const EmptyListScreenWidget(
                message:
                    "You haven't created any  playlist ! \nCreate What You Love..")
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(children: [
                    CustomTitleWidget(
                        title: (controller.allDbPlaylists.length == 1)
                            ? '1 Playlist'
                            : '${controller.allDbPlaylists.length} Playlists',
                        onTap: () {}),
                    SizedBox(
                      height: heightDsp * 0.02,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.allDbPlaylists.length,
                      itemBuilder: (context, index) {
                        //controller.fetchCurrentPlaylistSongs(index);
                        final currentPlaylist =
                            controller.allDbPlaylists[index];
                        return Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: heightDsp * 0.005),
                          child: PlaylistListTileWidget(
                            index: index,
                            currentPlaylist: currentPlaylist,
                            tileController: controller,
                          ),
                        );
                      },
                    ),
                  ]),
                ),
              ),
      ),
    );
  }
}
