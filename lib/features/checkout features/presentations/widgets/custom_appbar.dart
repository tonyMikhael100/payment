import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.leadingButton,
    required this.icon,
  });

  final String? title;
  final void Function()? leadingButton;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(onPressed: leadingButton, icon: Icon(icon, size: 30)),
      title: Text(title ?? "", style: Styles.style25),
      centerTitle: true,
    );
  }
}
