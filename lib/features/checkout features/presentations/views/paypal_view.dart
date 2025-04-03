import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

class PaypalView extends StatelessWidget {
  const PaypalView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PaypalPaymentDemp',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder:
                      (BuildContext context) => PaypalCheckoutView(
                        sandboxMode: true,
                        clientId:
                            "AfqvGugZHEcsfpXZqyH6fej9mjCWKVXF8g4brmItYm_SHiBxLEO7ao8LoC5ms4n7lrQcXRmnKIdQb2hW",
                        secretKey:
                            "EIFON35u0zSXTuxU2YSZW5Ae8syQTro8k89y-ENyQZcyyNHOIB82GfMvKA41UScPSzs4kNNrrxgSPqvS",
                        transactions: const [
                          {
                            "amount": {
                              "total": '100',
                              "currency": "USD",
                              "details": {
                                "subtotal": '100',
                                "shipping": '0',
                                "shipping_discount": 0,
                              },
                            },
                            "description":
                                "The payment transaction description.",
                            // "payment_options": {
                            //   "allowed_payment_method":
                            //       "INSTANT_FUNDING_SOURCE"
                            // },
                            "item_list": {
                              "items": [
                                {
                                  "name": "Apple",
                                  "quantity": 4,
                                  "price": '10',
                                  "currency": "USD",
                                },
                                {
                                  "name": "Pineapple",
                                  "quantity": 5,
                                  "price": '12',
                                  "currency": "USD",
                                },
                              ],
                            },
                          },
                        ],
                        note: "Contact us for any questions on your order.",
                        onSuccess: (Map params) async {
                          log("onSuccess: $params");
                          Navigator.pop(context);
                        },
                        onError: (error) {
                          log("onError: $error");
                          Navigator.pop(context);
                        },
                        onCancel: () {
                          // print('cancelled:');
                          Navigator.pop(context);
                        },
                      ),
                ),
              );
            },
            child: const Text('Pay with paypal'),
          ),
        ),
      ),
    );
  }
}
