
import 'package:flutter/material.dart';

class TermsOfService extends StatelessWidget {
  const TermsOfService({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(bottom: 14, top: 10),
        alignment: Alignment.center,
        child: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
                text: 'By entering your details, your are agreeing to our ',
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    height: 3,
                    color: Color.fromRGBO(189, 187, 209, 1)),
                children: [
                  TextSpan(
                    text: 'Terms of Service ',
                    style: TextStyle(
                        fontSize: 10,
                        height: 1.2,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffF9923B)),
                  ),
                  TextSpan(
                    text: 'and ',
                    style: TextStyle(
                        fontSize: 10,
                        height: 1.2,
                        fontWeight: FontWeight.w500,
                        color:
                        Color.fromRGBO(189, 187, 209, 1)),
                  ),
                  TextSpan(
                    text: 'Privacy Policy. ',
                    style: TextStyle(
                        fontSize: 10,
                        height: 1.2,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffF9923B)),
                  ),
                  TextSpan(
                    text: 'Thanks!',
                    style: TextStyle(
                        fontSize: 10,
                        height: 1.2,
                        fontWeight: FontWeight.w500,
                        color:
                        Color.fromRGBO(189, 187, 209, 1)),
                  )
                ])));
  }
}