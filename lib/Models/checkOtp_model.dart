class CheckOtpResponseModel {
  final String? token;
  final String? error;

  CheckOtpResponseModel({this.token, this.error});
  factory CheckOtpResponseModel.fromJson(Map<String, dynamic> json) {
    return CheckOtpResponseModel(
      token: json["token"] != null ? json["token"] : "",
      error: json["error"] != null ? json["error"] : "",
    );
  }
}

class CheckOtpRequestModel {
  String otp;
  CheckOtpRequestModel({required this.otp});
  factory CheckOtpRequestModel.fromJson(Map<String, dynamic> json) {
    return CheckOtpRequestModel(
      otp: json["otp"],
    );
  }
}
