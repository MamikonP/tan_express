import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/assets_text.dart';
import '../../../../../core/extensions/number_extension.dart';
import '../../../../../core/router/app_routes.dart';
import '../../../../../domain/entities/sun_card/sun_card_entity.dart';
import '../../../../../logic/navigation/navigation_cubit.dart';
import '../../../../constants/gaps.dart';
import '../../../general/app_button.dart';
import '../../../general/details_widget.dart';
import '../../../images/asset_image_widget.dart';

class MyProfileContent extends StatelessWidget {
  const MyProfileContent(this.sunCards, {super.key});

  final List<SunCardEntity> sunCards;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const Center(
            child: AssetImageWidget.svg(
          imageName: AssetsText.icSmile,
          width: 100,
          height: 100,
          color: Color(0xffAF52DE),
        )),
        Gaps.larger.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            AppButton(
              text: 'Ändra uppgifter',
              trailingIcon: const Icon(Icons.chevron_right_sharp),
              radius: 100,
              backgroundColor: const Color(0xffE5E5EA),
              onTap: () => context
                  .read<NavigationCubit>()
                  .push(context, AppRoutes.details),
            ),
            AppButton(
              text: 'Inställningar',
              trailingIcon: const Icon(Icons.chevron_right_sharp),
              radius: 100,
              backgroundColor: const Color(0xffE5E5EA),
              onTap: () {},
            ),
          ],
        ),
        Gaps.larger.verticalSpace,
        const DetailsWidget(
          'Mina solkort',
          value: 'Saldo',
          color: Colors.black,
          isHeader: true,
        ),
        ...sunCards
            .map((SunCardEntity e) => DetailsWidget(
                  e.title,
                  value: e.value,
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
    );
  }
}
