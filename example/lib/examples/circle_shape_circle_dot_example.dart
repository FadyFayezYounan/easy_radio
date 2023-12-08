/// A Flutter example demonstrating the usage of the `EasyRadio` package to create
/// a row of circular-shaped radio buttons with circular-shaped dots.
///
/// This example showcases a `CircleShapeCircleDotExample` widget, which is a
/// stateful widget containing a row of three `EasyRadio` widgets with different
/// values. The radio buttons have circular shapes with circular-shaped dots
/// inside them.
///
/// Usage:
/// ```dart
/// CircleShapeCircleDotExample()
/// ```
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
