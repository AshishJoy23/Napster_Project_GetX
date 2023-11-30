import 'package:flutter/material.dart';
import 'package:napster_project_getx/view/core/cores.dart';
import 'package:napster_project_getx/view/screens/screens.dart';
import 'package:napster_project_getx/view/widgets/widgets.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});
  final String message =
      "For a better experience, while using our Service, I may require you to provide us with certain personally identifiable information, including but not limited to tall man,. The information that I request will be retained on your device and is not collected by me in any way.\nThe app does use third-party services that may collect information used to identify you.";
  final String message1 =
      "We collect the following types of information from our users:\n1. Music library information, such as song titles, artist names, and album covers, to organize and display users' music collections.\n2. Usage data, such as songs played, playlists created, and repeat playback, to improve the user experience and make product decisions.\n3. Technical data, such as device information, operating system, and app version, to diagnose technical issues and improve app performance.";
  final String message2 =
      "We use the collected information to provide, maintain, and improve our music streaming application. Specifically, we use the information to:\n1. Organize and display users' music collections.\n2. Personalize the user experience by creating playlists and displaying recently played songs.\n3. Analyze usage data to improve our app features and user experience.\n4. Respond to user support inquiries and resolve technical issues.";
  final String message3 =
      "We do not share users' personal information with third parties, except for our service providers who assist us in providing our services. We ensure that such third-party service providers agree to use the information solely for the purpose of providing the requested services and comply with the relevant privacy regulations.";
  final String message4 =
      'We may update this privacy policy from time to time to reflect changes in our business practices or legal obligations. We encourage users to review the policy periodically to stay informed about how we collect, use, and protect their personal information.';
  final String message5 =
      "Ashish Joy built the Saptak Music app as a Free app. This SERVICE is provided by Ashish Joy at no cost and is intended for use as is.";

  final String message6 =
      "If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us at ashishjoy23@gmail.com.";

  @override
  Widget build(BuildContext context) {
    final height1 = MediaQuery.of(context).size.height;
    final width1 = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: const CustomAppbarWidget(
        title: 'Privacy Policy',
        isLeading: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(width1 * 0.03),
                    child: Text(
                      message,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  SizedBox(
                    height: height1 * 0.02,
                  ),
                  PrivacyPolicyTitleAndContent(
                      title: 'Information We Collect:', message: message1),
                  PrivacyPolicyTitleAndContent(
                      title: 'Use of Information:', message: message2),
                  PrivacyPolicyTitleAndContent(
                      title: 'Sharing of Information:', message: message3),
                  PrivacyPolicyTitleAndContent(
                      title: 'Updates to Privacy Policy:', message: message4),
                  Padding(
                    padding: EdgeInsets.all(width1 * 0.03),
                    child: Text(
                      message5,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(width1 * 0.03),
                    child: Text(
                      message6,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
