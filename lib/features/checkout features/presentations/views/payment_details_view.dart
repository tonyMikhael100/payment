import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment_app/features/checkout%20features/presentations/widgets/custom_appbar.dart';
import 'package:payment_app/features/checkout%20features/presentations/widgets/custom_credit_card.dart';
import 'package:payment_app/features/checkout%20features/presentations/widgets/custom_elevated_button.dart';
import 'package:payment_app/features/checkout%20features/presentations/widgets/custom_payment_item.dart';
import 'package:payment_app/features/checkout%20features/presentations/widgets/payment_method_listview.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 56),
        child: CustomAppBar(
          title: "Payment Details",
          leadingButton: () {
            Navigator.of(context).pop();
          },
          icon: Icons.arrow_back_ios_new_outlined,
        ),
      ),
      body: PaymentDetailsViewBody(),
    );
  }
}

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: Center(child: PaymetnMethodListView())),
          SliverToBoxAdapter(child: SizedBox(height: 0)),
          SliverToBoxAdapter(child: CustomCreditCard(formKey: formKey)),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomElevatedButton(
                title: "Payment",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
