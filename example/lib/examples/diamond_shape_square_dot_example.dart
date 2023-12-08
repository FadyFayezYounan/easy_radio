/// A Flutter example demonstrating the usage of the `EasyRadio` package to create
/// a row of diamond-shaped radio buttons with square-shaped filled dots and
/// customized dot radius.
///
/// This example showcases a `DiamondShapeSquareDotExample` widget, which is a
/// stateful widget containing a row of three `EasyRadio` widgets with different
/// values. The radio buttons have diamond shapes with square-shaped filled dots
/// and a customized dot radius.
///
/// Usage:
/// ```dart
/// DiamondShapeSquareDotExample()
/// ```
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
