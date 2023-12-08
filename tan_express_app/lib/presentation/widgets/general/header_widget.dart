import 'package:flutter/material.dart';

import '../../../core/extensions/number_extension.dart';
import '../../constants/gaps.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget(
      {super.key,
      this.title,
      this.description,
      this.padding,
      this.spans,
      this.header,
      this.mainAxisAlignment,
      this.textAlign = TextAlign.center});

  final String? title;
  final String? description;
  final List<InlineSpan>? spans;
  final EdgeInsets? padding;
  final Widget? header;
  final MainAxisAlignment? mainAxisAlignment;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          if (header != null) ...<Widget>[
            header!,
            Gaps.medium.verticalSpace,
          ],
          if (title != null)
            Text(
              title!,
              textAlign: textAlign,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          Gaps.medium.verticalSpace,
          if (description != null || spans != null)
            Text.rich(
                description != null
                    ? TextSpan(text: description)
                    : TextSpan(children: spans),
                textAlign: textAlign,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.grey))
        ],
      ),
    );
  }
}
