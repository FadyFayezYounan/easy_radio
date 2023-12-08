import 'package:easy_radio/easy_radio.dart';
import 'package:flutter/material.dart';

class DotRadiusExample extends StatefulWidget {
  const DotRadiusExample({super.key});

  @override
  State<DotRadiusExample> createState() => _DotRadiusExampleState();
}

class _DotRadiusExampleState extends State<DotRadiusExample> {
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
