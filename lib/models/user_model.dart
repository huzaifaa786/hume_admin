class UserModel {
  late String id;
  String? name;
  String? email;
  String? token;
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['token'] = token;
    return data;
  }
}
