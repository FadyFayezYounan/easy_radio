import 'package:easy_radio/easy_radio.dart';
import 'package:flutter/material.dart';

class SquareShapeDiamondDotExample extends StatefulWidget {
  const SquareShapeDiamondDotExample({super.key});

  @override
  State<SquareShapeDiamondDotExample> createState() =>
      _SquareShapeDiamondDotExampleState();
}

class _SquareShapeDiamondDotExampleState
    extends State<SquareShapeDiamondDotExample> {
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
          dotStyle: const DotStyle.diamondFilled(),
          shape: const RadioShape.square(),
        ),
        EasyRadio<int>(
          value: 2,
          groupValue: _groupValue,
          onChanged: _onChanged,
          dotStyle: const DotStyle.diamondFilled(),
          shape: const RadioShape.square(),
        ),
        EasyRadio<int>(
          value: 3,
          groupValue: _groupValue,
          onChanged: _onChanged,
          dotStyle: const DotStyle.diamondFilled(),
          shape: const RadioShape.square(),
        ),
      ],
    );
  }
}
