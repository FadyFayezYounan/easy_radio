import 'package:flutter/material.dart';

import 'utils/utils.dart';

class EasyRadio<T> extends StatefulWidget {
  /// A custom radio button widget that allows users to select a value from a group of options.
  ///
  /// The [EasyRadio] widget displays a circular radio button with customizable styles and animations.
  /// It can be used in a group of radio buttons to represent different values.
  ///
  /// Example usage:
  /// ```dart
  /// EasyRadio<int>(
  ///   value: 1,
  ///   groupValue: _selectedValue,
  ///   onChanged: (value) {
  ///     setState(() {
  ///       _selectedValue = value;
  ///     });
  ///   },
  ///   dotRadius: 8.0,
  ///   radius: 16.0,
  ///   activeBorderColor: Colors.blue,
  ///   dotColor: Colors.white,
  ///   inactiveBorderColor: Colors.grey,
  ///   inactiveFillColor: Colors.transparent,
  ///   activeFillColor: Colors.blue,
  ///   animateFillColor: true,
  ///   dotStyle: DotStyle.circle(),
  ///   shape: RadioShape.circle(),
  /// )
  /// ```
  /// [EasyRadio] proprieties:
  ///
  /// The [value] parameter is required and represents the value represented by this radio button.
  /// The [groupValue] parameter is optional and represents the currently selected value for a group of radio buttons.
  /// The [onChanged] parameter is optional and is called when the radio button is selected.
  /// The [dotRadius] parameter is optional and represents the radius of the dot inside the radio button.
  /// The [radius] parameter is optional and represents the radius of the radio button.
  /// The [activeBorderColor] parameter is optional and represents the border color of the radio button when selected.
  /// The [dotColor] parameter is optional and represents the color of the dot inside the radio button.
  /// The [inactiveBorderColor] parameter is optional and represents the border color of the radio button when not selected.
  /// The [inactiveFillColor] parameter is optional and represents the fill color of the radio button when not selected.
  /// The [activeFillColor] parameter is optional and represents the fill color of the radio button when selected.
  /// The [animateFillColor] parameter is optional and determines whether the fill color of the radio button should animate when selected.
  /// The [dotStyle] parameter is optional and represents the style of the dot inside the radio button.
  /// The [shape] parameter is optional and represents the shape of the radio button.
  /// The [toggleable] parameter is optional and determines whether the radio button can be toggled between selected and unselected states.

  const EasyRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.dotRadius = kDotRadius,
    this.activeBorderColor,
    this.dotColor,
    this.inactiveBorderColor,
    this.inactiveFillColor,
    this.radius = kRadioRadius,
    this.activeFillColor,
    this.animateFillColor = false,
    this.dotStyle = const DotStyle.circle(),
    this.shape = const RadioShape.circle(),
    this.toggleable = false,
  });

  /// The value represented by this radio button.
  final T value;

  /// The currently selected value for a group of radio buttons.
  ///
  /// This radio button is considered selected if its [value] matches the [groupValue].
  final T? groupValue;

  /// Called when the radio button is selected.
  final ValueChanged<T?>? onChanged;

  /// The radius of the dot inside the radio button.
  final double dotRadius;

  /// The radius of the radio button.
  final double radius;

  /// The border color of the radio button when selected.
  final Color? activeBorderColor;

  /// The color of the dot inside the radio button.
  final Color? dotColor;

  /// The border color of the radio button when not selected.
  final Color? inactiveBorderColor;

  /// The fill color of the radio button when not selected.
  final Color? inactiveFillColor;

  /// The fill color of the radio button when selected.
  final Color? activeFillColor;

  /// Determines whether the fill color of the radio button should animate when selected.
  final bool animateFillColor;

  /// The style of the dot inside the radio button.
  final DotStyle dotStyle;

  /// The shape of the radio button.
  final RadioShape shape;

  /// Determines whether the radio button can be toggled between selected and unselected states.
  final bool toggleable;

  bool get _selected => value == groupValue;

  @override
  State<EasyRadio<T>> createState() => _EasyRadioState<T>();
}

