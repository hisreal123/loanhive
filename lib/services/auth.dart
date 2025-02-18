// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:loanhive/services/secure_storage.dart' ;

// schema
import 'package:dio/src/response.dart';
import 'package:loanhive/services/network_service.dart';

class RegisterRequest {
  final String name;
  final String email;
  final String phoneNumber;
  final String password;
  final String confirmPassword;

  RegisterRequest({required this.name, required this.phoneNumber, required this.email, required this.password, required this.confirmPassword});

  Map<String, dynamic> toJson() => {
    'name': name,
    'phone_number': phoneNumber,
    'email': email,
    'password' : password,
    'confirm_password' : confirmPassword
  };
}

class Auth {
  // register
  static Future<Response> registerAuth(Map<dynamic, dynamic> payload) async {
    final request = RegisterRequest(
      name: payload['name'],
      email:  payload['email'],
      phoneNumber: payload['phone_number'],
      password: payload['password'],
      confirmPassword: payload['password_confirmation']
    );

    final response = await DioClient().client.post(
      '/v1/api/v1register',
      data: request.toJson(),
    );
    return response;
  }
}
