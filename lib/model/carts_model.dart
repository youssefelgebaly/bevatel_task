class CartsModel {
  int? id;
  List<Products>? products;

  CartsModel({
    this.id,
    this.products,
  });

  CartsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }
  static List<CartsModel> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((json) => CartsModel.fromJson(json)).toList();
  }
}

class Products {
  int? productId;
  int? quantity;

  Products({this.productId, this.quantity});

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    quantity = json['quantity'];
  }
}
