import 'package:ghuri_parcel_app/Models/login_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService {
  Future<LoginResponseModel?> login(LoginRequestModel requestModel) async {
    String url = "https://api.ghuriparcel.com/v1/merchant/login/";
    final response =
        await http.post(Uri.parse(url), body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load Data");
    }
  }
}
