import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:ui' show FontFeature;

class MJAnimatedFlipCounterPage extends StatefulWidget {
  const MJAnimatedFlipCounterPage({super.key});

  @override
  State<MJAnimatedFlipCounterPage> createState() => _MJAnimatedFlipCounterPageState();
}

class _MJAnimatedFlipCounterPageState extends State<MJAnimatedFlipCounterPage> {
  double _value = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('数字滚动动画效果'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedFlipCounter(
                value: 10000 + _value,
                fractionDigits: 2,
                wholeDigits: 8,
                hideLeadingZeroes: true,
                thousandSeparator: ',',
              ),
              const SizedBox(height: 50.0),
              FilledButton(
                  onPressed: () {
                    setState(() {
                      _value += 100;
                    });
                  },
                  child: const Text('点击我+10000')),
            ],
          ),
        ));
  }
}

class AnimatedFlipCounter extends StatelessWidget {
  /// The value of this counter.
  ///
  /// When a new value is specified, the counter will automatically animate
  /// from its old value to the new value.
  final num value;

  /// Animation duration for the value to change.
  /// Default value is 300 ms.
  final Duration duration;

  /// Animation duration for the negative sign to appear and disappear.
  /// Default value is 150 ms, so it feels snappy.
  final Duration negativeSignDuration;

  /// The curve to apply when animating the value of this counter.
  final Curve curve;

  /// If non-null, the style to use for the counter text.
  ///
  /// Similar to the TextStyle property of Text widget, the style will
  /// be merged with the closest enclosing [DefaultTextStyle].
  final TextStyle? textStyle;

  /// Optional text to display before the counter. e.g. `$` + `-100` = `$-100`.
  final String? prefix;

  /// Optional text to display before the counter, but after the negative
  /// sign if it's present. e.g. insert `$` to `-100` results in `-$100`.
  final String? infix;

  /// Optional text to display after the counter.
  final String? suffix;

  /// How many digits to display, after the decimal point.
  ///
  /// The actual [value] will be rounded to the nearest digit.
  final int fractionDigits;

  /// How many digits to display, before the decimal point.
  ///
  /// For example, `wholeDigits: 4` means it will pad `48` into `0048`.
  /// Default value is `1`, setting it to `0` would turn `0.7` into `.7`.
  /// If the actual [value] has more digits, this property will be ignored.
  ///
  /// See [hideLeadingZeroes] to hide these leading zeroes while maintaining
  /// flipping animation when the number of digits changes, e.g. from 99 to 100.
  final int wholeDigits;

  /// Whether to hide leading zeroes, useful when combined with [wholeDigits]
  /// to create a smoother animation when the number of digits increases.
  ///
  /// For example, when animating from 99 to 500, the "5" is added as a new
  /// digit, which would appear abruptly with no animation. By setting
  /// [wholeDigits] to 3, we can make "99" into "099", which makes the animation
  /// from 99 to 500 smoother. If you don't want to see "099", set this to true.
  /// This way, we still do the preparation work of adding leading zeroes, but
  /// nothing is visible to the user.
  ///
  /// Adding leading zeroes can have performance cost. It's advised to set
  /// [wholeDigits] to account for a reasonable maximum value to cover most
  /// cases. When the number of digits exceeds [wholeDigits], the extra
  /// digits will still appear correctly, but without animation.
  final bool hideLeadingZeroes;

  /// Insert a symbol between every 3 digits, for example: 1,000,000.
  ///
  /// Typical symbol is either a comma or a period, based on locale. Default
  /// value is null, which disables this feature.
  final String? thousandSeparator;

  /// Insert a symbol between the integer part and the fractional part.
  ///
  /// Default value is a period. Can be changed to a comma for certain locale.
  final String decimalSeparator;

  /// How the digits should be placed. Can be used to control text alignment.
  ///
  /// Default value is `MainAxisAlignment.center`, which aligns the digits to
  /// the center, similar to `TextAlign.center`. To mimic `TextAlign.start`,
  /// set the value to `MainAxisAlignment.start`.
  final MainAxisAlignment mainAxisAlignment;

