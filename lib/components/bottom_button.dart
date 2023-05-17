import 'package:flutter/material.dart';
import '../utils/constants.dart';


class BottomButton extends StatelessWidget {
  final String buttonText;
  final void Function() onTap;

  BottomButton({required this.buttonText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        color: Colors.red.shade600,
        height: kBottomContainerHeight,
        width: double.infinity,
        margin: EdgeInsets.only(top: 10.0),
        child: Center(
          child: Text(
            buttonText,
            style: kLargerButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
