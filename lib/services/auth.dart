// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:loanhive/services/secure_storage.dart' ;

// schema
class RegisterRequest {
  final String name;
  final String phone;

  RegisterRequest({required this.name, required this.phone});

  Map<String, dynamic> toJson() => {
        'name': name,
        'phone': phone,
      };
}

class Auth {
  // register

  static registerAuth(name, number) async {
    // print(name); // test
    // print(number);

    // final response = await DioClient().client.post(
    //       '/register',
    //       data: RegisterRequest(name: name, phone: number).toJson(),
    //     );
    // return response;
  }
}