  /// Add padding for every digit, defaults is none.
  final EdgeInsets padding;

  const AnimatedFlipCounter({
    Key? key,
    required this.value,
    this.duration = const Duration(milliseconds: 300),
    this.negativeSignDuration = const Duration(milliseconds: 150),
    this.curve = Curves.linear,
    this.textStyle,
    this.prefix,
    this.infix,
    this.suffix,
    this.fractionDigits = 0,
    this.wholeDigits = 1,
    this.hideLeadingZeroes = false,
    this.thousandSeparator,
    this.decimalSeparator = '.',
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.padding = EdgeInsets.zero,
  })  : assert(fractionDigits >= 0, 'fractionDigits must be non-negative'),
        assert(wholeDigits >= 0, 'wholeDigits must be non-negative'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // Merge the text style with the default style, and request tabular figures
    // for consistent width of digits (if supported by the font).
    final style = DefaultTextStyle.of(context)
        .style
        .merge(textStyle)
        .merge(const TextStyle(fontFeatures: [FontFeature.tabularFigures()]));

    // Layout number "0" (probably the widest digit) to see its size
    final prototypeDigit = TextPainter(
      text: TextSpan(text: '0', style: style),
      textDirection: TextDirection.ltr,
      textScaler: MediaQuery.textScalerOf(context),
    )..layout();

    // Find the text color (or red as warning). This is so we can avoid using
    // `Opacity` and `AnimatedOpacity` widget, for better performance.
    final Color color = style.color ?? const Color(0xffff0000);

    // Convert the decimal value to int. For example, if we want 2 decimal
    // places, we will convert 5.21 into 521.
    final int value = (this.value * math.pow(10, fractionDigits)).round();

    // Split the integer value into separate digits.
    // For example, to draw 123, we split it into [1, 12, 123].
    // This is because more significant digits do not care what happens to
    // lower digits, but lower digits (like 3) need to know what happens to
    // more significant digits. For example, 123 add 10 becomes 133. In this
    // case, 1 stays the same, 2 flips into a 3, but 3 needs to flip 10 times
    // to reach 3 again, instead of staying static.
    List<int> digits = value == 0 ? [0] : [];
    int v = value.abs();
    while (v > 0) {
      digits.add(v);
      v = v ~/ 10;
    }
    while (digits.length < wholeDigits + fractionDigits) {
      digits.add(0); // padding leading zeroes
    }
    digits = digits.reversed.toList(growable: false);

    // Generate the widgets needed for digits before the decimal point.
    final integerWidgets = <Widget>[];
    for (int i = 0; i < digits.length - fractionDigits; i++) {
      final digit = _SingleDigitFlipCounter(
        key: ValueKey(digits.length - i),
        value: digits[i].toDouble(),
        duration: duration,
        curve: curve,
        size: prototypeDigit.size,
        color: color,
        padding: padding,
        // We might want to hide leading zeroes. The way we split digits, only
        // leading zeroes have "true zero" value. E.g. five hundred, 0500 is
        // split into [0, 5, 50, 500]. Since 50 and 500 are not 0, they are
        // always visible. But we should not show 0.48 as .48 so the last
        // zero before decimal point is always visible.
        visible: hideLeadingZeroes ? digits[i] != 0 || i == digits.length - fractionDigits - 1 : true,
      );
      integerWidgets.add(digit);
    }

    // Insert "thousand separator" widgets if needed.
    if (thousandSeparator != null) {
      // Find the first digit that's NOT a HIDDEN leading zero.
      // For example, "000123", if users want to hide leading zeroes, then
      // the first visible digit is the "1", at index 3.
      // But if users do not want to hide leading zeroes, then the first
      // visible digit is the first "0", at index 0.
      // This is so we know when to stop inserting separators. We don't want
      // something like ",,,123,456" if leading zeroes are hidden.
      int firstVisibleDigitIndex = 0;
      if (hideLeadingZeroes) {
        // Find the first digit that's not zero.
        firstVisibleDigitIndex = digits.indexWhere((d) => d != 0);
        // If all digits are zero, then the first visible digit is the last one.
        // E.g. the first visible digit for "0000" is the last "0" at index 3.
        if (firstVisibleDigitIndex == -1) {
          firstVisibleDigitIndex = digits.length - 1;
        }
      }
      // Insert a separator every 3 widgets counting backwards, until we reach
      // the first digit that's still visible.
      int counter = 0;
      for (int i = integerWidgets.length; i > firstVisibleDigitIndex; i--) {
        if (counter > 0 && counter % 3 == 0) {
          integerWidgets.insert(i, Text(thousandSeparator!));
        }
        counter++;
      }
    }

    return DefaultTextStyle.merge(
      style: style,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: mainAxisAlignment,
        // Even in RTL languages, numbers should always be displayed LTR.
        textDirection: TextDirection.ltr,
        children: [
          if (prefix != null) Text(prefix!),
          // Draw the negative sign (-), if exists
          ClipRect(
            child: TweenAnimationBuilder(
              // Animate the negative sign (-) appearing and disappearing
              duration: negativeSignDuration,
              tween: Tween(end: value < 0 ? 1.0 : 0.0),
              builder: (_, double v, __) => Center(
                widthFactor: v,
                child: Opacity(opacity: v, child: const Text('-')),
              ),
            ),
          ),
          if (infix != null) Text(infix!),
          // Draw digits before the decimal point
          ...integerWidgets,
          // Draw the decimal point
          if (fractionDigits != 0) Text(decimalSeparator),
          // Draw digits after the decimal point
          for (int i = digits.length - fractionDigits; i < digits.length; i++)
            _SingleDigitFlipCounter(
              key: ValueKey('decimal$i'),
              value: digits[i].toDouble(),
              duration: duration,
              curve: curve,
              size: prototypeDigit.size,
              color: color,
              padding: padding,
            ),
          if (suffix != null) Text(suffix!),
        ],
      ),
    );
  }
}

