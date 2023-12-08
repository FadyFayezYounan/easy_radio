import 'package:easy_radio/easy_radio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      backgroundColor: Colors.white,
      body: const Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RadioSizedExample(),
              SizedBox(
                height: 32.0,
              ),
              RadioShapeExample(),
              SizedBox(
                height: 32.0,
              ),
              DotCheckStyleExample(),
              SizedBox(
                height: 32.0,
              ),
              FillExample(),
              SizedBox(
                height: 32.0,
              ),
              DotDiamondStyleExample(),
              SizedBox(
                height: 32.0,
              ),
              DotSquareStyleExample(),
              SizedBox(
                height: 32.0,
              ),
              ActiveFillColorExampleExample(),
              SizedBox(
                height: 32.0,
              ),
              RadiusExample(),
            ],
          ),
        ),
      ),
    );
  }
}

class RadioSizedExample extends StatefulWidget {
  const RadioSizedExample({super.key});

  @override
  State<RadioSizedExample> createState() => _RadioSizedExampleState();
}

class _RadioSizedExampleState extends State<RadioSizedExample> {
  int _groupValue = 1;

  void _onChanged(int? value) {
    setState(() {
      _groupValue = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        EasyRadio(
          value: 1,
          groupValue: _groupValue,
          onChanged: _onChanged,
          radius: 12.0,
          dotRadius: 6.0,
        ),
        EasyRadio(
          value: 2,
          groupValue: _groupValue,
          onChanged: _onChanged,
          radius: 16.0,
          dotRadius: 8.0,
        ),
        EasyRadio(
          value: 3,
          groupValue: _groupValue,
          onChanged: _onChanged,
          radius: 24.0,
          dotRadius: 12.0,
        ),
      ],
    );
  }
}

class RadioShapeExample extends StatefulWidget {
  const RadioShapeExample({super.key});

  @override
  State<RadioShapeExample> createState() => _RadioShapeExampleState();
}

class _RadioShapeExampleState extends State<RadioShapeExample> {
  int _groupValue = 1;

  void _onChanged(int? value) {
    setState(() {
      _groupValue = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        EasyRadio(
          value: 1,
          groupValue: _groupValue,
          onChanged: _onChanged,
          shape: const RadioShape.square(),
        ),
        EasyRadio(
          value: 2,
          groupValue: _groupValue,
          onChanged: _onChanged,
          shape: const RadioShape.square(),
        ),
        EasyRadio(
          value: 3,
          groupValue: _groupValue,
          onChanged: _onChanged,
          shape: const RadioShape.square(),
        ),
      ],
    );
  }
}

class DotCheckStyleExample extends StatefulWidget {
  const DotCheckStyleExample({super.key});

  @override
  State<DotCheckStyleExample> createState() => _DotCheckStyleExampleState();
}

class _DotCheckStyleExampleState extends State<DotCheckStyleExample> {
  int _groupValue = 1;

  void _onChanged(int? value) {
    setState(() {
      _groupValue = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        EasyRadio(
          value: 1,
          groupValue: _groupValue,
          onChanged: _onChanged,
          dotStyle: const DotStyle.check(StrokeCap.round),
        ),
        EasyRadio(
          value: 2,
          groupValue: _groupValue,
          onChanged: _onChanged,
          dotStyle: const DotStyle.check(StrokeCap.round),
        ),
        EasyRadio(
          value: 3,
          groupValue: _groupValue,
          onChanged: _onChanged,
          dotStyle: const DotStyle.check(StrokeCap.round),
        ),
      ],
    );
  }
}

class DotDiamondStyleExample extends StatefulWidget {
  const DotDiamondStyleExample({super.key});

  @override
  State<DotDiamondStyleExample> createState() => _DotDiamondStyleExampleState();
}

class _DotDiamondStyleExampleState extends State<DotDiamondStyleExample> {
  int _groupValue = 1;

  void _onChanged(int? value) {
    setState(() {
      _groupValue = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        EasyRadio(
          value: 1,
          groupValue: _groupValue,
          onChanged: _onChanged,
          dotStyle: const DotStyle.diamondFilled(),
        ),
        EasyRadio(
          value: 2,
          groupValue: _groupValue,
          onChanged: _onChanged,
          dotStyle: const DotStyle.diamondFilled(),
        ),
        EasyRadio(
          value: 3,
          groupValue: _groupValue,
          onChanged: _onChanged,
          dotStyle: const DotStyle.diamondFilled(),
        ),
      ],
    );
  }
}

