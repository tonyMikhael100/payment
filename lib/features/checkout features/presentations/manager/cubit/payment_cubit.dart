import 'package:bloc/bloc.dart';
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
      );
      emit(PaymentSuccessState());
    } catch (e) {
      emit(PaymentFailureState(errMessage: 'there is an error occured'));
    }
  }
}
