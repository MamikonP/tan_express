import 'package:flutter/material.dart';

class DefaultDecoration extends InputDecoration {
  const DefaultDecoration.of(this.context);

  final BuildContext context;

  @override
  TextStyle? get hintStyle => const TextStyle(color: Colors.grey);

  @override
  TextStyle? get labelStyle => const TextStyle(
      fontSize: 10, fontWeight: FontWeight.w700, color: Colors.black);

  @override
  InputBorder? get enabledBorder => _outlineInputBorder;

  @override
  InputBorder? get border => _outlineInputBorder;

  @override
  TextStyle? get errorStyle => const TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w700,
      color: Colors.red,
      height: 0.2);

  @override
  InputBorder? get errorBorder => OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
      borderSide: const BorderSide(
          color: Colors.red, width: 0, style: BorderStyle.none));

  @override
  InputBorder? get focusedErrorBorder => OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
      borderSide: const BorderSide(
          color: Colors.red, width: 0, style: BorderStyle.none));

  OutlineInputBorder get _outlineInputBorder => OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
      borderSide: const BorderSide(color: Colors.transparent, width: 0));

  @override
  OutlineInputBorder? get focusedBorder => OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
      borderSide: const BorderSide(width: 0));
}
