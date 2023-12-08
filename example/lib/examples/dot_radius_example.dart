/// A Flutter example demonstrating the usage of the `EasyRadio` package to create
/// a row of radio buttons with customized dot radius.
///
/// This example showcases a `DotRadiusExample` widget, which is a stateful widget
/// containing a row of three `EasyRadio` widgets with different values. The radio
/// buttons have default circular shapes with a customized dot radius of 9.0.
///
/// Usage:
/// ```dart
/// DotRadiusExample()
/// ```
import 'package:easy_radio/easy_radio.dart';
import 'package:flutter/material.dart';

class DotRadiusExample extends StatefulWidget {
  const DotRadiusExample({super.key});

  @override
  State<DotRadiusExample> createState() => _DotRadiusExampleState();
}

class _DotRadiusExampleState extends State<DotRadiusExample> {
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
          dotRadius: 9.0,
        ),
        EasyRadio<int>(
          value: 2,
          groupValue: _groupValue,
          onChanged: _onChanged,
          dotRadius: 9.0,
        ),
        EasyRadio<int>(
          value: 3,
          groupValue: _groupValue,
          onChanged: _onChanged,
          dotRadius: 9.0,
        ),
      ],
    );
  }
}
