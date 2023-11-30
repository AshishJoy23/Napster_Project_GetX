import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:napster_project_getx/controller/controllers.dart';
import 'package:napster_project_getx/view/core/cores.dart';
import 'package:napster_project_getx/view/screens/screens.dart';
import 'package:napster_project_getx/view/widgets/widgets.dart';

class ScreenMostly extends StatelessWidget {
  const ScreenMostly({super.key});

  @override
  Widget build(BuildContext context) {
    final MostlyController mController = Get.put(MostlyController());
    final height1 = MediaQuery.of(context).size.height;
    final width1 = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: CustomAppbarWidget(
        title: 'Mostly Played',
        isLeading: true,
        actionsList: [
          InkWell(
            onTap: () {
              Utils.showAlertDialogBox(
                  context,
                  'Clear All Songs',
                  'Are you sure, you want to clear all your mostly played songs?',
                  'Clear', () {
                mController.clearMostlyPlayedSongs();
                Get.back();
                Utils.showSnackBar(
                    'Mostly Played Songs', 'Cleared Your Songs',);
              });
            },
            child: const CircleAvatar(
              backgroundColor: kCardColor,
              child: Icon(
                Icons.clear_all_sharp,
                size: 24,
                color: kPrimaryColor,
              ),
            ),
          ),
          SizedBox(
            width: width1 * 0.02,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Obx(
          () => (mController.mostlySongs.isEmpty)
              ? const EmptyListScreenWidget(
                  message:
                      "You haven't played anything ! \nPlay What You Love..",
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: mController.mostlySongs.length + 1,
                  itemBuilder: (context, index) {
                    if (index == mController.mostlySongs.length) {
                      return SizedBox(
                        height: height1 * 0.08,
                      );
                    }
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: height1 * 0.005),
                      child: MostlyListTileWidget(
                        currentSong: mController.mostlySongs[index],
                        convertAudios: mController.convertMostlyAudios,
                        index: index,
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
