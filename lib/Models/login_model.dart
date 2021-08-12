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
  String? email;
  String? password;
  String? phone;
  LoginRequestModel({this.email, this.password, this.phone});

  Map<String, dynamic>? toJson() {
    Map<String, dynamic> map = {
      "email": email!.trim(),
      "password": password!.trim(),
      "phone": phone!.trim(),
    };
    return map;
  }
}
