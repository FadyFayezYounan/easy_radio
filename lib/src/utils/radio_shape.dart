import 'utils.dart';

sealed class RadioShape {
  const RadioShape();

  const factory RadioShape.circle() = CircleShape;
  const factory RadioShape.square([double? radius]) = SquareShape;
  const factory RadioShape.diamond() = DiamondShape;
  void when({
    required EmptyCallback circle,
    required SquareShapeCallback square,
    required EmptyCallback diamond,
  });
}

final class CircleShape extends RadioShape {
  const CircleShape();

  @override
  void when({
    required EmptyCallback circle,
    required SquareShapeCallback square,
    required EmptyCallback diamond,
  }) =>
      circle();
}

final class SquareShape extends RadioShape {
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

final class DiamondShape extends RadioShape {
  const DiamondShape();

  @override
  void when({
    required EmptyCallback circle,
    required SquareShapeCallback square,
    required EmptyCallback diamond,
  }) =>
      diamond();
}