class FillExample extends StatefulWidget {
  const FillExample({super.key});

  @override
  State<FillExample> createState() => _FillExampleState();
}

class _FillExampleState extends State<FillExample> {
  int _groupValue = 1;

  void _onChanged(int? value) {
    setState(() {
      _groupValue = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        EasyRadio(
          value: 1,
          groupValue: _groupValue,
          onChanged: _onChanged,
          dotColor: Colors.teal,
          activeBorderColor: Colors.teal,
          inactiveBorderColor: Colors.teal.shade100,
          // just set dotRadius equal to radius
          dotRadius: 12.0,
          radius: 12.0,
        ),
        EasyRadio(
          value: 2,
          groupValue: _groupValue,
          onChanged: _onChanged,
          dotColor: Colors.teal,
          activeBorderColor: Colors.teal,
          inactiveBorderColor: Colors.teal.shade100,
          // just set dotRadius equal to radius
          dotRadius: 12,
          radius: 12.0,
        ),
        EasyRadio(
          value: 3,
          groupValue: _groupValue,
          onChanged: _onChanged,
          dotColor: Colors.teal,
          activeBorderColor: Colors.teal,
          inactiveBorderColor: Colors.teal.shade100,
          // just set dotRadius equal to radius
          dotRadius: 12,
          radius: 12.0,
        ),
      ],
    );
  }
}

class DotSquareStyleExample extends StatefulWidget {
  const DotSquareStyleExample({super.key});

  @override
  State<DotSquareStyleExample> createState() => _DotSquareStyleExampleState();
}

class _DotSquareStyleExampleState extends State<DotSquareStyleExample> {
  int? _groupValue = 1;

  void _onChanged(int? value) {
    setState(() {
      _groupValue = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        EasyRadio(
          value: 1,
          groupValue: _groupValue,
          onChanged: _onChanged,
          dotStyle: const DotStyle.squareFilled(2),
          shape: const RadioShape.square(4),
          toggleable: true,
        ),
        EasyRadio(
          value: 2,
          groupValue: _groupValue,
          onChanged: _onChanged,
          dotStyle: const DotStyle.squareFilled(2),
          shape: const RadioShape.square(4),
          toggleable: true,
        ),
        EasyRadio(
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

class ActiveFillColorExampleExample extends StatefulWidget {
  const ActiveFillColorExampleExample({super.key});

  @override
  State<ActiveFillColorExampleExample> createState() =>
      _ActiveFillColorExampleExampleState();
}

class _ActiveFillColorExampleExampleState
    extends State<ActiveFillColorExampleExample> {
  int _groupValue = 1;

  void _onChanged(int? value) {
    setState(() {
      _groupValue = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        EasyRadio(
          value: 1,
          groupValue: _groupValue,
          onChanged: _onChanged,
          activeFillColor: Theme.of(context).colorScheme.primary,
          dotColor: Colors.white,
        ),
        EasyRadio(
          value: 2,
          groupValue: _groupValue,
          onChanged: _onChanged,
          activeFillColor: Theme.of(context).colorScheme.primary,
          dotColor: Colors.white,
        ),
        EasyRadio(
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

class RadiusExample extends StatefulWidget {
  const RadiusExample({super.key});

  @override
  State<RadiusExample> createState() => _RadiusExampleState();
}

class _RadiusExampleState extends State<RadiusExample> {
  int? _groupValue = 1;

  void _onChanged(int? value) {
    setState(() {
      _groupValue = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        EasyRadio(
          value: 1,
          groupValue: _groupValue,
          onChanged: _onChanged,
          dotRadius: 9.0,
        ),
        EasyRadio(
          value: 2,
          groupValue: _groupValue,
          onChanged: _onChanged,
          dotRadius: 9.0,
        ),
        EasyRadio(
          value: 3,
          groupValue: _groupValue,
          onChanged: _onChanged,
          dotRadius: 9.0,
        ),
      ],
    );
  }
}
