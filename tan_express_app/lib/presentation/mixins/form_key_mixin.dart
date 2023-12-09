import 'package:flutter/material.dart';

mixin FormKeyMixin {
  final GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState<dynamic>> fullNameFormKey =
      GlobalKey<FormFieldState<dynamic>>();
  final GlobalKey<FormFieldState<dynamic>> emailFormKey =
      GlobalKey<FormFieldState<dynamic>>();
}
