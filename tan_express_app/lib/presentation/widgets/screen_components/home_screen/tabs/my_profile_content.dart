import 'package:flutter/material.dart';

import '../../../../../core/assets_text.dart';
import '../../../../../core/extensions/number_extension.dart';
import '../../../../../domain/entities/sun_card/sun_card_entity.dart';
import '../../../../constants/gaps.dart';
import '../../../general/app_button.dart';
import '../../../general/details_widget.dart';
import '../../../images/asset_image_widget.dart';

class MyProfileContent extends StatelessWidget {
  const MyProfileContent(this.sunCards, {super.key});

  final List<SunCardEntity> sunCards;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Gaps.large.allPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Center(
              child: AssetImageWidget.svg(
                  imageName: AssetsText.icSmile, width: 100, height: 100)),
          Gaps.larger.verticalSpace,
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              AppButton(
                text: 'Ändra uppgifter',
                trailingIcon: Icon(Icons.chevron_right_sharp),
                radius: 100,
                backgroundColor: Color(0xffE5E5EA),
              ),
              AppButton(
                text: 'Inställningar',
                trailingIcon: Icon(Icons.chevron_right_sharp),
                radius: 100,
                backgroundColor: Color(0xffE5E5EA),
              ),
            ],
          ),
          Gaps.larger.verticalSpace,
          const DetailsWidget(
            'Mina solkort',
            'Saldo',
            color: Colors.black,
            isHeader: true,
          ),
          ...sunCards
              .map((SunCardEntity e) => DetailsWidget(
                    e.title,
                    e.value,
                    color: e.selected ? const Color(0xffAF52DE) : null,
                  ))
              .toList(),
          Gaps.large.verticalSpace,
          const AppButton(
            text: 'Logga ut',
            radius: 100,
            backgroundColor: Color(0xffFF9500),
            textStyle: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w800, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
