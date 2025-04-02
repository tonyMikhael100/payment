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
    // for converting the 100 dolar to 100 dolar by multiply by 100
    int temp = int.parse(this.amount);
    int temp2 = temp * 100;
    print(temp2);
    String amount = temp2.toString();
    return {'amount': amount, 'currency': currency};
  }
}
