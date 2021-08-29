import 'package:ghuri_parcel_app/Models/login_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../configApi.dart';

class APIService {
  Future<LoginResponseModel?> login(LoginRequestModel requestModel) async {
    final response = await http.post(
      Uri.parse(API.loginUrl),
      body: requestModel,
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load Data");
    }
  }
}
