class ProductsModel {
  int? id;
  String? title;
  var price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  ProductsModel(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating});

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      id: json['id'] as int,
      title: json['title'] as String,
      price: json['price'],
      description: json['description'] as String,
      category: json['category'] as String,
      image: json['image'] as String,
      rating: json['rating'] != null ? Rating.fromJson(json['rating']) : null,
    );
  }
  static List<ProductsModel> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((json) => ProductsModel.fromJson(json)).toList();
  }
}

class Rating {
  var rate;
  var count;

  Rating({this.rate, this.count});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: json['rate'],
      count: json['count'],
    );
  }
}
