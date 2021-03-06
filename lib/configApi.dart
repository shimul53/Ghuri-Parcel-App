import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class API {
  static final baseUrl = "https://dev.api.ghuriparcel.com/";
  static final String loginUrl = baseUrl + "v1/merchant/login";
  static final String registrationUrl = baseUrl + "v1/merchant/register";
  static final String checkOtpUrl = baseUrl + "v1/merchant/send_otp";
  static final String sendOTP =
      baseUrl + "v1/merchant/send_otp?status=register";
  static final String parcelRegisterUrl =
      baseUrl + "v1/parcel/add_parcel_info?department=2&id=";

  static final String merchantDetailsUrl =
      baseUrl + "v1/merchant/3?type=1&role=1&department=2&id=3";

  static final String parcelList = baseUrl + "v1/parcel/list?merchant_id=";
  static final String? bearerToken =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOjEsIlVzZXJUeXBlIjoxLCJVc2VyUm9sZSI6MSwiRGVwYXJ0bWVudFR5cGUiOjEsIlVzZXJOYW1lIjoiYWRtaW4iLCJQaG9uZSI6IjAxOTAzNjc0NzY5IiwiSHViTmFtZSI6IiIsIkVtYWlsIjoiYWRtaW5AYWRtaW4uY29tIn0.a_SvaY1gt1ai9QFYgQNxmBPFzamdobLmXsbcm4rx-_w";
  //shared pref
  static final String token = 'token';
  static final String merchantAddress = 'merchantAddress';
  static final String merchantName = 'merchantName';
  static final String merchantId = 'id';
  static final String shopId = 'shopID';
  static final String merchantPhone = 'merchantPhone';
  static final String merchantEmail = 'merchantEmail';
  static final String parcelTrackId = 'tracking_id';
}
