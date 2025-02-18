import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:loanhive/screens/Components/color.dart';
import 'package:loanhive/screens/Components/ui/button_container.dart';
import 'package:loanhive/screens/Components/ui/custom_input.dart';
import 'package:loanhive/screens/Components/ui/toast.dart';
import 'package:loanhive/services/auth.dart';
import 'package:loanhive/services/secure_storage.dart';
import 'package:loanhive/utils/constants.dart';
// import 'package:loanhive/utils/services/auth.dart'

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController(); // name
  final _emailController = TextEditingController(); // email
  final _passwordController = TextEditingController(); // password
  final _confirmPasswordContoller  = TextEditingController(); // password_confirmation
  final _numberController = TextEditingController(); // phone_number

  // register user
  void _registerUser()  async {
    if (_formKey.currentState!.validate()) {

      if (_confirmPasswordContoller.text != _passwordController.text)  return CustomToast.showErrorSnackBar(context, 'Password do no match !!!');
      final Map payload = {
        'name': _nameController.text,
        'email': _emailController.text,
        'phone_number': _numberController.text,
        'password' : _passwordController.text,
        'password_confirmation': _confirmPasswordContoller.text
      };

      try {
        final dynamic registerResponse = await Auth.registerAuth(payload);
        if (registerResponse.data.staus == 200 ) {
          // SecureStorage.saveToken("");
        }
      } on DioException catch (e) {
        CustomToast.showErrorSnackBar(context, 'Registration failed, Try again');
        throw Exception(e.response?.data['message'] ?? 'Registration failed, Try again');
      }

      // do something
      CustomToast.showSuccessSnackBar(context, 'Registration Successful !!!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Getting Started',
                          style:
                              TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        const Text(
                          "Sign up to get access to our service",
                          style:
                              TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 50),
                        CustomInput(
                          hintText: 'Name',
                          controller: _nameController,
                          validator: (name) => Checker().checkName(name),
                        ),
                        SizedBox(height: 15),
                        CustomInput(
                          hintText: 'Email',
                          controller: _emailController,
                          validator: (name) => Checker().checkEmail(name),
                        ),
                        SizedBox(height: 15),
                        CustomInput(
                          hintText: 'Phone Number',
                          controller: _numberController,
                          validator: (number) =>
                              Checker().checkNumber(number)?.error,
                          // gestureText: 'Send OTP',
                          // gestureTextStyle: const TextStyle(
                          //   color: Colors.red,
                          //   decoration: TextDecoration.underline,
                          //   fontWeight: FontWeight.bold,
                          // ),
                          // onGestureTap: () {
                          //   // Handle OTP logic
                          // },
                        ),
                        SizedBox(height: 15),
                        CustomInput(
                          hintText: 'Password',
                          controller: _passwordController,
                          validator: (name) => Checker().checkPassword(name),
                          isPassword: true,
                        ),
                        SizedBox(height: 15),
                        CustomInput(
                          hintText: 'Confirm Password',
                          controller: _confirmPasswordContoller,
                          validator: (name) => Checker().checkConfirmPassword(name),
                          isPassword: true,
                        ),
                        SizedBox(height: 30),
                        CustomButton(
                          titleText: 'Sign Up',
                          onPressed: _registerUser,
                          color: textColorBlack,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Already have an account?',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                )),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Sign in',
                                style: TextStyle(
                                    color: Colors.green,
                                    decoration: TextDecoration.underline,
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
