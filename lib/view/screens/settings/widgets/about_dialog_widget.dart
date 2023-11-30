import 'package:flutter/material.dart';

class AboutDialogWidget extends StatelessWidget {
  const AboutDialogWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final widthDsp = MediaQuery.of(context).size.width;
    final heightDsp = MediaQuery.of(context).size.height;
    return Theme(
      data: ThemeData(
        buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      child: AboutDialog(
        applicationIcon: Container(
          height: heightDsp * 0.09,
          width: widthDsp * 0.18,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/napster-icon.png'),
            ),
          ),
        ),
        applicationName: "Napster",
        applicationVersion: '1.0.0',
        applicationLegalese: 'Copyright © 2023 Napster',
        children: [
          SizedBox(
            height: heightDsp * 0.02,
          ),
          Text(
            "Napster is an offline music player app which allows users to listen to music from their storage. It provides features like adding to favorites, creating playlists, recently played, mostly played, etc.",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: heightDsp * 0.02,
          ),
          Text(
            "App developed by Ashish Joy.",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
