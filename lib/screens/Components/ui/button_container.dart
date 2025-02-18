import 'package:flutter/material.dart';
import 'package:loanhive/screens/Components/color.dart';

class CustomButton extends StatefulWidget {
  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.titleText,
      required this.color});

  final void Function() onPressed;
  final String titleText;
  final Color color;

  @override
  State<CustomButton> createState() => _CustomWidebuttonState();
}

class _CustomWidebuttonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: primaryColor,
      ),
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextButton(
          onPressed: widget.onPressed,
          child: Text(
            'Get Started ',
            style: TextStyle(color: widget.color),
          )),
    );
  }
}
