import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/features/checkout%20features/data/models/payment_intent_input_model.dart';
import 'package:payment_app/features/checkout%20features/presentations/manager/cubit/payment_cubit.dart';
import 'package:payment_app/features/checkout%20features/presentations/views/thank_you_view.dart';
import 'package:payment_app/features/checkout%20features/presentations/widgets/custom_elevated_button.dart';

class PaymentButton extends StatelessWidget {
  const PaymentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccessState) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) {
                return ThankYouView();
              },
            ),
          );
        } else if (state is PaymentFailureState) {
          SnackBar snackBar = SnackBar(content: Text(state.errMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return CustomElevatedButton(
          title: "Payment",
          onPressed: () {
            BlocProvider.of<PaymentCubit>(context).makePayment(
              PaymentIntentInputModel(amount: '100', currency: 'USD'),
            );
          },
          isLoading: state is PaymentLoadingState,
        );
      },
    );
  }
}
