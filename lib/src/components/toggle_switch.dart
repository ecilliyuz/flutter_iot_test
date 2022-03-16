import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter/material.dart';

class BulbSwitch extends StatefulWidget {
  BulbSwitch({Key? key}) : super(key: key);

  @override
  State<BulbSwitch> createState() => _BulbSwitchState();
}

class _BulbSwitchState extends State<BulbSwitch> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ToggleSwitch(
      minWidth: 90.0,
      minHeight: 70.0,
      initialLabelIndex: 0,
      cornerRadius: 20.0,
      activeFgColor: Colors.white,
      inactiveBgColor: Colors.grey,
      inactiveFgColor: Colors.white,
      totalSwitches: 2,
      icons: [
        Icons.lightbulb_outline,
        Icons.lightbulb,
      ],
      iconSize: 30.0,
      activeBgColors: [
        [Colors.black45, Colors.black26],
        [Colors.yellow, Colors.orange]
      ],
      animate: true, // with just animate set to true, default curve = Curves.easeIn
      curve: Curves.bounceInOut, // animate must be set to true when using custom curve
      onToggle: (index) {
        print('switched to: $index');
      },
    ));
  }
}
