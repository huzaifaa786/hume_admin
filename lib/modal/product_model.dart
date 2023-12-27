class ProductModel {
  late String id;
  late String productName;
  late double productPrice;
  late String productDescription;
  late String shopId;
  late String category;
  late List<String> selectedSizes;
  late List<String> productImageUrls;
  late List<String> productImageNames; // Added this line

  ProductModel({
    required this.id,
    required this.shopId,
    required this.productName,
    required this.productPrice,
    required this.productDescription,
    required this.category,
    required this.selectedSizes,
    required this.productImageUrls,
    required this.productImageNames, // Added this line
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['productName'];
    shopId = json['shopId'];
    productPrice = json['productPrice'].toDouble();
    productDescription = json['productDescription'];
    category = json['category'];
    selectedSizes = List<String>.from(json['selectedSizes']);
    productImageUrls = List<String>.from(json['productImageUrls']);
    productImageNames = List<String>.from(json['productImageNames']); // Added this line
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['productName'] = productName;
    data['shopId'] = shopId;
    data['productPrice'] = productPrice;
    data['productDescription'] = productDescription;
    data['category'] = category;
    data['selectedSizes'] = selectedSizes;
    data['productImageUrls'] = productImageUrls;
    data['productImageNames'] = productImageNames; // Added this line

    return data;
  }
}
