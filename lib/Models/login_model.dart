class LoginRequestModel {
  String phoneOrEmail;
  String password;
  LoginRequestModel({required this.phoneOrEmail, required this.password});

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) {
    return LoginRequestModel(
        phoneOrEmail: json["phoneOrEmail"], password: json["password"]);
  }
}
