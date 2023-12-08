import 'package:easy_radio/easy_radio.dart';
import 'package:flutter/material.dart';

class CircleShapeSquareDotExample extends StatefulWidget {
  const CircleShapeSquareDotExample({super.key});

  @override
  State<CircleShapeSquareDotExample> createState() =>
      _CircleShapeSquareDotExampleState();
}

class _CircleShapeSquareDotExampleState
    extends State<CircleShapeSquareDotExample> {
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
        ),
        EasyRadio<int>(
          value: 2,
          groupValue: _groupValue,
          onChanged: _onChanged,
          dotStyle: const DotStyle.squareFilled(),
        ),
        EasyRadio<int>(
          value: 3,
          groupValue: _groupValue,
          onChanged: _onChanged,
          dotStyle: const DotStyle.squareFilled(),
        ),
      ],
    );
  }
}
