class ProdukModel {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final String thumbnail;

  ProdukModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.thumbnail,
  });

  factory ProdukModel.fromJson(Map<String, dynamic> json) {
    return ProdukModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'] ?? '',
      price: (json['price'] as num).toDouble(),
      thumbnail: json['thumbnail'] ?? '',
    );
  }
}
