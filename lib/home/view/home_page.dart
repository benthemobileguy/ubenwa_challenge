import 'package:flutter/material.dart';
import 'package:ubenwa_challenge/home/view/custom-switch.dart';
class HomePage extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSwitchChanged = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFBF5FF),
      appBar: AppBar(title: const Text('Home',
        style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w700,
            color: Colors.white),),
          actions: [
            flutterSwitch(isSwitchChanged, onToggle: (val){
              setState(() {
                isSwitchChanged = !isSwitchChanged;
              });
            })
          ],
          centerTitle: false,
          backgroundColor: const Color(0xffF9923B)),

    );
  }
}