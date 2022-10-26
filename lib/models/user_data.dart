class UserData {
  final String userId;
  final String orderId;
  final double price;
  final DateTime date;

  UserData(
      {required this.userId,
      required this.orderId,
      required this.price,
      required this.date});

  static UserData fromJson(json) => UserData(
      userId: json['userId'],
      orderId: json['orderId'],
      price: json['price'],
      date: json['date']);
}
