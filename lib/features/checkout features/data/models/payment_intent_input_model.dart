class PaymentIntentInputModel {
  final String amount;
  final String currency;

  PaymentIntentInputModel({required this.amount, required this.currency});
  factory PaymentIntentInputModel.fromJson(Map<String, dynamic> map) {
    return PaymentIntentInputModel(
      amount: map['amount'],
      currency: map['currency'],
    );
  }
  Map<String, dynamic> toJson() {
    return {'amount': amount, 'currency': currency};
  }
}
