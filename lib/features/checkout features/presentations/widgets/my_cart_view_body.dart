import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/styles.dart';
import 'package:payment_app/features/checkout%20features/presentations/views/payment_details_view.dart';
import 'package:payment_app/features/checkout%20features/presentations/widgets/custom_elevated_button.dart';
import 'package:payment_app/features/checkout%20features/presentations/widgets/order_info_item.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Expanded(child: Image.asset('assets/images/basket_image.png')),
          SizedBox(height: 25),
          OrderInfoItem(title: "Order Subtotal", value: r"$49.25"),
          SizedBox(height: 3),
          OrderInfoItem(title: "Discount", value: r"$0"),
          SizedBox(height: 3),
          OrderInfoItem(title: "Shipping", value: r"$10"),
          SizedBox(height: 3),
          Divider(indent: 20, endIndent: 20),
          SizedBox(height: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total", style: Styles.style25),
              Text(r'$59.25', style: Styles.style25),
            ],
          ),
          SizedBox(height: 16),
          CustomElevatedButton(
            title: "Complete Payment",
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return PaymentDetailsView();
                  },
                ),
              );
            },
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
