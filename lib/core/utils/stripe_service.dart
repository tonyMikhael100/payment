import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_app/core/utils/api_keys.dart';
import 'package:payment_app/core/utils/api_service.dart';
import 'package:payment_app/features/checkout%20features/data/models/ephmeral_key_model/ephmeral_key_model.dart';
import 'package:payment_app/features/checkout%20features/data/models/payment_intent_input_model.dart';
import 'package:payment_app/features/checkout%20features/data/models/payment_intent_model/payment_intent_model.dart';

class StripeService {
  final ApiService apiService = ApiService();

  Future<PaymentIntentModel> createPaymentIntent(
    PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    var response = await apiService.post(
      contentType: Headers.formUrlEncodedContentType,
      body: paymentIntentInputModel.toJson(),
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secretKey,
    );
    return PaymentIntentModel.fromJson(response.data);
  }

  Future<void> initPaymentSheet({
    required String paymentIntentClientSecret,
    required EphmeralKeyModel ephemeralKeyModel,
    required String customerId,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentClientSecret,
        merchantDisplayName: "Tony's shop",
        customerEphemeralKeySecret: ephemeralKeyModel.secret,
        customerId: customerId,
      ),
    );
  }

  Future<void> presentPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<void> makeAllPaymentSteps({
    required PaymentIntentInputModel paymentIntentInputModel,
    required String customerId,
  }) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralKeyModel = await createEphmeralKey(customerId: customerId);
    await initPaymentSheet(
      paymentIntentClientSecret: paymentIntentModel.clientSecret!,
      ephemeralKeyModel: ephemeralKeyModel,
      customerId: customerId,
    );
    await presentPaymentSheet();
  }
//use this when you sign up a new user only
//and get the id save it in the user table
  Future<String> createCustomer({
    required String email,
    required String name,
  }) async {
    var response = await apiService.post(
      contentType: Headers.formUrlEncodedContentType,
      body: {'email': email, 'name': name},
      url: 'https://api.stripe.com/v1/customers',
      token: ApiKeys.secretKey,
    );
    return response.data['id'];
  }

  Future<EphmeralKeyModel> createEphmeralKey({
    required String customerId,
  }) async {
    var response = await apiService.post(
      contentType: Headers.formUrlEncodedContentType,
      body: {'customer': customerId},
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      token: ApiKeys.secretKey,
      headers: {
        "Authorization": "Bearer ${ApiKeys.secretKey}",
        "Stripe-Version": "2025-02-24.acacia",
      },
    );
    return EphmeralKeyModel.fromJson(response.data);
  }
}
