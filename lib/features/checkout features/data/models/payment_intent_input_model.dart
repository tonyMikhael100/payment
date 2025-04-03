class PaymentIntentInputModel {
  final String amount;
  final String currency;
  final String?
  customer; // because this related to save card if you want or not

  PaymentIntentInputModel({
    this.customer,
    required this.amount,
    required this.currency,
  });

  Map<String, dynamic> toJson() {
    // for converting the 100 dolar to 100 dolar by multiply by 100
    int temp = int.parse(this.amount);
    int temp2 = temp * 100;
    print(temp2);
    String amount = temp2.toString();
    return {'amount': amount, 'currency': currency, 'customer': customer};
  }
}
