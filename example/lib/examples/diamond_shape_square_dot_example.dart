import 'package:easy_radio/easy_radio.dart';
import 'package:flutter/material.dart';

class DiamondShapeSquareDotExample extends StatefulWidget {
  const DiamondShapeSquareDotExample({super.key});

  @override
  State<DiamondShapeSquareDotExample> createState() =>
      _DiamondShapeSquareDotExampleState();
}

class _DiamondShapeSquareDotExampleState
    extends State<DiamondShapeSquareDotExample> {
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
          dotStyle: const DotStyle.squareFilled(),
          shape: const RadioShape.diamond(),
          dotRadius: 4.0,
        ),
        EasyRadio<int>(
          value: 2,
          groupValue: _groupValue,
          onChanged: _onChanged,
          dotStyle: const DotStyle.squareFilled(),
          shape: const RadioShape.diamond(),
          dotRadius: 4.0,
        ),
        EasyRadio<int>(
          value: 3,
          groupValue: _groupValue,
          onChanged: _onChanged,
          dotStyle: const DotStyle.squareFilled(),
          shape: const RadioShape.diamond(),
          dotRadius: 4.0,
        ),
      ],
    );
  }
}
