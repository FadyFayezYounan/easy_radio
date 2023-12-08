import 'package:easy_radio/easy_radio.dart';
import 'package:flutter/material.dart';

class DiamondShapeCheckDotExample extends StatefulWidget {
  const DiamondShapeCheckDotExample({super.key});

  @override
  State<DiamondShapeCheckDotExample> createState() =>
      _DiamondShapeCheckDotExampleState();
}

class _DiamondShapeCheckDotExampleState
    extends State<DiamondShapeCheckDotExample> {
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
          shape: const RadioShape.diamond(),
        ),
        EasyRadio<int>(
          value: 2,
          groupValue: _groupValue,
          onChanged: _onChanged,
          dotStyle: const DotStyle.check(),
          shape: const RadioShape.diamond(),
        ),
        EasyRadio<int>(
          value: 3,
          groupValue: _groupValue,
          onChanged: _onChanged,
          dotStyle: const DotStyle.check(),
          shape: const RadioShape.diamond(),
        ),
      ],
    );
  }
}
