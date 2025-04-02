import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_app/core/utils/api_keys.dart';
import 'package:payment_app/features/checkout%20features/presentations/views/my_cart_view.dart';
import 'package:payment_app/features/checkout%20features/presentations/views/payment_details_view.dart';
import 'package:payment_app/features/checkout%20features/presentations/views/thank_you_view.dart';

void main() {
  Stripe.publishableKey = ApiKeys.publishableKey;
  runApp(const PaymentApp());
}

class PaymentApp extends StatelessWidget {
  const PaymentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyCartView());
  }
}
