import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  const GradientButton(
      {super.key, this.colors, this.width, this.height, this.borderRadius, this.onPressed, required this.child});

  //渐变色数组
  final List<Color>? colors;

  // 按钮宽高
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;

  //点击回调
  final GestureTapCallback? onPressed;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    //确保colors数组不空
    List<Color> _colors = colors ?? [theme.primaryColor, theme.primaryColorDark];

    return DecoratedBox(
      decoration: BoxDecoration(gradient: LinearGradient(colors: _colors), borderRadius: borderRadius),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor: _colors.last,
          highlightColor: Colors.transparent,
          borderRadius: borderRadius,
          onTap: onPressed,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: height, width: width),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultTextStyle(style: const TextStyle(fontWeight: FontWeight.bold), child: child),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
