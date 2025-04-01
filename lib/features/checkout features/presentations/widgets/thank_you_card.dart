import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/styles.dart';
import 'package:payment_app/features/checkout%20features/presentations/widgets/payment_item_info.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xffD9D9D9),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
        child: Column(
          children: [
            Text("Thank You", style: Styles.style24),
            Text("Your transaction was successful", style: Styles.style18),
            SizedBox(height: 30),
            PaymentItemInfo(title: "Date :", subtitle: "29/2/2025"),
            SizedBox(height: 20),
            PaymentItemInfo(title: "Time :", subtitle: "12:30 Am"),
            SizedBox(height: 20),
            PaymentItemInfo(title: "To :", subtitle: "Tony mikhael"),
            SizedBox(height: 30),
            Divider(
              thickness: 2,
              color: Color(0xffC7C7C7),
              indent: 15,
              endIndent: 15,
            ),
          ],
        ),
      ),
    );
  }
}
