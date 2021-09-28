class PaymentRequestModel {
  String? CreatedAt;
  String? paidDateTime;
  bool? isPaid;
  int? paidAmount;
  int? paidMethod;
  String? paidTrxID;

  PaymentRequestModel({
    this.CreatedAt,
    this.paidDateTime,
    this.isPaid,
    this.paidAmount,
    this.paidMethod,
    this.paidTrxID,
  });
  factory PaymentRequestModel.fromJson(Map<String, dynamic> json) {
    return PaymentRequestModel(
      CreatedAt: json["CreatedAt"],
      paidDateTime: json["paidDateTime"],
      isPaid: json["isPaid"],
      paidAmount: json["paidAmount"],
      paidMethod: json["paidMethod"],
      paidTrxID: json["paidTrxID"],
    );
  }
}
