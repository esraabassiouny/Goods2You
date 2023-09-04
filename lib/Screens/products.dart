
class Product {
  var  id;
  String? title;
  String? description;
  var price;
  double? discountPercentage;
  var rating;
  var stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;

  Product(
      {required this.id,
        required this.title,
        required this.description,
        required this.price,
        required this.discountPercentage,
        required this.rating,
        required this.stock,
        required this.brand,
        required this.category,
        required this.thumbnail,
        required this.images});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    discountPercentage = json['discountPercentage'];
    rating = json['rating'];
    stock = json['stock'];
    brand = json['brand'];
    category = json['category'];
    thumbnail = json['thumbnail'];
    images = json['images'].cast<String>();
  }

}
