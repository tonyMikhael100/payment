import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/styles.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key, required this.title, this.onPressed});
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: Color(0xff34A853),
        fixedSize: Size(MediaQuery.sizeOf(context).width, 73),
      ),
      child: Text(title, style: Styles.style22),
    );
  }
}
