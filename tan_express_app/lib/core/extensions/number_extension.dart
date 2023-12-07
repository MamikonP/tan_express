import 'package:flutter/material.dart';

extension NumberExtension on double {
  EdgeInsets get horizontalPadding => EdgeInsets.symmetric(horizontal: this);
  EdgeInsets get verticalPadding => EdgeInsets.symmetric(vertical: this);
  EdgeInsets get topPadding => EdgeInsets.only(top: this);
  EdgeInsets get bottomPadding => EdgeInsets.only(bottom: this);
  EdgeInsets get rightPadding => EdgeInsets.only(right: this);
  EdgeInsets get leftPadding => EdgeInsets.only(left: this);
  EdgeInsets get allPadding => EdgeInsets.all(this);

  SizedBox get horizontalSpace => SizedBox(width: this);
  SizedBox get verticalSpace => SizedBox(height: this);
}
