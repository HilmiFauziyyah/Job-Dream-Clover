import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(this.message, {Key? key, required this.onPressed});

  final String message;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    const primaryButtonColor = Color(0xFF96D8CC);

    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: ElevatedButton(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size(350, 60)),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          backgroundColor: MaterialStateProperty.all(primaryButtonColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
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
