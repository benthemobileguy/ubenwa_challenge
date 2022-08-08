import 'package:flutter/material.dart';
class FloatingText extends StatelessWidget {
  final String? title;
  const FloatingText({
    Key? key,
    this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5),
      alignment: Alignment.centerLeft,
      child: Text(
        title!,
        style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: Color(0xff384571)),
      ),
    );
  }
}