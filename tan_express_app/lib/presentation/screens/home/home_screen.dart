import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/extensions/number_extension.dart';
import '../../../domain/entities/sun_card/sun_card_entity.dart';
import '../../../logic/navigation/navigation_cubit.dart';
import '../../constants/gaps.dart';
import '../../widgets/screen_components/home_screen/tabs/history_content.dart';
import '../../widgets/screen_components/home_screen/tabs/my_profile_content.dart';
import '../app_screen.dart';

class _PersistentHeader extends SliverPersistentHeaderDelegate {
  _PersistentHeader(this.widget);
  final Widget widget;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Center(child: widget),
    );
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      withNavbar: true,
      body: SafeArea(child: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (BuildContext context, NavigationState state) {
          return PageView.builder(
            controller: state.pageController,
            itemCount: 3,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) => NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) => <Widget>[
                SliverAppBar(
                    pinned: true,
                    backgroundColor: Colors.white,
                    automaticallyImplyLeading: false,
                    elevation: 0,
                    surfaceTintColor: Colors.transparent,
                    titleSpacing: 0,
                    centerTitle: true,
                    forceElevated: innerBoxIsScrolled,
                    title: Text(
                      'Header',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    )),
                if (state.index == 2)
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: _PersistentHeader(Container(
                      padding: Gaps.smallest.allPadding,
                      margin: Gaps.medium.bottomPadding
                          .copyWith(left: Gaps.large, right: Gaps.large),
                      decoration: BoxDecoration(
                          color: const Color(0xffE5E5EA),
                          borderRadius: BorderRadius.circular(100)),
                      child: TabBar(
                          indicatorSize: TabBarIndicatorSize.tab,
                          dividerColor: Colors.transparent,
                          overlayColor: const MaterialStatePropertyAll<Color>(
                              Colors.transparent),
                          labelPadding: Gaps.medium.allPadding,
                          indicatorColor: Colors.white,
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.black,
                          labelStyle: const TextStyle(color: Colors.black),
                          controller: _tabController,
                          indicator: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100)),
                          padding: EdgeInsets.zero,
                          onTap: (int value) {
                            // context.read<TodoBloc>().add(UpdateToDoPageEvent(value));
                          },
                          tabs: const <Widget>[
                            Text('Min Profil'),
                            Text('Historik'),
                          ]),
                    )),
                  ),
              ],
              body: state is NavigationNavBarUpdated
                  ? switch (state.index) {
                      1 => const Placeholder(),
                      2 => TabBarView(
                          controller: _tabController,
                          children: <Widget>[
                            SingleChildScrollView(
                              child: Padding(
                                padding: Gaps.large.allPadding,
                                child: MyProfileContent(<SunCardEntity>[
                                  SunCardEntity(
                                      title: 'Kista Galleria', value: '0 kr'),
                                  SunCardEntity(
                                      title: 'TanExpress Brommaplan',
                                      value: '90 kr',
                                      selected: true),
                                  SunCardEntity(
                                      title: 'Farsta Centrum', value: '0 kr'),
                                  SunCardEntity(
                                      title: 'Huddinge Centrum',
                                      value: '120 kr')
                                ]),
                              ),
                            ),
                            SingleChildScrollView(
                              child: Padding(
                                padding: Gaps.large.allPadding,
                                child: const HistoryContent(),
                              ),
                            ),
                          ],
                        ),
                      _ => const Placeholder(),
                    }
                  : const Placeholder(),
              key: PageStorageKey<int>(
                  state is NavigationNavBarUpdated ? state.index : 0),
            ),
          );
        },
      )),
    );
  }
}
