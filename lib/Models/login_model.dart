class LoginResponseModel {
  final String? token;
  final String? error;

  LoginResponseModel({this.token, this.error});
  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json["token"] != null ? json["token"] : "",
      error: json["error"] != null ? json["error"] : "",
    );
  }
}

class LoginRequestModel {
  String phoneOrEmail;
  String password;
  LoginRequestModel({required this.phoneOrEmail, required this.password});

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) {
    return LoginRequestModel(
        phoneOrEmail: json["phoneOrEmail"], password: json["password"]);
  }
}
