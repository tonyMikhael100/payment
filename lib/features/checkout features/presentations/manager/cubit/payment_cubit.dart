import 'package:bloc/bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:meta/meta.dart';
import 'package:payment_app/core/utils/stripe_service.dart';
import 'package:payment_app/features/checkout%20features/data/models/payment_intent_input_model.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());

  StripeService stripeService = StripeService();

  Future makePayment(PaymentIntentInputModel paymentIntentInputModel) async {
    emit(PaymentLoadingState());
    try {
      await stripeService.makeAllPaymentSteps(
        paymentIntentInputModel: paymentIntentInputModel,
        customerId:
            'cus_S3x1cCIBC9k3bP', //the customer id you got when you sign up for new user
      );
      emit(PaymentSuccessState());
    } on StripeException catch (e) {
      print("Payment canceled: ${e.error.localizedMessage}");
      emit(
        PaymentCanceledState(
          cancelMessage: e.error.localizedMessage.toString(),
        ),
      );
    } catch (e) {
      // Handle general errors
      print("Payment failed: $e");
      emit(PaymentFailureState(errMessage: 'There was an error'));
    }
  }
}
