import 'dart:math';

import 'package:flutter/material.dart';

/// Bar which acts as the building blocks for the [LCDNumberText].
class _BuildingBar extends StatelessWidget {
  /// returns a bar using the given
  /// [height], [width] and [barColor].
  ///
  /// It paints a small shadow with 80% of aplha around the bar.
  ///
  /// The spread and blur radius is the minimum of height and width clamped
  /// between 1 and 15.
  const _BuildingBar({
    required this.height,
    required this.width,
    this.barColor = Colors.grey,
  }) : assert(height >= 0 && width >= 0);

  /// height of the bar
  final double height;

  /// width of the bar
  final double width;

  /// color of the bar
  final Color barColor;

  @override
  Widget build(BuildContext context) {
    final blurAndSpreadRadius = min(height, width).clamp(1.0, 15.0);
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(50), boxShadow: [
        BoxShadow(
          color: barColor.withAlpha(barColor.alpha ~/ 1.25),
          blurRadius: blurAndSpreadRadius,
          spreadRadius: blurAndSpreadRadius,
          offset: const Offset(
            0.0,
            0.0,
          ),
        ),
      ]),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: barColor,
        ),
      ),
    );
  }
}

/// A digital LCD display for numbers.
class LCDNumberText extends StatelessWidget {
  /// builds a digital LCD display for numbers.
  ///
  /// It takes the following parameters:
  /// * [number] - the number to be displayed. Range is [0, 9].
  /// * [color] - the color of the LCD display. (optional)
  /// * [disabledColor] - the color of the LCD display when it is disabled.
  ///   (optional)
  ///
  /// If [color] is not provided, it will default to primary color of the theme.
  ///
  /// If [disabledColor] is not provided, it will be set to [color] with
  /// an alpha value of 10%.
  ///
  /// Failure situations:
  /// - If the [number] is not in the range [0, 9], it will throw an error.
  /// - If the height for the widget is not sufficient,
  /// it will throw an exception.
  ///
  /// Example Usage:
  /// ```dart
  /// LCDNumberText(
  ///   number: 1,
  ///   color: Colors.red,
  ///   disabledColor: Colors.grey.shade300,
  /// ),
  /// ```
  const LCDNumberText({
    super.key,
    required this.number,
    this.color,
    this.disabledColor,
  }) : assert(number >= 0 && number <= 9);

  /// the number to be displayed.
  final int number;
  
  /// the color of the LCD display. (optional)
  ///
  /// If not provided, it will default to primary color of the theme.
  final Color? color;

  /// disabled color of the LCD display. (optional)
  ///
  /// If not provided, it will be set to [color] with an alpha value of 10%.
  final Color? disabledColor;

  @override
  Widget build(BuildContext context) {
    final Color color = this.color ?? Theme.of(context).primaryColor;
    final Color disabledColor =
        this.disabledColor ?? color.withAlpha(color.alpha ~/ 10);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: LayoutBuilder(
        builder: ((context, constraints) {
          double height = constraints.maxHeight;
          double width = constraints.maxWidth;

          if (height == double.infinity && width == double.infinity) {
            height = 104;
          } else if (height > width * 23 / 12) {
            height = width * 23 / 12;
          }

          if (height <= 0) {
            throw Exception('height of the widget must be greater than 56');
          }

          final double barLength = height * 10 / 23;
          final double barWidth = barLength / 10;

          return Center(
            child: SizedBox(
              height: (barLength * 2) + (barWidth * 3),
              width: (barLength) + (barWidth * 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _BuildingBar(
                    height: barWidth,
                    width: barLength,
                    barColor: (number == 2 ||
                            number == 3 ||
                            number == 5 ||
                            number == 6 ||
                            number == 7 ||
                            number == 8 ||
                            number == 9 ||
                            number == 0)
                        ? color
                        : disabledColor,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _BuildingBar(
                        height: barLength,
                        width: barWidth,
                        barColor: (number == 4 ||
                                number == 5 ||
                                number == 6 ||
                                number == 8 ||
                                number == 9 ||
                                number == 0)
                            ? color
                            : disabledColor,
                      ),
                      _BuildingBar(
                        height: barLength,
                        width: barWidth,
                        barColor: (number == 1 ||
                                number == 2 ||
                                number == 3 ||
                                number == 4 ||
                                number == 7 ||
                                number == 8 ||
                                number == 9 ||
                                number == 0)
                            ? color
                            : disabledColor,
                      ),
                    ],
                  ),
                  _BuildingBar(
                    height: barWidth,
                    width: barLength,
                    barColor: (number == 2 ||
                            number == 3 ||
                            number == 4 ||
                            number == 5 ||
                            number == 6 ||
                            number == 8 ||
                            number == 9)
                        ? color
                        : disabledColor,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _BuildingBar(
                        height: barLength,
                        width: barWidth,
                        barColor: (number == 2 ||
                                number == 6 ||
                                number == 8 ||
                                number == 0)
                            ? color
                            : disabledColor,
                      ),
                      _BuildingBar(
                        height: barLength,
                        width: barWidth,
                        barColor: (number == 1 ||
                                number == 3 ||
                                number == 4 ||
                                number == 5 ||
                                number == 6 ||
                                number == 7 ||
                                number == 8 ||
                                number == 9 ||
                                number == 0)
                            ? color
                            : disabledColor,
                      ),
                    ],
                  ),
                  _BuildingBar(
                    height: barWidth,
                    width: barLength,
                    barColor: (number == 2 ||
                            number == 3 ||
                            number == 5 ||
                            number == 6 ||
                            number == 8 ||
                            number == 9 ||
                            number == 0)
                        ? color
                        : disabledColor,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
