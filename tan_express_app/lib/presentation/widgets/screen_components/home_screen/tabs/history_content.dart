import 'package:flutter/material.dart';

import '../../../../../core/constants/tider_type.dart';
import '../../../../../domain/entities/tider/tider_entity.dart';
import '../../../general/tider_details_widget.dart';

class HistoryContent extends StatelessWidget {
  const HistoryContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        TiderDetailsWidget<TiderEntity>('Alla Tiders Hammary', const <String>[
          'Datum',
          'Konstad',
          'Typ'
        ], <TiderEntity>[
          TiderEntity(
              date: '2022-06-25', cost: '10 kr', type: TiderType.Varukorg)
        ]),
        TiderDetailsWidget<TiderEntity>('Farsta centrum', const <String>[
          'Datum',
          'Konstad',
          'Typ'
        ], <TiderEntity>[
          TiderEntity(
              date: '2022-06-25', cost: '10 kr', type: TiderType.Varukorg),
          TiderEntity(
              date: '2022-06-10', cost: '10 kr', type: TiderType.Saldo),
          TiderEntity(
              date: '2022-06-08', cost: '132 kr', type: TiderType.Saldo),
        ]),
        TiderDetailsWidget<TiderEntity>('Knivsta', const <String>[
          'Datum',
          'Konstad',
          'Typ'
        ], <TiderEntity>[
          TiderEntity(
              date: '2022-06-26', cost: '10 kr', type: TiderType.Varukorg),
          TiderEntity(
              date: '2022-06-21', cost: '96 kr', type: TiderType.Saldo),
          TiderEntity(
              date: '2022-06-19', cost: '128 kr', type: TiderType.Saldo),
        ]),
      ],
    );
  }
}
