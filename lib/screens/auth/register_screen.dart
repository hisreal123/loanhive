import 'package:flutter/material.dart';
import 'package:loanhive/screens/Components/color.dart';
import 'package:loanhive/screens/Components/ui/button_container.dart';
import 'package:loanhive/screens/Components/ui/custom_input.dart';
import 'package:loanhive/screens/Components/ui/toast.dart';
import 'package:loanhive/utils/constants.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _numberController = TextEditingController();

  // register user
  void _registerUser() {
    if (_formKey.currentState!.validate()) {
      // final name = _nameController.text;
      // final number = _numberController.text;

      // do something
      CustomToast.showSuccessSnackBar(context, 'Registration Successful !!!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
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
                      hintText: 'Phone Number',
                      controller: _numberController,
                      validator: (number) =>
                          Checker().checkNumber(number)?.error,
                      gestureText: 'Send OTP',
                      gestureTextStyle: const TextStyle(
                        color: Colors.red,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                      ),
                      onGestureTap: () {
                        // Handle OTP logic
                      },
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
              ],
            ),
          )),
    );
  }
}
