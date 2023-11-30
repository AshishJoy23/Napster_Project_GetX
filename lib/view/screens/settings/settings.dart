import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:napster_project_getx/view/core/cores.dart';
import 'package:napster_project_getx/view/screens/screens.dart';
import 'package:napster_project_getx/view/widgets/widgets.dart';

class ScreenSettings extends StatelessWidget {
  const ScreenSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: const CustomAppbarWidget(title: 'Settings'),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: size.height * 0.015,
          horizontal: size.width * 0.03,
        ),
        child: ListView(children: [
          SettingsListTileWidget(
            title: "Theme",
            onTap: () {},
          ),
          SizedBox(
            height: size.height * 0.015,
          ),
          SettingsListTileWidget(
            title: "Privacy Policy",
            onTap: () {
              Get.to(
                () => const PrivacyPolicy(),
              );
            },
          ),
          SizedBox(
            height: size.height * 0.015,
          ),
          SettingsListTileWidget(
            title: "Terms and Conditions",
            onTap: () {
              Get.to(
                () => const TermsAndCondition(),
              );
            },
          ),
          SizedBox(
            height: size.height * 0.015,
          ),
          SettingsListTileWidget(
            title: "About Us",
            onTap: () {
              Get.to(
                () => const AboutDialogWidget(),
              );
            },
          ),
        ]),
      ),
    );
  }
}
