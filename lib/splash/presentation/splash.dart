import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SplashScreen());
  }

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceH = MediaQuery.of(context).size.height;
    final deviceW = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: deviceH,
        width: deviceW,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              stops: [0.05, 0.3, 1.0],
              colors: [
            Color(0xffFFE5D6),
            Color(0xffDEF0FC),
            Color(0xff85D3FF),
          ],
                begin: Alignment.centerLeft,
              end: Alignment.bottomCenter),
        ),
        child: const Text(
          'Test App',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Color(0xff333E63)),
        ),
      ),
    );
  }
}