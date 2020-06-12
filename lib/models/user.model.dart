class UserModel {
  String id;
  String name;
  String email;
  String role;
  String picture;
  String token;

  UserModel(
      {this.id, this.name, this.email, this.role, this.picture, this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    role = json['role'];
    picture = json['picture'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['role'] = this.role;
    data['picture'] = this.picture;
    data['token'] = this.token;
    return data;
  }
}