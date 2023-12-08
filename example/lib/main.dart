import 'package:flutter/material.dart';

import 'examples/examples.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Easy Radio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Easy Radio Examples'),
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
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: const Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RadioSizedExample(),
              SizedBox(
                height: 32.0,
              ),
              CircleShapeCheckDotExample(),
              SizedBox(
                height: 32.0,
              ),
              CircleShapeDiamondDotExample(),
              SizedBox(
                height: 32.0,
              ),
              CircleShapeSquareDotExample(),
              SizedBox(
                height: 32.0,
              ),
              CircleShapeCircleDotExample(),
              SizedBox(
                height: 32.0,
              ),
              FillExample(),
              SizedBox(
                height: 32.0,
              ),
              ActiveFillColorExample(),
              SizedBox(
                height: 32.0,
              ),
              DotRadiusExample(),
              SizedBox(
                height: 32.0,
              ),
              SquareShapeCircleDotExample(),
              SizedBox(
                height: 32.0,
              ),
              SquareShapeDiamondDotExample(),
              SizedBox(
                height: 32.0,
              ),
              SquareShapeSquareDotExample(),
              SizedBox(
                height: 32.0,
              ),
              SquareShapeCheckDotExample(),
              SizedBox(
                height: 32.0,
              ),
              DiamondShapeDiamondDotExample(),
              SizedBox(
                height: 32.0,
              ),
              DiamondShapeCircleDotExample(),
              SizedBox(
                height: 32.0,
              ),
              DiamondShapeCheckDotExample(),
              SizedBox(
                height: 32.0,
              ),
              DiamondShapeSquareDotExample(),
            ],
          ),
        ),
      ),
    );
  }
}
