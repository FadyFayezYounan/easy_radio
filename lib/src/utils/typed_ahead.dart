import 'dart:ui' show StrokeCap;

/// A typedef representing an empty callback function.
///
/// The [EmptyCallback] type is used to define a function that takes no arguments and returns no value.
typedef EmptyCallback = void Function();

/// A typedef representing a callback function for a square filled with a given radius.
///
/// The [SquareFilledCallback] function takes a [double] parameter representing the radius of the square.
/// It does not return a value.
typedef SquareFilledCallback = void Function(double radius);

/// A typedef representing a callback function that takes a [StrokeCap] parameter and returns void.
typedef CheckCallback = void Function(StrokeCap strokeCap);

/// A typedef representing a callback function that takes a [double] parameter
/// representing the border radius of a square outline.
typedef SquareOutlinedCallback = void Function(double radius);

/// A typedef representing a callback function for square shape calculations.
///
/// The [SquareShapeCallback] function takes a [radius] parameter of type [double]
/// and returns void. It is used for radio square shape.
typedef SquareShapeCallback = void Function(double radius);
