import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:napster_project_getx/controller/controllers.dart';
import 'package:napster_project_getx/view/core/cores.dart';
import 'package:napster_project_getx/view/screens/screens.dart';
import 'package:napster_project_getx/view/widgets/widgets.dart';

class ScreenHome extends StatelessWidget {
  //final String title;
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    final SearchController searchedController = Get.put(SearchController());
    final heightDsp = MediaQuery.of(context).size.height;
    final widthDsp = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        backgroundColor: kNavbarColor,
        leadingWidth: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: kPrimaryColor,
              child: Text(
                'N',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: kNavbarColor,
                    ),
              ),
            ),
            Text('APSTER', style: Theme.of(context).textTheme.headlineSmall),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left: widthDsp * 0.025,
            right: widthDsp * 0.025,
            top: heightDsp * 0.01),
        child: SingleChildScrollView(
          child: Flex(
            direction: Axis.vertical,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Hey User,',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.black54),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Obx(
                        () => Text(
                            (homeController.time.value.hour < 12)
                                ? 'Good Morning!'
                                : ((homeController.time.value.hour < 17)
                                    ? 'Good Afternoon!'
                                    : 'Good Evening!'),
                            style: Theme.of(context).textTheme.headlineSmall),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: heightDsp * 0.005,
                  ),
                  Obx(
                    ()=> searchedController.searchedSongs.isEmpty
                    ? const SizedBox()
                    : SongCarouselWidget(searchedController: searchedController),
                  ),
                  SizedBox(
                    height: heightDsp * 0.005,
                  ),
                  CustomTitleWidget(title: 'Explore Your Songs', onTap: (){}),
              
                ],
              ),
              const ScreenAllSongs(),
            ],
          ),
        ),
      ),
    );
  }
}
