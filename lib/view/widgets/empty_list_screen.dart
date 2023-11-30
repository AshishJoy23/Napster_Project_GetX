import 'package:flutter/material.dart';

class EmptyListScreenWidget extends StatelessWidget {
  final String message;
  final String imageUrl;
  const EmptyListScreenWidget({
    super.key,
    required  this.message,
    this.imageUrl = 'assets/images/empty_folder.png',
  });

  @override
  Widget build(BuildContext context) {
    final height1 = MediaQuery.of(context).size.height;
    final width1 = MediaQuery.of(context).size.width;
    return Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: height1 * 0.08),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imageUrl,
                width: width1 * 0.8,
                height: height1 * 0.3,
                fit: BoxFit.cover,
              ),
              Text(
                message,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              )
            ],
          ),
        ),
      );
  }
}