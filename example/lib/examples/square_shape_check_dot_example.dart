import 'package:easy_radio/easy_radio.dart';
import 'package:flutter/material.dart';

class SquareShapeCheckDotExample extends StatefulWidget {
  const SquareShapeCheckDotExample({super.key});

  @override
  State<SquareShapeCheckDotExample> createState() =>
      _SquareShapeCheckDotExampleState();
}

class _SquareShapeCheckDotExampleState
    extends State<SquareShapeCheckDotExample> {
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
          dotStyle: const DotStyle.check(),
          shape: const RadioShape.square(),
        ),
        EasyRadio<int>(
          value: 2,
          groupValue: _groupValue,
          onChanged: _onChanged,
          dotStyle: const DotStyle.check(),
          shape: const RadioShape.square(),
        ),
        EasyRadio<int>(
          value: 3,
          groupValue: _groupValue,
          onChanged: _onChanged,
          dotStyle: const DotStyle.check(),
          shape: const RadioShape.square(),
        ),
      ],
    );
  }
}
