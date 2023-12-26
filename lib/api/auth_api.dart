// ignore_for_file: prefer_collection_literals

class AppUser {
  late String id;

  String? email;

  AppUser({
    required this.id,
    this.email,
  });

  AppUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;

    data['email'] = email;

    return data;
  }
}
