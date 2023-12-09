import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/extensions/number_extension.dart';
import '../../../core/router/app_routes.dart';
import '../../../domain/entities/tider/tider_entity.dart';
import '../../../logic/navigation/navigation_cubit.dart';
import '../../constants/gaps.dart';
import 'header_widget.dart';

class TiderDetailsWidget<T extends TiderEntity> extends StatelessWidget {
  const TiderDetailsWidget(this.header, this.headerRow, this.content,
      {this.onClick, super.key});

  final String header;
  final List<String> headerRow;
  final List<T> content;
  final void Function(T entity)? onClick;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      HeaderWidget(title: header, textAlign: TextAlign.start),
      Gaps.medium.verticalSpace,
      Row(
        children: headerRow
            .map((String e) => Expanded(
                  child: Text(e.toUpperCase(),
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 10)),
                ))
            .toList(),
        // const Color(0xff8E8E93)
      ),
      Gaps.small.verticalSpace,
      const Divider(),
      Gaps.small.verticalSpace,
      ...content
          .map(
            (TiderEntity e) => Column(
              children: <Widget>[
                Padding(
                  padding: Gaps.medium.allPadding,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(e.date,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                color: Color(0xff8E8E93), fontSize: 14)),
                      ),
                      Expanded(
                        child: Text(e.cost,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                color: Color(0xff8E8E93), fontSize: 14)),
                      ),
                      Expanded(
                        child: Text(e.type.name,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                color: Color(0xff8E8E93), fontSize: 14)),
                      ),
                      GestureDetector(
                          onTap: () {
                            onClick?.call(e as T);
                            context
                                .read<NavigationCubit>()
                                .push(context, AppRoutes.receipt, arguments: e);
                          },
                          child: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Color(0xffAF52DE),
                          ))
                    ],
                  ),
                ),
                Gaps.small.verticalSpace,
                const Divider(),
              ],
            ),
          )
          .toList(),
      Gaps.small.verticalSpace,
    ]);
  }
}
