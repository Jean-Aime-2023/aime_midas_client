// FormButton.dart
import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    Key? key,
    required this.title,
    required this.handler,
    required this.textStyle,
  }) : super(key: key);

  final String title;
  final VoidCallback handler;
  final TextStyle textStyle; // Pass the textStyle parameter

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: textStyle, // Use the provided textStyle here
        ),
        onPressed: handler,
        child: Text(
          title,
          style: textStyle.copyWith(
            fontSize: 16.0, // Add the desired fontSize
            fontWeight: FontWeight.bold, // Add the desired fontWeight
          ),
        ),
      ),
    );
  }
}
