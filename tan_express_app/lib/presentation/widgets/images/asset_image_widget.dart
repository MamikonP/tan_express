import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/image_type.dart';

class AssetImageWidget extends StatelessWidget {
  const AssetImageWidget.png(
      {required this.imageName,
      this.boxFit = BoxFit.cover,
      this.width,
      this.height,
      super.key})
      : imageType = ImageType.png,
        color = null;

  const AssetImageWidget.svg(
      {required this.imageName,
      this.boxFit = BoxFit.cover,
      this.width,
      this.height,
      this.color,
      super.key})
      : imageType = ImageType.svg;

  final ImageType imageType;
  final Color? color;
  final String imageName;
  final BoxFit boxFit;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    if (imageType == ImageType.svg) {
      return SvgPicture.asset(
        imageName,
        fit: boxFit,
        height: height,
        width: width,
        colorFilter:
            color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
      );
    }
    return Image.asset(
      imageName,
      fit: boxFit,
      height: height,
      width: width,
    );
  }
}