class _SingleDigitFlipCounter extends StatelessWidget {
  final double value;
  final Duration duration;
  final Curve curve;
  final Size size;
  final Color color;
  final EdgeInsets padding;
  final bool visible; // user can choose to hide leading zeroes

  const _SingleDigitFlipCounter({
    Key? key,
    required this.value,
    required this.duration,
    required this.curve,
    required this.size,
    required this.color,
    required this.padding,
    this.visible = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(end: value),
      duration: duration,
      curve: curve,
      builder: (_, double value, __) {
        final whole = value ~/ 1;
        final decimal = value - whole;
        final w = size.width + padding.horizontal;
        final h = size.height + padding.vertical;

        return SizedBox(
          width: visible ? w : 0,
          height: h,
          child: Stack(
            children: <Widget>[
              _buildSingleDigit(
                digit: whole % 10,
                offset: h * decimal,
                opacity: 1 - decimal,
              ),
              _buildSingleDigit(
                digit: (whole + 1) % 10,
                offset: h * decimal - h,
                opacity: decimal,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSingleDigit({
    required int digit,
    required double offset,
    required double opacity,
  }) {
    // Try to avoid using the `Opacity` widget when possible, for performance.
    final Widget child;
    if (color.opacity == 1) {
      // If the text style does not involve transparency, we can modify
      // the text color directly.
      child = Text(
        '$digit',
        textAlign: TextAlign.center,
        style: TextStyle(color: color.withOpacity(opacity.clamp(0, 1))),
      );
    } else {
      // Otherwise, we have to use the `Opacity` widget (less performant).
      child = Opacity(
        opacity: opacity.clamp(0, 1),
        child: Text(
          '$digit',
          textAlign: TextAlign.center,
        ),
      );
    }
    return Positioned(
      left: 0,
      right: 0,
      bottom: offset + padding.bottom,
      child: child,
    );
  }
}