class _EasyRadioState<T> extends State<EasyRadio<T>>
    with TickerProviderStateMixin, ToggleableStateMixin {
  final _CustomRadioPainter _painter = _CustomRadioPainter();

  void _handleChanged(bool? selected) {
    if (selected == null) {
      widget.onChanged!(null);
      return;
    }
    if (selected) {
      widget.onChanged!(widget.value);
    }
  }

  @override
  void didUpdateWidget(covariant EasyRadio<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget._selected != oldWidget._selected) {
      animateToValue();
    }
  }

  @override
  void dispose() {
    _painter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Semantics(
      checked: widget._selected,
      inMutuallyExclusiveGroup: true,
      child: buildToggleable(
        mouseCursor: MaterialStateProperty.resolveWith(
            (states) => MaterialStateMouseCursor.clickable),
        size: Size(widget.radius * 2, widget.radius * 2),
        painter: _painter
          ..position = position
          ..reaction = reaction
          ..reactionFocusFade = reactionFocusFade
          ..reactionHoverFade = reactionHoverFade
          //TODO: add support for custom colors
          ..inactiveReactionColor = Colors.transparent
          ..reactionColor = Colors.transparent
          ..hoverColor = Colors.transparent
          ..focusColor = Colors.transparent
          ..splashRadius = widget.radius * 2
          ..downPosition = downPosition
          ..isFocused = states.contains(MaterialState.focused)
          ..isHovered = states.contains(MaterialState.hovered)
          ..dotColor = widget.dotColor ?? colorScheme.primary
          ..dotRadius = widget.dotRadius
          ..radius = widget.radius
          ..inactiveFillColor = widget.inactiveFillColor
          ..activeColor = widget.activeBorderColor ?? colorScheme.primary
          ..inactiveColor =
              widget.inactiveBorderColor ?? Colors.grey.withOpacity(0.2)
          ..activeFillColor = widget.activeFillColor
          ..animateFillColor = widget.animateFillColor
          ..dotStyle = widget.dotStyle
          ..shape = widget.shape,
      ),
    );
  }

  @override
  ValueChanged<bool?>? get onChanged =>
      widget.onChanged != null ? _handleChanged : null;

  @override
  bool get tristate => widget.toggleable;

  @override
  bool? get value => widget._selected;
}

class _CustomRadioPainter extends ToggleablePainter {
  /// Sets the color of the dot.
  ///
  /// The dot color is used to represent the selected state of the radio button.
  /// If set to null, the default color will be used.
  set dotColor(Color? color) {
    _dotColor = color;
  }

  /// Sets the fill color of the selected radio button.
  ///
  /// The selected fill color is used to fill the radio button when it is selected.
  /// If set to null, the default color will be used.
  ///
  set activeFillColor(Color? color) {
    _activeFillColor = color;
  }

  /// Sets the fill color of the unselected radio button.
  ///
  /// The unselected fill color is used to fill the radio button when it is not selected.
  /// If set to null, the default color will be used.
  ///
  set inactiveFillColor(Color? color) {
    _inactiveFillColor = color;
  }

  /// Sets the radius of the radio button.
  ///
  /// The radius determines the size of the radio button.
  /// The default radius is 12.0.
  ///
  set radius(double value) {
    _radius = value;
  }

  /// Sets the radius of the dot inside the radio button.
  ///
  /// The dot radius determines the size of the dot inside the radio button.
  /// The default dot radius is 6.0.
  ///
  set dotRadius(double value) {
    _dotRadius = value;
  }

  /// Sets whether the fill color of the radio button should be animated.
  ///
  /// If set to true, the fill color of the radio button will animate when the selection changes.
  /// If set to false, the fill color will not animate.
  /// The default value is false.
  ///
  set animateFillColor(bool value) {
    _animateFillColor = value;
  }

  /// Sets the style of the dot inside the radio button.
  ///
  /// The dot style determines the shape of the dot inside the radio button.
  /// The default dot style is a circle.
  ///
  set dotStyle(DotStyle style) {
    _dotStyle = style;
  }

