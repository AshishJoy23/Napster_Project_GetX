import 'package:flutter/material.dart';
import 'package:napster_project_getx/view/core/cores.dart';

class SettingsListTileWidget extends StatelessWidget {
  const SettingsListTileWidget({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      //padding: const EdgeInsets.all(5),
      height: size.height * 0.08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kCardColor,
      ),
      child: Center(
        child: ListTile(
          title: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: kPrimaryColor,
            size: 24,
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
