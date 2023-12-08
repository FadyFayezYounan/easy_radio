/// This file contains the implementation of the `DotStyle` class and its subclasses.
/// The `DotStyle` class is a sealed class that represents different styles of dots.
/// It provides factory constructors for creating instances of different dot styles.
/// Each dot style is represented by a subclass of `DotStyle`.
/// The `DotStyle` class also defines a `when` method that takes callback functions for each dot style,
/// allowing the user to perform different actions based on the dot style.
/// The subclasses of `DotStyle` override the `when` method to invoke the appropriate callback function.
/// This file also includes the `CircleStyle`, `SquareFilledStyle`, `CheckStyle`, `SquareOutlinedStyle`,
/// `DiamondFilledStyle`, and `DiamondOutlinedStyle` classes, which are subclasses of `DotStyle`.
/// Each subclass represents a specific dot style and provides its own implementation of the `when` method.
/// The `CircleStyle` class represents a circle dot style, the `SquareFilledStyle` class represents a square filled dot style,
/// the `CheckStyle` class represents a check dot style, the `SquareOutlinedStyle` class represents a square outlined dot style,
/// the `DiamondFilledStyle` class represents a diamond filled dot style, and the `DiamondOutlinedStyle` class represents a diamond outlined dot style.
/// Each subclass also provides additional properties and methods specific to its dot style.
import 'dart:ui' show StrokeCap;

import 'typed_ahead.dart';

// Create a sealed class DotStyle to represent different dot styles
sealed class DotStyle {
  const DotStyle(); // Base class constructor

  // Factory constructors for different dot styles with optional parameters
  const factory DotStyle.circle() = CircleStyle;
  const factory DotStyle.squareFilled([double? radius]) = SquareFilledStyle;
  const factory DotStyle.check([StrokeCap? strokeCap]) = CheckStyle;
  const factory DotStyle.squareOutlined([double? radius]) = SquareOutlinedStyle;
  const factory DotStyle.diamondFilled() = DiamondFilledStyle;
  const factory DotStyle.diamondOutlined() = DiamondOutlinedStyle;

  // Method to handle different dot styles using callback functions
  void when({
    required EmptyCallback circle,
    required SquareFilledCallback squareFilled,
    required CheckCallback check,
    required SquareOutlinedCallback squareOutlined,
    required EmptyCallback diamondFilled,
    required EmptyCallback diamondOutlined,
  });
}

// Define a final class for CircleStyle that extends DotStyle
final class CircleStyle extends DotStyle {
  const CircleStyle(); // Constructor for CircleStyle

  // Override the 'when' method to handle CircleStyle
  @override
  void when({
    required EmptyCallback circle,
    required SquareFilledCallback squareFilled,
    required CheckCallback check,
    required SquareOutlinedCallback squareOutlined,
    required EmptyCallback diamondFilled,
    required EmptyCallback diamondOutlined,
  }) =>
      circle(); // Invoke the 'circle' callback
}

// Define a final class for SquareFilledStyle that extends DotStyle
final class SquareFilledStyle extends DotStyle {
  const SquareFilledStyle([double? radius])
      : _radius =
            radius ?? 0.0; // Constructor with an optional radius parameter
  final double _radius; // Private field to store the radius

  @override
  int get hashCode => _radius.hashCode;

  @override
  bool operator ==(Object other) =>
      other is SquareFilledStyle && other._radius == _radius;

  // Override the 'when' method to handle SquareFilledStyle
  @override
  void when({
    required EmptyCallback circle,
    required SquareFilledCallback squareFilled,
    required CheckCallback check,
    required SquareOutlinedCallback squareOutlined,
    required EmptyCallback diamondFilled,
    required EmptyCallback diamondOutlined,
  }) =>
      squareFilled(
          _radius); // Invoke the 'squareFilled' callback with the stored radius
}

// Define a final class for CheckStyle that extends DotStyle
final class CheckStyle extends DotStyle {
  // Constructor with an optional StrokeCap parameter
  // Initialize the private field with the provided parameter or a default value
  const CheckStyle([StrokeCap? strokeCap])
      : _strokeCap = strokeCap ?? StrokeCap.round;
  final StrokeCap _strokeCap; // Private field to store the StrokeCap

  @override
  int get hashCode => _strokeCap.hashCode;

  @override
  bool operator ==(Object other) =>
      other is CheckStyle && other._strokeCap == _strokeCap;

  // Override the 'when' method to handle CheckStyle
  @override
  void when({
    required EmptyCallback circle,
    required SquareFilledCallback squareFilled,
    required CheckCallback check,
    required SquareOutlinedCallback squareOutlined,
    required EmptyCallback diamondFilled,
    required EmptyCallback diamondOutlined,
  }) =>
      check(
          _strokeCap); // Invoke the 'check' callback with the stored StrokeCap
}

// Define a final class for SquareOutlinedStyle that extends DotStyle
final class SquareOutlinedStyle extends DotStyle {
  // Constructor with an optional radius parameter
  const SquareOutlinedStyle([double? radius]) : _radius = radius ?? 0.0;
  final double _radius; // Private field to store the radius

  @override
  int get hashCode => _radius.hashCode;

  @override
  bool operator ==(Object other) =>
      other is SquareOutlinedStyle && other._radius == _radius;
  // Override the 'when' method to handle SquareOutlinedStyle
  @override
  void when({
    required EmptyCallback circle,
    required SquareFilledCallback squareFilled,
    required CheckCallback check,
    required SquareOutlinedCallback squareOutlined,
    required EmptyCallback diamondFilled,
    required EmptyCallback diamondOutlined,
  }) =>
      squareOutlined(
          _radius); // Invoke the 'squareOutlined' callback with the stored radius
}

// Define a final class for DiamondFilledStyle that extends DotStyle
final class DiamondFilledStyle extends DotStyle {
  const DiamondFilledStyle(); // Constructor for DiamondFilledStyle

  // Override the 'when' method to handle DiamondFilledStyle
  @override
  void when({
    required EmptyCallback circle,
    required SquareFilledCallback squareFilled,
    required CheckCallback check,
    required SquareOutlinedCallback squareOutlined,
    required EmptyCallback diamondFilled,
    required EmptyCallback diamondOutlined,
  }) =>
      diamondFilled(); // Invoke the 'diamondFilled' callback
}

// Define a final class for DiamondOutlinedStyle that extends DotStyle
final class DiamondOutlinedStyle extends DotStyle {
  const DiamondOutlinedStyle(); // Constructor for DiamondOutlinedStyle

  // Override the 'when' method to handle DiamondOutlinedStyle
  @override
  void when({
    required EmptyCallback circle,
    required SquareFilledCallback squareFilled,
    required CheckCallback check,
    required SquareOutlinedCallback squareOutlined,
    required EmptyCallback diamondFilled,
    required EmptyCallback diamondOutlined,
  }) =>
      diamondOutlined(); // Invoke the 'diamondOutlined' callback
}
