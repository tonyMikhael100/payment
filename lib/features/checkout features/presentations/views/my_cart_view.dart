import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/styles.dart';
import 'package:payment_app/features/checkout%20features/presentations/widgets/custom_appbar.dart';
import 'package:payment_app/features/checkout%20features/presentations/widgets/my_cart_view_body.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 56),
        child: CustomAppBar(
          title: "My Cart",
          leadingButton: () {},
          icon: Icons.arrow_back_ios_sharp,
        ),
      ),
      body: MyCartViewBody(),
    );
  }
}

