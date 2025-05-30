import 'package:flutter/material.dart';

class MyButton extends StatelessWidget{
  final String text;
  final double buttonSize;
  final void Function()? onTap;

  const MyButton({
    super.key,
    required this.text,
    required this.buttonSize,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.inversePrimary,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.all(buttonSize),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
