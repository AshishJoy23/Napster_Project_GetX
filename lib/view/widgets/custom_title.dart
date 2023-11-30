import 'package:flutter/material.dart';

class CustomTitleWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isButton;
  const CustomTitleWidget({
    super.key,
    required this.title,
    required this.onTap,
    this.isButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: Theme.of(context).textTheme.headlineSmall),
        isButton 
        ? InkWell(
          onTap: onTap,
          child: Text('Clear All',
              style: Theme.of(context).textTheme.titleMedium),
        )
        : const SizedBox()
      ],
    );
  }
}
