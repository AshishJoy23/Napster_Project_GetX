import 'package:flutter/material.dart';
import 'package:napster_project_getx/view/core/cores.dart';


class LibraryCardWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final VoidCallback onTap;
  const LibraryCardWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: kPrimaryColor.withAlpha(100),
            borderRadius: BorderRadius.circular(size.width * 0.05)),
        child: Stack(
          children: [
            Image.asset(
              imageUrl,
              width: size.width,
              height: size.height,
              fit: BoxFit.contain,
            ),
            Container(
              padding: EdgeInsets.all(size.width * 0.01),
              decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(size.width * 0.05)),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
