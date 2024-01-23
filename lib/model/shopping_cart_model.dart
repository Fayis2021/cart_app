class ShoppingCartItem {
  final String name;
  final String size;
  final double rate;
  final double amount;
  final int itemCount;
  final String image;

  ShoppingCartItem({
    required this.name,
    required this.size,
    required this.rate,
    required this.amount,
    required this.itemCount,
    required this.image,
  });

  factory ShoppingCartItem.fromJson(Map<String, dynamic> json) {
    return ShoppingCartItem(
      name: json['name'] ?? '',
      size: json['size'] ?? '',
      rate: json['rate'] ?? 0.0,
      amount: json['amount'] ?? 0.0,
      itemCount: json['itemcount'] ?? 0,
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'size': size,
      'rate':rate,
      'amount': amount,
      'itemcount': itemCount,
      'image': image,
    };
  }
}
