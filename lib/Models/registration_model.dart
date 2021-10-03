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
  String? oldPassword;
  String? confirmPassword;

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
      this.shopID,
      this.oldPassword,
      this.confirmPassword});
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
        shopID: json["shopID"],
        oldPassword: json["oldPassword"],
        confirmPassword: json["confirmPassword"]);
  }
}
