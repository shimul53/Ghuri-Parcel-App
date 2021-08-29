class RegistrationResponseModel {
  final String? token;
  final String? error;

  RegistrationResponseModel({this.token, this.error});
  factory RegistrationResponseModel.fromJson(Map<String, dynamic> json) {
    return RegistrationResponseModel(
      token: json["token"] != null ? json["token"] : "",
      error: json["error"] != null ? json["error"] : "",
    );
  }
}

class RegistrationRequestModel {
  String merchantName;
  String email;
  String phone;
  String password;
  String shopName;
  String shopUrl;
  String city;
  String area;
  String address;

  RegistrationRequestModel({
    required this.merchantName,
    required this.email,
    required this.phone,
    required this.password,
    required this.shopName,
    required this.shopUrl,
    required this.city,
    required this.area,
    required this.address,
  });
  factory RegistrationRequestModel.fromJson(Map<String, dynamic> json) {
    return RegistrationRequestModel(
      merchantName: json["merchantName"],
      email: json["email"],
      phone: json["phone"],
      password: json["password"],
      shopName: json["shopName"],
      shopUrl: json["shopUrl"],
      city: json["city"],
      area: json["area"],
      address: json["address"],
    );
  }
}
