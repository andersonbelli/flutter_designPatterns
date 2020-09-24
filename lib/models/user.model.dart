class UserModel {
  String id;
  String name;
  String email;
  String password;
  String iconOption;

  UserModel({this.id, this.name, this.email, this.password, this.iconOption});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    iconOption = json['iconOption'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['iconOption'] = this.iconOption;
    return data;
  }
}
