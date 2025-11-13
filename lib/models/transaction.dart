class TransactionModel {
  final String title;
  final String amount; // e.g. "-Rp35.000" or "+Rp5.000.000"
  final String category;

  TransactionModel(this.title, this.amount, this.category);
}
