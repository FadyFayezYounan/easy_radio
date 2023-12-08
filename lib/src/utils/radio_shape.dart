import 'constants.dart';
import 'typed_ahead.dart';

sealed class RadioShape {
  const RadioShape();

  const factory RadioShape.circle() = CircleShape;
  const factory RadioShape.square([double? radius]) = SquareShape;
  void when({
    required EmptyCallback circle,
    required SquareShapeCallback square,
  });
}

final class CircleShape extends RadioShape {
  const CircleShape();

  @override
  void when({
    required EmptyCallback circle,
    required SquareShapeCallback square,
  }) =>
      circle();
}

final class SquareShape extends RadioShape {
  const SquareShape([double? radius]) : _radius = radius ?? kShapeBorderRadius;
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
  }) =>
      square(_radius);
}
