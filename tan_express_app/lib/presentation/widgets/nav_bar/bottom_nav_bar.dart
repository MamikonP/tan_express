import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/extensions/number_extension.dart';
import '../../../domain/entities/nav_bar/nav_bar_entity.dart';
import '../../../logic/navigation/navigation_cubit.dart';
import '../../constants/gaps.dart';
import '../images/asset_image_widget.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar(this.entities, {super.key});

  final List<NavBarEntity> entities;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: widget.entities
          .asMap()
          .entries
          .map((MapEntry<int, NavBarEntity> entry) => BottomNavigationBarItem(
              icon: Padding(
                padding: Gaps.medium.allPadding,
                child: AssetImageWidget.svg(
                  imageName: entry.value.assetIcon,
                  color:
                      currentIndex == entry.key ? Colors.purple : Colors.grey,
                ),
              ),
              label: entry.value.label,
              tooltip: entry.value.label))
          .toList(),
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.purple,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int value) {
        setState(() {
          currentIndex = value;
        });
        context.read<NavigationCubit>().changeNavBar(value);
      },
    );
  }
}
