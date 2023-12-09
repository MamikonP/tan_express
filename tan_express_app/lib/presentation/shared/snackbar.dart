import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../core/extensions/number_extension.dart';
import '../constants/gaps.dart';

class CustomSnackbar {
  CustomSnackbar.of(this._context);

  final BuildContext _context;

  Material _showSnackbar(String message, Color color) => Material(
        color: Colors.white,
        elevation: 3.0,
        borderRadius: BorderRadius.circular(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 4,
              height: 30,
              margin: Gaps.large.allPadding,
              color: color,
            ),
            Expanded(
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                titleAlignment: ListTileTitleAlignment.center,
                leading: Container(
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: color),
                  padding: Gaps.smallest.allPadding,
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 12,
                  ),
                ),
                title: Text(message,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
              ),
            ),
          ],
        ),
      );

  void showErrorSnackbar(String message) =>
      showTopSnackBar(Overlay.of(_context), _showSnackbar(message, Colors.red),
          snackBarPosition: SnackBarPosition.bottom);

  void showSuccessSnackbar(String message) => showTopSnackBar(
      Overlay.of(_context), _showSnackbar(message, const Color(0xff34C759)),
      snackBarPosition: SnackBarPosition.bottom);
}
