import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;
  final buttonTapped;
  const Button({Key? key,
    required this.color,
    required this.textColor,
    required this.buttonText,
    required this.buttonTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: ClipRect(
        child: Container(
          alignment: Alignment.center,
          color: color,
          child: Text(
            buttonText,
            style: TextStyle(
              color: textColor,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      )
    );
  }
}
