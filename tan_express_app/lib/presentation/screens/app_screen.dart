import 'package:flutter/material.dart';

import '../../core/assets_text.dart';
import '../../domain/entities/nav_bar/nav_bar_entity.dart';
import '../widgets/nav_bar/bottom_nav_bar.dart';

class AppScreen extends StatelessWidget {
  const AppScreen(
      {super.key,
      required this.body,
      this.appBar,
      this.background,
      this.withNavbar = false,
      this.backgroundColor = const Color(0xffF2F2F7),
      this.includeVersion = false});

  final Widget body;
  final AppBar? appBar;
  final Widget? background;
  final bool withNavbar;
  final bool includeVersion;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      backgroundColor: backgroundColor,
      bottomNavigationBar: withNavbar
          ? BottomNavBar(<NavBarEntity>[
              NavBarEntity(
                  label: 'notification', //TODO L10n.of(context).tr.clubs,
                  assetIcon: AssetsText.icBell),
              NavBarEntity(
                  label: 'headlight', //L10n.of(context).tr.discover,
                  assetIcon: AssetsText.icSun),
              NavBarEntity(
                  label: 'Profile', // L10n.of(context).tr.profile,
                  assetIcon: AssetsText.icSmile),
            ])
          : null,
      body: body,
    );
  }
}
