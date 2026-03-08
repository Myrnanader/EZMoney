class PaymentValidator {

  static String? validateAmount(String? value) {

    if (value == null || value.isEmpty) {
      return "Amount is required";
    }

    final amount = double.tryParse(value);

    if (amount == null || amount <= 0) {
      return "Invalid amount";
    }

    return null;
  }

}