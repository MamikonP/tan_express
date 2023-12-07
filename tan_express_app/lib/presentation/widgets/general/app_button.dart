import 'package:flutter/material.dart';

import '../../../core/extensions/number_extension.dart';
import '../../constants/gaps.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.text,
    this.textStyle,
    this.backgroundColor,
    this.busyBackgroundColor,
    this.disabled = false,
    this.busy = false,
    this.onTap,
    this.height,
    this.width,
    this.radius = 3,
    this.padding,
    this.trailingIcon,
    this.shouldValidate = false,
    this.border,
    this.leadingIcon,
  })  : outline = false,
        super(key: key);

  const AppButton.outline({
    Key? key,
    required this.text,
    this.busyBackgroundColor,
    this.textStyle,
    this.onTap,
    this.width,
    this.height,
    this.padding,
    this.trailingIcon,
    this.radius = 3,
    this.shouldValidate = false,
    this.border,
    this.leadingIcon,
  })  : disabled = false,
        busy = false,
        outline = true,
        backgroundColor = Colors.transparent,
        super(key: key);

  final String text;
  final TextStyle? textStyle;
  final void Function()? onTap;
  final Color? backgroundColor;
  final Color? busyBackgroundColor;
  final bool disabled;
  final bool busy;
  final bool outline;
  final bool shouldValidate;
  final double? height;
  final double? width;
  final double radius;
  final EdgeInsets? padding;
  final Widget? trailingIcon;
  final Widget? leadingIcon;
  final Border? border;

  @override
  Widget build(BuildContext context) {
    final Widget textWidget = Text(
      text,
      textAlign: TextAlign.center,
      style: textStyle ??
          const TextStyle(fontSize: 12, fontWeight: FontWeight.w900),
    );
    return GestureDetector(
      onTap: shouldValidate
          ? onClick
          : !disabled
              ? onClick
              : null,
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          width: width,
          height: height,
          decoration: buttonBackground(context),
          padding: padding ?? EdgeInsets.all(Gaps.large),
          child: trailingIcon == null && leadingIcon == null
              ? textWidget
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    leadingIcon ?? const SizedBox.shrink(),
                    Gaps.medium.horizontalSpace,
                    textWidget,
                    Gaps.medium.horizontalSpace,
                    trailingIcon ?? const SizedBox.shrink()
                  ],
                )),
    );
  }

  void onClick() {
    if (!busy) {
      onTap?.call();
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  Decoration buttonBackground(BuildContext context) {
    return !outline
        ? BoxDecoration(
            color: !disabled ? backgroundColor : Colors.grey,
            borderRadius: BorderRadius.circular(radius),
            border: border)
        : BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(radius),
            border: border ??
                Border.all(
                  color: Colors.grey,
                ),
          );
  }
}
