import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
            SizedBox(height: 24),
            PaymentItemInfo(title: "Total", subtitle: r"$50.96"),
            SizedBox(height: 30),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: SvgPicture.asset('assets/images/master_card.svg'),
                title: Text("Credit Card", style: Styles.styleBold18),
                subtitle: Text(
                  "Master Card **78",
                  style: Styles.styleBold18.copyWith(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ),
            SizedBox(height: 90),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset('assets/images/Vector.svg'),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 29, vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Color(0xff34A853), width: 2),
                  ),
                  child: Text(
                    "Paid",
                    style: Styles.style24.copyWith(color: Color(0xff34A853)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
