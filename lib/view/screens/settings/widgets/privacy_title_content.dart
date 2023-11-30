import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:napster_project_getx/view/widgets/widgets.dart';

class PrivacyPolicyTitleAndContent extends StatelessWidget {
  const PrivacyPolicyTitleAndContent({
    super.key,
    required this.title,
    required this.message,
  });

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    final width1 = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: width1 * 0.03,
            ),
            CustomTitleWidget(
              title: title,
              onTap: () {},
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.all(width1 * 0.03),
          child: ReadMoreText(
            message,
            trimLines: 5,
            textAlign: TextAlign.justify,
            trimMode: TrimMode.Line,
            lessStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            moreStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
