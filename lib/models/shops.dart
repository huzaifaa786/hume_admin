// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

class Shop {
  late String id;
  String? name;
  String? description;
  String? bannerImageUrl;
  String? bannerImageName;
  String? logoImageUrl;
  String? logoImageName;
  Shop({
    required this.id,
    this.name,
    this.description,
    this.bannerImageUrl,
    this.bannerImageName,
    this.logoImageUrl,
    this.logoImageName,
  });

  Shop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    bannerImageUrl = json['bannerImageUrl'];
    bannerImageName = json['bannerImageName'];
    logoImageUrl = json['logoImageUrl'];
    logoImageName = json['logoImageName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['bannerImageUrl'] = this.bannerImageUrl;
    data['bannerImageName'] = this.bannerImageName;
    data['logoImageUrl'] = this.logoImageUrl;
    data['logoImageName'] = this.logoImageName;
    return data;
  }

  factory Shop.fromMap(Map<String, dynamic> map) {
    return Shop(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      bannerImageUrl: map['bannerImageUrl'],
      bannerImageName: map['bannerImageName'],
      logoImageUrl: map['logoImageUrl'],
      logoImageName: map['logoImageName'],
    );
  }
}
