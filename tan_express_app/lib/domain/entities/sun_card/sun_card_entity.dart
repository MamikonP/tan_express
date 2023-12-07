class SunCardEntity {
  SunCardEntity(
      {required this.title, required this.value, this.selected = false});

  final String title;
  final String value;
  final bool selected;
}