  /// Sets the shape of the radio button.
  ///
  /// The shape determines the shape of the radio button.
  /// The default shape is a circle.
  ///
  set shape(RadioShape shape) {
    _shape = shape;
  }

  Color? _dotColor;

  Color? _activeFillColor;

  Color? _inactiveFillColor;

  double _radius = 12.0;

  double _dotRadius = 6.0;

  bool _animateFillColor = false;

  DotStyle _dotStyle = const DotStyle.circle();

  RadioShape _shape = const RadioShape.circle();

  @override
  void paint(Canvas canvas, Size size) {
    paintRadialReaction(canvas: canvas, origin: size.center(Offset.zero));

    final Offset center = (Offset.zero & size).center;
    // Outer shape
    final Paint paint = Paint()
      ..color = Color.lerp(inactiveColor, activeColor, position.value)!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
    _shape.when(
      circle: () {
        _drawOuterCircleShape(center, canvas, paint);
      },
      square: (radius) {
        _drawOuterSquareShapeWithBorderRadius(center, canvas, paint, radius);
      },
      diamond: () {
        _drawDiamond(center, canvas, paint);
      },
    );

    /// Draws the unselected radio fill circle on the canvas.
    ///
    /// If the [_inactiveFillColor] is not null and the [position] is dismissed,
    /// this method sets the paint color to [_inactiveFillColor], sets the paint
    /// style to [PaintingStyle.fill], and draws a circle with center [center] and
    /// radius [_radius] on the [canvas].
    if (_inactiveFillColor != null && position.isDismissed) {
      paint.color = _inactiveFillColor!;
      paint.style = PaintingStyle.fill;
      _shape.when(
        circle: () {
          canvas.drawCircle(center, _radius, paint);
        },
        square: (borderRadius) {
          _drawOuterSquareShapeWithBorderRadius(
              center, canvas, paint, borderRadius);
        },
        diamond: () {
          _drawDiamond(center, canvas, paint);
        },
      );
    }

    /// Draws the selected radio fill circles on the canvas.
    ///
    /// If [_activeFillColor] is not null and the [position] is not dismissed,
    /// this method sets the paint color to [_activeFillColor], sets the paint
    /// style to [PaintingStyle.fill], and draws a circle on the [canvas] with
    /// the specified [center] and [radius].
    ///
    /// If [_animateFillColor] is true, the radius is animated based on the value
    /// of [position]. Otherwise, the radius remains constant at [_radius].
    ///
    /// This method is typically called within a custom paint method to render
    /// the selected radio fill circles.
    if (_activeFillColor != null && !position.isDismissed) {
      paint.color = _activeFillColor!;
      paint.style = PaintingStyle.fill;
      final radius = _animateFillColor ? _radius * position.value : _radius;
      _shape.when(
        circle: () {
          canvas.drawCircle(center, radius, paint);
        },
        square: (borderRadius) {
          _drawOuterSquareShapeWithBorderRadius(
              center, canvas, paint, borderRadius, radius);
        },
        diamond: () {
          _drawDiamond(center, canvas, paint);
        },
      );
    }

    /// Draws the inner dot on the canvas based on the specified position and dot style.
    ///
    /// If the position is not dismissed and the dot color is not null, the dot is drawn on the canvas.
    /// The dot style determines the shape and appearance of the dot.
    ///
    /// Parameters:
    /// - position: The position of the dot.
    /// - canvas: The canvas on which to draw the dot.
    /// - paint: The paint object used to define the dot's color and style.
    ///
    /// Returns: void
    if (!position.isDismissed) {
      if (_dotColor != null) {
        paint.color = _dotColor!;
        _dotStyle.when(
          circle: () {
            paint.style = PaintingStyle.fill;
            _drawAnimatedCircle(center, canvas, paint);
          },
          squareFilled: (borderRadius) {
            paint.style = PaintingStyle.fill;
            _drawAnimatedSquareWithBorderRadius(
                center, canvas, paint, borderRadius);
          },
          check: (strokeCap) {
            paint.style = PaintingStyle.stroke;
            paint.strokeWidth = 2.0;
            paint.strokeCap = strokeCap;
            _drawAnimatedCheck(center, canvas, paint);
          },
          squareOutlined: (borderRadius) {
            paint.style = PaintingStyle.stroke;
            _drawAnimatedSquare(center, canvas, paint, borderRadius);
          },
          diamondFilled: () {
            paint.style = PaintingStyle.fill;
            _drawAnimatedDiamond(center, canvas, paint, _dotRadius);
          },
          diamondOutlined: () {
            paint.style = PaintingStyle.stroke;
            _drawAnimatedDiamond(center, canvas, paint, _dotRadius);
          },
        );
      }
    }
  }

