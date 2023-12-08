import 'package:easy_radio/easy_radio.dart';
import 'package:flutter/material.dart';

class CircleShapeCircleDotExample extends StatefulWidget {
  const CircleShapeCircleDotExample({super.key});

  @override
  State<CircleShapeCircleDotExample> createState() =>
      _CircleShapeCircleDotExampleState();
}

class _CircleShapeCircleDotExampleState
    extends State<CircleShapeCircleDotExample> {
  int? _groupValue = 1;

  void _onChanged(int? value) {
    setState(() {
      _groupValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        EasyRadio<int>(
          value: 1,
          groupValue: _groupValue,
          onChanged: _onChanged,
        ),
        EasyRadio<int>(
          value: 2,
          groupValue: _groupValue,
          onChanged: _onChanged,
        ),
        EasyRadio<int>(
          value: 3,
          groupValue: _groupValue,
          onChanged: _onChanged,
        ),
      ],
    );
  }
}
