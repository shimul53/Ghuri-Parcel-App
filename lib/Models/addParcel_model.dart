class AddParcelResponseModel {
  final String? token;
  final String? error;

  AddParcelResponseModel({this.token, this.error});
  factory AddParcelResponseModel.fromJson(Map<String, dynamic> json) {
    return AddParcelResponseModel(
      token: json["token"] != null ? json["token"] : "",
      error: json["error"] != null ? json["error"] : "",
    );
  }
}

class AddParcelRequestModel {
  String? invoiceNumber;
  String? pickupDate;
  String? pickupAddress;
  String? customerName;
  String? customerNumber;
  String? alternativeNumber;
  String? deliveryAddress;
  String? customerArea;
  bool? payable;
  int? customerPayableAmount;
  int? deliveryType;
  int? productWeight;
  int? productType;
  String? instruction;
  String? merchantID;
  String? shopID;

  AddParcelRequestModel({
    this.invoiceNumber,
    this.pickupDate,
    this.pickupAddress,
    this.customerName,
    this.customerNumber,
    this.alternativeNumber,
    this.deliveryAddress,
    this.customerArea,
    this.payable,
    this.customerPayableAmount,
    this.deliveryType,
    this.productWeight,
    this.productType,
    this.instruction,
    this.merchantID,
    this.shopID,
  });
  factory AddParcelRequestModel.fromJson(Map<String, dynamic> json) {
    return AddParcelRequestModel(
      merchantID: json["merchantID"],
      shopID: json["shopID"],
      invoiceNumber: json["invoiceNumber"],
      customerName: json["customerName"],
      customerNumber: json["customerNumber"],
      alternativeNumber: json["alternativeNumber"],
      customerArea: json["customerArea"],
      pickupDate: json["pickupDate"],
      pickupAddress: json["pickupAddress"],
      deliveryAddress: json["deliveryAddress"],
      deliveryType: json["deliveryType"],
      productType: json["productType"],
      productWeight: json["productWeight"],
      payable: json["payable"],
      customerPayableAmount: json["customerPayableAmount"],
      instruction: json["instruction"],
    );
  }
}
