import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment_app/features/checkout%20features/presentations/widgets/thank_you_card.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ThankYouCard(),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * 0.2 + 20,
            left: 20 + 8,
            right: 20 + 8,
            child: Row(
              children: List.generate(20, (index) {
                return Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 1),
                    color: Colors.grey,
                    height: 3,
                  ),
                );
              }),
            ),
          ),
          Positioned(
            left: -20,
            bottom: MediaQuery.sizeOf(context).height * 0.2,
            child: CircleAvatar(backgroundColor: Colors.white),
          ),
          Positioned(
            right: -20,
            bottom: MediaQuery.sizeOf(context).height * 0.2,
            child: CircleAvatar(backgroundColor: Colors.white),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: -40,
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Color(0xffD9D9D9),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Color(0xff34A853),
                child: Icon(Icons.check, size: 50, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
