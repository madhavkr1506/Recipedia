import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Policy extends StatefulWidget {
  const Policy({super.key});

  @override
  State<Policy> createState() => PolicyUtil();
}

class PolicyUtil extends State<Policy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.only(left: 10),
          margin: EdgeInsets.only(top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Privacy Policy",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              Text(
                "\n\nEffective Date: 08-03-2025",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
              ),
              Text(
                  "\n\nThank you for using Recipedia. Your privacy is important to us, and we want to assure you that we do not collect, store, or share any personal data from our users. Please review the following policies to understand how our app operates.",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300)),
              Text(
                  "1. Data Collection\nWe do not collect, process, or store any personal or sensitive user data.\nNo account creation, login, or user authentication is required to use our app.\nWe do not track user activity or location.",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300)),
              Text(
                  "2. Third-Party Services\nOur app does not integrate with third-party analytics, advertising, or tracking services.\nIf our app links to third-party websites or resources, we are not responsible for their privacy practices, and we encourage you to review their policies separately.",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300)),
              Text(
                  "3. Cookies & Local Storage\nOur app does not use cookies or local storage to track user behavior or store personal data.\nAny data stored locally (e.g., user preferences) remains on your device and is not transmitted externally.",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300)),
              Text(
                  "4. Children’s Privacy\nOur app is safe for all ages and does not collect information from children under 13.\nSince we do not collect any data, there is no risk of children’s personal information being stored or shared.",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300)),
              Text(
                  "5. Changes to This Policy\nWe may update this policy from time to time. Any changes will be reflected in this document, and continued use of the app implies acceptance of the updated policy.\n6. Contact Us\nIf you have any questions or concerns regarding this policy, feel free to contact us at [Your Contact Email].\nBy using [Your App Name], you agree to the terms outlined in this policy. Thank you for trusting us with your cooking experience!",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300))
            ],
          ),
        ),
      ),
    );
  }
}
