// Serializing
// de-serializing


class HomeResponse {
  final bool status;
  final dynamic message;
  final HomeData data;

  HomeResponse({
    required this.status,
    this.message,
    required this.data,
  });

  factory HomeResponse.fromJson(Map<String, dynamic> json) => HomeResponse(
    status: json["status"],
    message: json["message"],
    data: HomeData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class HomeData {
  final List<BannerModel> banners;
  final List<ProductModel> products;
  final String ad;

  HomeData({
    required this.banners,
    required this.products,
    required this.ad,
  });

  factory HomeData.fromJson(Map<String, dynamic> json) => HomeData(
    banners: List<BannerModel>.from(json["banners"].map((x) => BannerModel.fromJson(x))),
    products: List<ProductModel>.from(json["products"].map((x) => ProductModel.fromJson(x))),
    ad: json["ad"],
  );

  Map<String, dynamic> toJson() => {
    "banners": List<dynamic>.from(banners.map((x) => x.toJson())),
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "ad": ad,
  };
}

class BannerModel {
  final int id;
  final String image;
  final CategoryModel? category;
  final dynamic product;

  BannerModel({
    required this.id,
    required this.image,
    this.category,
    this.product,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
    id: json["id"],
    image: json["image"],
    category: json["category"] == null ? null : CategoryModel.fromJson(json["category"]),
    product: json["product"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "category": category?.toJson(),
    "product": product,
  };
}

class CategoryModel {
  final int id;
  final String image;
  final String name;

  CategoryModel({
    required this.id,
    required this.image,
    required this.name,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id: json["id"],
    image: json["image"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "name": name,
  };
}

class ProductModel {
  final int id;
  final double price;
  final double oldPrice;
  final int discount;
  final String image;
  final String name;
  final String description;
  final List<String> images;
  final bool inFavorites;
  final bool inCart;

  ProductModel({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    price: json["price"]?.toDouble(),
    oldPrice: json["old_price"]?.toDouble(),
    discount: json["discount"],
    image: json["image"],
    name: json["name"],
    description: json["description"],
    images: List<String>.from(json["images"].map((x) => x)),
    inFavorites: json["in_favorites"],
    inCart: json["in_cart"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "price": price,
    "old_price": oldPrice,
    "discount": discount,
    "image": image,
    "name": name,
    "description": description,
    "images": List<dynamic>.from(images.map((x) => x)),
    "in_favorites": inFavorites,
    "in_cart": inCart,
  };
}