  /// Draws a diamond shape on the canvas at the specified center position.
  ///
  /// The diamond is drawn using the provided [paint] object and has a size determined by the [size] parameter.
  /// The [position] value is used to scale the size of the diamond, with a value of 0.0 resulting in no scaling and a value of 1.0 resulting in full scaling.
  ///
  /// The diamond is drawn by creating a [Path] object and using its methods to define the diamond's shape.
  /// The [moveTo] method is used to move the starting point to the top vertex of the diamond, and the [lineTo] method is used to draw the diamond's sides.
  /// The [close] method is called to close the path and complete the diamond shape.
  ///
  /// Finally, the diamond shape is drawn on the canvas using the [drawPath] method of the [Canvas] object.
  void _drawAnimatedDiamond(
      Offset center, Canvas canvas, Paint paint, double size) {
    final Path diamondPath = Path();
    diamondPath.moveTo(center.dx, center.dy - size * position.value);
    diamondPath.lineTo(center.dx + size * position.value, center.dy);
    diamondPath.lineTo(center.dx, center.dy + size * position.value);
    diamondPath.lineTo(center.dx - size * position.value, center.dy);
    diamondPath.close();
    canvas.drawPath(diamondPath, paint);
  }

  /// Draws a square on the canvas with the specified center, paint, and border radius.
  /// The size of the square is determined by the dot radius multiplied by the current position value.
  /// The square is rounded with the specified border radius.
  ///
  /// Parameters:
  /// - center: The center point of the square.
  /// - canvas: The canvas on which to draw the square.
  /// - paint: The paint used to fill the square.
  /// - borderRadius: The radius of the square's corners.
  void _drawAnimatedSquare(
      Offset center, Canvas canvas, Paint paint, double borderRadius) {
    final double radius = _dotRadius * position.value;
    final Rect squareRect = Rect.fromCenter(
      center: center,
      width: radius * 2,
      height: radius * 2,
    );
    final RRect roundedRect =
        RRect.fromRectAndRadius(squareRect, Radius.circular(borderRadius));
    canvas.drawRRect(roundedRect, paint);
  }

  /// Draws a square with rounded corners on the canvas at the specified center position.
  ///
  /// The square is drawn using the provided [paint] object and has a border radius
  /// specified by the [borderRadius] parameter. The size of the square is determined
  /// by the current animation position value multiplied by the dot radius.
  ///
  /// The [center] parameter specifies the center position of the square on the canvas.
  /// The [canvas] parameter is the canvas on which the square will be drawn.
  /// The [paint] parameter is the paint object used to define the appearance of the square.
  /// The [borderRadius] parameter specifies the radius of the rounded corners of the square.
  void _drawAnimatedSquareWithBorderRadius(
      Offset center, Canvas canvas, Paint paint, double borderRadius) {
    final double radius = _dotRadius * position.value;
    final Rect squareRect = Rect.fromCenter(
      center: center,
      width: radius * 2,
      height: radius * 2,
    );
    final RRect roundedRect =
        RRect.fromRectAndRadius(squareRect, Radius.circular(borderRadius));
    canvas.drawRRect(roundedRect, paint);
  }

