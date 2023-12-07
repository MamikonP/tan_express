import 'package:flutter/material.dart';

import '../../../core/extensions/number_extension.dart';
import '../../constants/gaps.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget(this.title, this.value,
      {this.color, this.isHeader = false, super.key});

  final String title;
  final String value;
  final Color? color;
  final bool isHeader;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Gaps.medium.allPadding,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(title,
                  style: TextStyle(
                      color: color ?? const Color(0xff8E8E93),
                      fontWeight: isHeader ? FontWeight.bold : null,
                      fontSize: isHeader ? 16 : 14)),
              Text(value,
                  style: TextStyle(
                      color: color ?? const Color(0xff8E8E93),
                      fontWeight: isHeader ? FontWeight.bold : null,
                      fontSize: isHeader ? 16 : 14)),
            ],
          ),
          Gaps.small.verticalSpace,
          const Divider(),
          Gaps.medium.verticalSpace,
        ],
      ),
    );
  }
}
