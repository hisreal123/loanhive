import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final bool isPassword; // Non-nullable with default
  final TextInputType inputType; // Non-nullable with default
  final String? Function(String?)? validator;
  final IconData? icon;
  final Color? iconColor;
  final double? iconSize;
  final VoidCallback? onGestureTap;
  final TextStyle? gestureTextStyle;
  final String? gestureText;
  final IconData? gestureIcon;

  const CustomInput({
    super.key,
    this.hintText,
    this.controller,
    this.isPassword = false, // Default value
    this.inputType = TextInputType.text, // Default value
    this.validator,
    this.icon,
    this.iconColor,
    this.iconSize,
    this.onGestureTap,
    this.gestureTextStyle,
    this.gestureText,
    this.gestureIcon,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color.fromARGB(255, 34, 33, 33),
              width: 2.0,
              style: BorderStyle.solid,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextFormField(
                  controller: widget.controller,
                  obscureText: widget.isPassword,
                  keyboardType: widget.inputType,
                  validator: (value) {
                    final error = widget.validator?.call(
                        value); // .call() is used to call a function stored in  a variable or property. eg myFuncton(args) or myFuction.call(args)   in dart.
                    if (error != _errorMessage) {
                      setState(() => _errorMessage = error);
                    }
                    return error;
                  },
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    hintStyle: const TextStyle(color: Colors.black),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    errorStyle: const TextStyle(
                      height: 0, // Hide built-in error
                      fontSize: 0,
                    ),
                    prefixIcon: widget.icon != null
                        ? Icon(
                            widget.icon,
                            color: widget.iconColor,
                            size: widget.iconSize,
                          )
                        : null,
                  ),
                ),
              ),
              if (widget.onGestureTap != null)
                GestureDetector(
                  onTap: widget.onGestureTap,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (widget.gestureIcon != null)
                          Icon(
                            widget.gestureIcon,
                            color: Colors.black,
                            size: 20,
                          ),
                        if (widget.gestureText != null)
                          Text(
                            widget.gestureText!,
                            style: widget.gestureTextStyle,
                          ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),

        // custom error message
        if (_errorMessage != null)
          Padding(
            padding: const EdgeInsets.only(top: 4.0, left: 12.0),
            child: Text(
              _errorMessage!,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }
}
