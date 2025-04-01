import 'package:flutter/material.dart';
import 'package:payment_app/features/checkout%20features/presentations/widgets/custom_appbar.dart';
import 'package:payment_app/features/checkout%20features/presentations/widgets/thank_you_view_body.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 56),
        child: CustomAppBar(
          icon: Icons.arrow_back_ios_new_outlined,
          leadingButton: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ThankYouViewBody(),
    );
  }
}
