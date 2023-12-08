import 'package:easy_radio/easy_radio.dart';
import 'package:flutter/material.dart';

class ActiveFillColorExample extends StatefulWidget {
  const ActiveFillColorExample({super.key});

  @override
  State<ActiveFillColorExample> createState() => _ActiveFillColorExampleState();
}

class _ActiveFillColorExampleState extends State<ActiveFillColorExample> {
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
