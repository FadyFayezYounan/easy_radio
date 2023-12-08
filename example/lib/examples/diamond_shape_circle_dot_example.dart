/// A Flutter example demonstrating the usage of the `EasyRadio` package to create
/// a row of diamond-shaped radio buttons without dot styles.
///
/// This example showcases a `DiamondShapeCircleDotExample` widget, which is a
/// stateful widget containing a row of three `EasyRadio` widgets with different
/// values. The radio buttons have diamond shapes without any dot styles.
///
/// Usage:
/// ```dart
/// DiamondShapeCircleDotExample()
/// ```
import 'package:easy_radio/easy_radio.dart';
import 'package:flutter/material.dart';

class DiamondShapeCircleDotExample extends StatefulWidget {
  const DiamondShapeCircleDotExample({super.key});

  @override
  State<DiamondShapeCircleDotExample> createState() =>
      _DiamondShapeCircleDotExampleState();
}

class _DiamondShapeCircleDotExampleState
    extends State<DiamondShapeCircleDotExample> {
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
          shape: const RadioShape.diamond(),
        ),
        EasyRadio<int>(
          value: 2,
          groupValue: _groupValue,
          onChanged: _onChanged,
          shape: const RadioShape.diamond(),
        ),
        EasyRadio<int>(
          value: 3,
          groupValue: _groupValue,
          onChanged: _onChanged,
          shape: const RadioShape.diamond(),
        ),
      ],
    );
  }
}
