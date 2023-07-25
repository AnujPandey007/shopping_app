class Product {
  final String p_name;
  final int p_id;
  final int p_cost;
  final bool p_availability;
  final String p_details;
  final String p_category;
  final int quantity;
  final String p_image;

  Product({
    required this.p_name,
    required this.p_id,
    required this.p_cost,
    required this.p_availability,
    this.p_details = "No Details",
    this.p_category = "No Category",
    this.quantity = 1,
    this.p_image = 'items.jpeg',
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      p_name: json['p_name'],
      p_id: json['p_id'],
      p_cost: json['p_cost'],
      p_availability: json['p_availability'] == 1,
      p_details: json['p_details'] ?? "No Details",
      p_category: json['p_category'] ?? "No Category",
      quantity: json['quantity'] ?? 1,
      p_image: json['p_image'] ?? 'items.jpeg',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'p_name': p_name,
      'p_id': p_id,
      'p_cost': p_cost,
      'p_availability': p_availability,
      'p_details': p_details,
      'p_category': p_category,
      'quantity': quantity,
      'p_image':p_image
    };
  }


}