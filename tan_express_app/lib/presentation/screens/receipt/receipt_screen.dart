import 'package:flutter/material.dart';

import '../../../domain/entities/tider/tider_entity.dart';
import '../../widgets/screen_components/receipt/receipt_card.dart';
import '../app_screen.dart';

class ReceiptScreen extends StatelessWidget {
  const ReceiptScreen(this.entity, {super.key});

  final TiderEntity? entity;

  @override
  Widget build(BuildContext context) {
    return AppScreen(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          titleSpacing: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
          title: Text(
            'Kvitto',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: entity == null ? const SizedBox.shrink() : ReceiptCard(entity!));
  }
}
