import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton(this.message, {Key? key, required this.onPressed});

  final String message;
  final Function() onPressed;
  
  @override
  Widget build(BuildContext context) {
    const borderColor = Color(0xFF96D8CC);

    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: OutlinedButton(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size(350, 60)),
          foregroundColor: MaterialStateProperty.all(borderColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: borderColor),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          message,
          style: const TextStyle(
            fontFamily: 'Rubik',
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
