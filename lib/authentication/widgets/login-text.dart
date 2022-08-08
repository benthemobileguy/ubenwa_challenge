import 'package:flutter/material.dart';
class HeaderText extends StatelessWidget {
 final String? title;
  const HeaderText({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(
      title!,
      style: const TextStyle(
          fontSize: 18.5,
          fontWeight: FontWeight.w700,
          color: Color(0xff333E63)),
    );
  }
}