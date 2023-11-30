import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:napster_project_getx/view/core/cores.dart';

class CustomAppbarWidget extends StatelessWidget with PreferredSizeWidget{
  final String title;
  final bool isLeading;
  final List<Widget> actionsList;
  const CustomAppbarWidget({
    super.key,
    required this.title,
    this.isLeading=false,
    this.actionsList = const [],
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AppBar(
      backgroundColor: kNavbarColor,
      leadingWidth: isLeading ? null : 0,
      leading: isLeading
      ? Padding(
        padding: EdgeInsets.all(size.width * 0.02),
        child: InkWell(
          onTap: () => Get.back(),
          child: const CircleAvatar(
            backgroundColor: kSecondaryColor,
            child: Icon(
              Icons.arrow_back_ios_new,
              color: kPrimaryColor,
              size: 24,
            ),
          ),
        ),
      )
      : const SizedBox(),
      centerTitle: !isLeading,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      actions: actionsList,
    );
  }
  
@override
  Size get preferredSize => const Size.fromHeight(60.0);
}
