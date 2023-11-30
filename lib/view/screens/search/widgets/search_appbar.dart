import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:napster_project_getx/controller/controllers.dart';
import 'package:napster_project_getx/view/core/cores.dart';

class SearchAppbarWidget extends StatelessWidget {
  const SearchAppbarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final SearchController searchAppbarController = Get.put(SearchController());
    final TextEditingController textController = TextEditingController();
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width*0.85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        cursorColor: kPrimaryColor,
        cursorHeight: 25,
        onTap: () {
          searchAppbarController.filterSearchingSongs('');
        },
        onTapOutside: (_) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onChanged: (value) {
          log(value);
          searchAppbarController.filterSearchingSongs(value);
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(2),
          prefixIcon: const Icon(
            Icons.search_outlined,
            color: kPrimaryColor,
            size: 26,
          ),
          suffixIcon: IconButton(
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
                textController.clear();
                searchAppbarController.fetchAllSearchedSongs();
                searchAppbarController.isSearched.value = false;
              },
              icon: const Icon(
                Icons.clear,
                color: kPrimaryColor,
                size: 26,
              )),
          //focusColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(size.width/2),
            borderSide: BorderSide.none,
    ),
          hintText: 'Search Here.....',
          hintStyle: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: kPrimaryColor.withAlpha(150)),
          filled: true,
          fillColor: kSecondaryColor,
        ),
        controller: textController,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
