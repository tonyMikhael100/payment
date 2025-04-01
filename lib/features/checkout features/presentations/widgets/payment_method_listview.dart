import 'package:flutter/material.dart';
import 'package:payment_app/features/checkout%20features/presentations/widgets/custom_payment_item.dart';

class PaymetnMethodListView extends StatefulWidget {
  const PaymetnMethodListView({super.key});

  @override
  State<PaymetnMethodListView> createState() => _PaymetnMethodListViewState();
}

class _PaymetnMethodListViewState extends State<PaymetnMethodListView> {
  List<String> items = ['assets/images/card.svg', 'assets/images/paypal.svg'];
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              if (activeIndex != index) {
                setState(() {
                  activeIndex = index;
                  print(activeIndex);
                });
              }
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CustomPaymentItem(
                image: items[index],
                isActive: activeIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
