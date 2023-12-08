import '../../../core/constants/tider_type.dart';

class TiderEntity {
  TiderEntity({required this.date, required this.cost, required this.type});

  final String date;
  final String cost;
  final TiderType type;
}
