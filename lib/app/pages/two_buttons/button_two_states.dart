import 'package:flutter/material.dart';

//Decided to leave this widget in case it's needed in the future
class ButtonTwoStates extends StatefulWidget {
  const ButtonTwoStates({
    required this.index,
    required this.onChange,
    super.key,
    this.isOn = false,
  });
  final bool isOn;
  final int index;
  final ValueChanged<bool> onChange;

  @override
  _ButtonTwoStatesState createState() => _ButtonTwoStatesState();
}

class _ButtonTwoStatesState extends State<ButtonTwoStates> {
  bool _isOn = false;

  @override
  void initState() {
    super.initState();
    _isOn = widget.isOn;
  }

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: _toggleState,
        child: Container(
          width: 80.0,
          height: 56.0,
          color: _isOn ? Colors.red : Colors.green,
        ),
      );

  void _toggleState() {
    _isOn = !_isOn;
    setState(() {});
    widget.onChange(_isOn);
  }
}
