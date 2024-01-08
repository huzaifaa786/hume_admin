class UserModel {
  late String id;
  String? name;
  String? email;
  UserModel({
    required this.id,
    required this.name,
    required this.email,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}
