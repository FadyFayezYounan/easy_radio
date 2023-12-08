import 'utils.dart';

/// This file contains the definition of the `RadioShape` class and its subclasses.
/// The `RadioShape` class is a sealed class that represents different shapes for radio buttons.
/// It provides factory constructors for creating instances of different shapes, such as circle, square, and diamond.
/// The `RadioShape` class also defines a `when` method that allows pattern matching on the different shape types.
/// The subclasses of `RadioShape` include `CircleShape`, `SquareShape`, and `DiamondShape`.
/// Each subclass overrides the `when` method to provide the appropriate callback for the specific shape.
/// The `SquareShape` subclass also includes a private `_radius` field to store the radius of the square shape.
/// It provides a default radius value if none is provided.
/// The `SquareShape` class also overrides the `hashCode` and `operator ==` methods for equality comparison.
/// The `DiamondShape` subclass does not have any additional fields or methods.
sealed class RadioShape {
  const RadioShape();

  /// Creates an instance of the `CircleShape`.
  const factory RadioShape.circle() = CircleShape;

  /// Creates an instance of the `SquareShape` with an optional radius.
  const factory RadioShape.square([double? radius]) = SquareShape;

  /// Creates an instance of the `DiamondShape`.
  const factory RadioShape.diamond() = DiamondShape;

  /// Allows pattern matching on the different shape types.
  void when({
    required EmptyCallback circle,
    required SquareShapeCallback square,
    required EmptyCallback diamond,
  });
}

/// Represents a circle shape for radio buttons.
///
/// This class represents a circular shape for radio buttons.
/// It extends the [RadioShape] class and provides an implementation
/// for the [when] method.
class CircleShape extends RadioShape {
  const CircleShape();

  @override
  void when({
    required EmptyCallback circle,
    required SquareShapeCallback square,
    required EmptyCallback diamond,
  }) =>
      circle();
}

/// Represents a square shape for a radio button.
///
/// The [SquareShape] class extends the [RadioShape] class and provides a square shape for the radio button.
/// It takes an optional [radius] parameter, which determines the size of the square.
/// If no [radius] is provided, it uses the default [kRadioShapeBorderRadius] value.
///
/// The [SquareShape] class overrides the [hashCode] and [operator ==] methods to enable comparison between square shapes.
/// It also implements the [when] method to execute the [square] callback with the given radius.
class SquareShape extends RadioShape {
  const SquareShape([double? radius])
      : _radius = radius ?? kRadioShapeBorderRadius;
  final double _radius;

  @override
  int get hashCode => _radius.hashCode;

  @override
  bool operator ==(Object other) =>
      other is SquareShape && other._radius == _radius;

  @override
  void when({
    required EmptyCallback circle,
    required SquareShapeCallback square,
    required EmptyCallback diamond,
  }) =>
      square(_radius);
}

/// Represents a diamond shape for a radio button.
///
/// This class extends the [RadioShape] class and provides a diamond shape implementation.
/// It overrides the `when` method to invoke the `diamond` callback.
class DiamondShape extends RadioShape {
  const DiamondShape();

  @override
  void when({
    required EmptyCallback circle,
    required SquareShapeCallback square,
    required EmptyCallback diamond,
  }) =>
      diamond();
}
