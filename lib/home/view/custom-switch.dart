import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

Widget flutterSwitch(bool value, {required void Function(bool) onToggle}) {
  return FlutterSwitch(
    width: 100,
    height: 45,
    valueFontSize: 18.5,
    toggleSize: 30.0,
    value: value,
    borderRadius: 30.0,
    padding: 8.0,
    showOnOff: true,
    onToggle: onToggle,
    switchBorder: Border.all(
      color: Colors.white,
      width: 1.0,
    ),
    activeIcon: const Icon(
      Icons.online_prediction_outlined,
      color: Colors.black,
    ),
    inactiveIcon: const Icon(
      Icons.airplanemode_on,
      color: Colors.black,
    ),
    activeColor: Colors.white10,
  );
}