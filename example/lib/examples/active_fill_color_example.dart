/// A Flutter example demonstrating the usage of the `EasyRadio` package to create
/// a row of radio buttons with customized active fill colors and dot colors.
///
/// This example showcases an `ActiveFillColorExample` widget, which is a stateful
/// widget containing a row of three `EasyRadio` widgets with different values.
/// The radio buttons have active fill colors set to the primary color of the
/// current theme and white dot colors.
///
/// Usage:
/// ```dart
/// ActiveFillColorExample()
/// ```
import 'package:easy_radio/easy_radio.dart';
import 'package:flutter/material.dart';

class ActiveFillColorExample extends StatefulWidget {
  const ActiveFillColorExample({super.key});

  @override
  State<ActiveFillColorExample> createState() => _ActiveFillColorExampleState();
}

class _ActiveFillColorExampleState extends State<ActiveFillColorExample> {
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
          activeFillColor: Theme.of(context).colorScheme.primary,
          dotColor: Colors.white,
        ),
        EasyRadio<int>(
          value: 2,
          groupValue: _groupValue,
          onChanged: _onChanged,
          activeFillColor: Theme.of(context).colorScheme.primary,
          dotColor: Colors.white,
        ),
        EasyRadio<int>(
          value: 3,
          groupValue: _groupValue,
          onChanged: _onChanged,
          activeFillColor: Theme.of(context).colorScheme.primary,
          dotColor: Colors.white,
        ),
      ],
    );
  }
}
