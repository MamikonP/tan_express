import 'package:flutter/material.dart';
import 'package:flutter_platform_alert/flutter_platform_alert.dart';

Future<void> showPopup(
  BuildContext context, {
  required String title,
  required String content,
  void Function()? onYesAction,
  void Function()? onNoAction,
}) async {
  final AlertButton button = await FlutterPlatformAlert.showAlert(
    windowTitle: title,
    text: content,
    alertStyle: AlertButtonStyle.yesNo,
    iconStyle: IconStyle.information,
  );
  if (button == AlertButton.yesButton) {
    onYesAction?.call();
  } else if (button == AlertButton.noButton) {
    onNoAction?.call();
  }
}
