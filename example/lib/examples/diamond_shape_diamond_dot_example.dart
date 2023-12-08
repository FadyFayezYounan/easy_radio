/// A Flutter example demonstrating the usage of the `EasyRadio` package to create
/// a row of diamond-shaped radio buttons with diamond-shaped filled dots.
///
/// This example showcases a `DiamondShapeDiamondDotExample` widget, which is a
/// stateful widget containing a row of three `EasyRadio` widgets with different
/// values. The radio buttons have diamond shapes with diamond-shaped filled dots.
///
/// Usage:
/// ```dart
/// DiamondShapeDiamondDotExample()
/// ```
import 'package:easy_radio/easy_radio.dart';
import 'package:flutter/material.dart';

class DiamondShapeDiamondDotExample extends StatefulWidget {
  const DiamondShapeDiamondDotExample({super.key});

  @override
  State<DiamondShapeDiamondDotExample> createState() =>
      _DiamondShapeDiamondDotExampleState();
}

class _DiamondShapeDiamondDotExampleState
    extends State<DiamondShapeDiamondDotExample> {
  int? _groupValue = 1;

  /// Callback function for handling changes in the radio button selection.
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
          shape: const RadioShape.diamond(),
        ),
        EasyRadio<int>(
          value: 2,
          groupValue: _groupValue,
          onChanged: _onChanged,
          dotStyle: const DotStyle.diamondFilled(),
          shape: const RadioShape.diamond(),
        ),
        EasyRadio<int>(
          value: 3,
          groupValue: _groupValue,
          onChanged: _onChanged,
          dotStyle: const DotStyle.diamondFilled(),
          shape: const RadioShape.diamond(),
        ),
      ],
    );
  }
}
