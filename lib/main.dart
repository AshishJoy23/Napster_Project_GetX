import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:napster_project_getx/model/database/db_all_models.dart';
import 'package:napster_project_getx/model/db_functions.dart';
import 'package:napster_project_getx/view/core/cores.dart';
import 'package:napster_project_getx/view/screens/screens.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(AllSongsAdapter());
  await Hive.openBox<AllSongs>(boxname);
  await requestPermission();
  runApp(const MyApp());

  Hive.registerAdapter(RecentlyPlayedAdapter());
  openRecentlyPlayedDb();

  Hive.registerAdapter(MostlyPlayedAdapter());
  openMostlyPlayedDb();

  Hive.registerAdapter(FavoritesAdapter());
  openFavoriteSongsDb();

  Hive.registerAdapter(PlaylistsAdapter());
  openPlaylistsDb();

  Hive.registerAdapter(RecentSearchesAdapter());
  openRecentSearchesDb();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Napster',
      theme: theme(),
      home: const ScreenSplash(),
    );
  }
}
