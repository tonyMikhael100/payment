import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomPaymentItem extends StatelessWidget {
  const CustomPaymentItem({
    super.key,
    required this.image,
    this.isActive = false,
  });
  final String image;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: MediaQuery.sizeOf(context).width * 0.25,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        border: Border.all(
          width: 3,
          color: isActive ? Color(0xff34A853) : Colors.grey,
        ),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 3, spreadRadius: 1),
        ],
      ),
      child: SvgPicture.asset(image),
    );
  }
}
