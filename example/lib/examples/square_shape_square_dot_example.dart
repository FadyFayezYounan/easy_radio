/// A Flutter example demonstrating the usage of the `EasyRadio` package to create
/// a row of square-shaped radio buttons with square-shaped filled dots.
///
/// This example showcases a `SquareShapeSquareDotExample` widget, which is a
/// stateful widget containing a row of three `EasyRadio` widgets with different
/// values. The radio buttons have square shapes with square-shaped filled dots
/// inside them, and they are toggleable.
///
/// Usage:
/// ```dart
/// SquareShapeSquareDotExample()
/// ```
import 'package:easy_radio/easy_radio.dart';
import 'package:flutter/material.dart';

class SquareShapeSquareDotExample extends StatefulWidget {
  const SquareShapeSquareDotExample({super.key});

  @override
  State<SquareShapeSquareDotExample> createState() =>
      _SquareShapeSquareDotExampleState();
}

class _SquareShapeSquareDotExampleState
    extends State<SquareShapeSquareDotExample> {
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
          dotStyle: const DotStyle.squareFilled(2),
          shape: const RadioShape.square(4),
          toggleable: true,
        ),
        EasyRadio<int>(
          value: 2,
          groupValue: _groupValue,
          onChanged: _onChanged,
          dotStyle: const DotStyle.squareFilled(2),
          shape: const RadioShape.square(4),
          toggleable: true,
        ),
        EasyRadio<int>(
          value: 3,
          groupValue: _groupValue,
          onChanged: _onChanged,
          dotStyle: const DotStyle.squareFilled(2),
          shape: const RadioShape.square(4),
          toggleable: true,
        ),
      ],
    );
  }
}
