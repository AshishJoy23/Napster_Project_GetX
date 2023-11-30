import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:napster_project_getx/controller/controllers.dart';
import 'package:napster_project_getx/view/screens/screens.dart';
import 'package:napster_project_getx/view/widgets/widgets.dart';

class ScreenAllSongs extends StatelessWidget {
  const ScreenAllSongs({super.key});
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    final heightDsp = MediaQuery.of(context).size.height;
    return (controller.dbAllSongs.isEmpty)
        ? const EmptyListScreenWidget(message: "No Songs Found, Sorry..")
        : Obx(
            () => ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.dbAllSongs.length + 1,
              itemBuilder: (context, index) {
                return (index == controller.dbAllSongs.length)
                    ? SizedBox(
                        height: heightDsp * 0.09,
                      )
                    : Padding(
                      padding: EdgeInsets.symmetric(vertical: heightDsp*0.005),
                      child: SongListTileWidget(
                          currentSong: controller.dbAllSongs[index],
                          convertAudios: controller.convertAllAudios,
                          index: index,
                        ),
                    );
              },
            ),
          );
  }
}
