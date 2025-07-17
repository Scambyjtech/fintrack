class TransactionModel {
  final String type;
  final double amount;
  final String description;
  final double gst;
  final double total;
  final String date;

  TransactionModel({
    required this.type,
    required this.amount,
    required this.description,
    required this.gst,
    required this.total,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'amount': amount,
      'description': description,
      'gst': gst,
      'total': total,
      'date': date,
    };
  }
}