// ignore_for_file: prefer_collection_literals

class AppUser {
  late String id;

  String? email;
  bool? isAdmin;
  AppUser({
    required this.id,
    this.email,
    this.isAdmin,
  });

  AppUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isAdmin = json['isAdmin'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['isAdmin'] = isAdmin;
    data['email'] = email;

    return data;
  }
}
