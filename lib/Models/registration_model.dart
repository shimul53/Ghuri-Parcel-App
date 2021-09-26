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
  String? merchantName;
  String? email;
  String? phone;
  String? password;
  String? shopName;
  String? shopUrl;
  String? city;
  String? area;
  String? address;
  String? msisdn;
  String? shopID;

  RegistrationRequestModel(
      {this.merchantName,
      this.email,
      this.phone,
      this.password,
      this.shopName,
      this.shopUrl,
      this.city,
      this.area,
      this.address,
      this.msisdn,
      this.shopID});
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
        msisdn: json["msisdn"],
        shopID: json["shopID"]);
  }
}
