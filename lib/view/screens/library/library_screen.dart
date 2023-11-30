import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:napster_project_getx/view/core/cores.dart';
import 'package:napster_project_getx/view/screens/screens.dart';
import 'package:napster_project_getx/view/widgets/widgets.dart';

class ScreenLibrary extends StatelessWidget {
  const ScreenLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: const CustomAppbarWidget(title: 'Library'),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: size.height * 0.015,
          horizontal: size.width * 0.03,
        ),
        child: GridView.count(
          primary: false,
          padding: EdgeInsets.all(size.width * 0.02),
          crossAxisSpacing: size.width * 0.03,
          mainAxisSpacing: size.width * 0.03,
          crossAxisCount: 2,
          children: <Widget>[
            LibraryCardWidget(
              imageUrl: 'assets/images/library1.png',
              title: 'Mostly Played',
              onTap: ()=>Get.to(const ScreenMostly()),
            ),
            LibraryCardWidget(
              imageUrl: 'assets/images/library2.png',
              title: 'Recently Played',
              onTap: ()=>Get.to(const ScreenRecently()),
            ),
            LibraryCardWidget(
              imageUrl: 'assets/images/library4.png',
              title: 'Favorites',
              onTap: ()=>Get.to(const ScreenFavorites()),
            ),
            LibraryCardWidget(
              imageUrl: 'assets/images/library3.png',
              title: 'Playlists',
              onTap: ()=>Get.to(const ScreenPlaylists()),
            ),
            
          ],
        ),
      ),
    );
  }
}