  /// Draws a circle on the canvas at the specified center with the given paint.
  ///
  /// The size of the circle is determined by multiplying the dot radius by the current position value.
  ///
  /// Parameters:
  /// - center: The center point of the circle.
  /// - canvas: The canvas on which to draw the circle.
  /// - paint: The paint to use for drawing the circle.
  void _drawAnimatedCircle(Offset center, Canvas canvas, Paint paint) {
    canvas.drawCircle(center, _dotRadius * position.value, paint);
  }

  /// Draws a check mark at the specified [center] position on the [canvas].
  /// The check mark is drawn using the provided [paint].
  /// The size of the check mark is determined by the current animation [position].
  /// The check mark is drawn as a path consisting of three lines.
  /// The first line starts at the left side of the bounding rectangle of the check mark,
  /// at a position 25% from the top, and ends at a position 45% from the top.
  /// The second line starts at the left side of the bounding rectangle of the check mark,
  /// at a position 45% from the top, and ends at a position 75% from the top.
  /// The third line starts at the left side of the bounding rectangle of the check mark,
  /// at a position 75% from the top, and ends at a position 30% from the top.
  void _drawAnimatedCheck(Offset center, Canvas canvas, Paint paint) {
    final double radius = _dotRadius * position.value;
    final Rect checkRect = Rect.fromCircle(
      center: center,
      radius: radius,
    );
    final Path checkPath = Path()
      ..moveTo(checkRect.left + checkRect.width * 0.25,
          checkRect.top + checkRect.height * 0.5)
      ..lineTo(checkRect.left + checkRect.width * 0.45,
          checkRect.top + checkRect.height * 0.7)
      ..lineTo(checkRect.left + checkRect.width * 0.75,
          checkRect.top + checkRect.height * 0.3);
    canvas.drawPath(checkPath, paint);
  }

  /// Draws the outer circle shape on the canvas.
  ///
  /// The [center] parameter specifies the center point of the circle.
  /// The [canvas] parameter is the canvas on which the circle is drawn.
  /// The [paint] parameter is the paint used to draw the circle.
  void _drawOuterCircleShape(Offset center, Canvas canvas, Paint paint) {
    canvas.drawCircle(center, _radius, paint);
  }

  /// Draws a square with rounded corners on the canvas at the specified center position.
  ///
  /// The square is drawn using the provided [paint] object and has a border radius
  /// specified by the [borderRadius] parameter. The size of the square is determined
  /// by the dot radius.
  ///
  /// The [center] parameter specifies the center position of the square on the canvas.
  /// The [canvas] parameter is the canvas on which the square will be drawn.
  /// The [paint] parameter is the paint object used to define the appearance of the square.
  /// The [borderRadius] parameter specifies the radius of the rounded corners of the square.
  void _drawOuterSquareShapeWithBorderRadius(
      Offset center, Canvas canvas, Paint paint, double borderRadius,
      [double? givenRadius]) {
    final double radius = givenRadius ?? _radius;
    final Rect squareRect = Rect.fromCenter(
      center: center,
      width: radius * 2,
      height: radius * 2,
    );
    final RRect roundedRect =
        RRect.fromRectAndRadius(squareRect, Radius.circular(borderRadius));
    canvas.drawRRect(roundedRect, paint);
  }

  /// Draws a diamond shape on the canvas at the specified center position.
  ///
  /// The diamond is drawn using the provided [paint] object and has a size
  /// determined by the dot radius.
  ///
  /// The [center] parameter specifies the center position of the diamond on the canvas.
  /// The [canvas] parameter is the canvas on which the diamond will be drawn.
  /// The [paint] parameter is the paint object used to define the appearance of the diamond.
  void _drawDiamond(Offset center, Canvas canvas, Paint paint) {
    final double radius = _radius;
    final Path diamondPath = Path()
      ..moveTo(center.dx, center.dy - radius)
      ..lineTo(center.dx + radius, center.dy)
      ..lineTo(center.dx, center.dy + radius)
      ..lineTo(center.dx - radius, center.dy)
      ..close();
    canvas.drawPath(diamondPath, paint);
  }
}
