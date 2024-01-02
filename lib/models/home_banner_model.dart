class HomeBanner {
  late String id;

  String? imageName;
  String? imageUrl1;
  String? imageUrl2;
  String? imageUrl3;
  HomeBanner({
    required this.id,
    this.imageName,
    this.imageUrl1,
    this.imageUrl2,
    this.imageUrl3,
  });

  HomeBanner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageName = json['imageName'];
    imageUrl1 = json['imageUrl1'];
    imageUrl2 = json['imageUrl2'];
    imageUrl3 = json['imageUrl3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['imageName'] = imageName;
    data['imageUrl1'] = imageUrl1;
    data['imageUrl2'] = imageUrl2;
    data['imageUrl3'] = imageUrl3;

    return data;
  }
}
