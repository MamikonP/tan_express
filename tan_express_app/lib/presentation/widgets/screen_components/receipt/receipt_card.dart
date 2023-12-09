import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import '../../../../core/assets_text.dart';
import '../../../../core/extensions/number_extension.dart';
import '../../../../domain/entities/tider/tider_entity.dart';
import '../../../constants/gaps.dart';
import '../../general/details_widget.dart';
import '../../general/header_widget.dart';
import '../../images/asset_image_widget.dart';

class _ReceiptTitle extends StatelessWidget {
  const _ReceiptTitle();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xffF2F2F7),
          borderRadius: BorderRadius.circular(8)),
      margin: Gaps.small.allPadding,
      padding: Gaps.large.allPadding,
      child: const HeaderWidget(
        title: 'TanExpress Brommaplan',
        description: 'Brommaplan 403168 75 Bromma',
        textAlign: TextAlign.left,
      ),
    );
  }
}

class ReceiptCard extends StatelessWidget {
  const ReceiptCard(this.entity, {super.key});

  final TiderEntity entity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Gaps.large.allPadding,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: Gaps.large.allPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const _ReceiptTitle(),
              DetailsWidget('Produkt:', value: entity.type.name),
              const DetailsWidget('Betalsätt:',
                  valueWidget:
                      AssetImageWidget.png(imageName: AssetsText.imgSwish)),
              DetailsWidget('Starttid:', value: entity.date),
              const DetailsWidget('Tid:', value: 'kl. 18:22:07'),
              DetailsWidget('Summa:',
                  valueWidget: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text('-${entity.cost}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const Text(
                        'Varav moms 11 kr',
                        style: TextStyle(color: Color(0xff8E8E93)),
                      ),
                    ],
                  )),
              Gaps.medium.verticalSpace,
              const DottedLine(dashColor: Colors.grey),
              Gaps.large.verticalSpace,
              Row(
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xff34C759)),
                    padding: Gaps.smallest.allPadding,
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 12,
                    ),
                  ),
                  Gaps.small.horizontalSpace,
                  const Text(
                    'Genomförd',
                    style: TextStyle(
                        color: Color(0xff34C759),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Gaps.large.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
