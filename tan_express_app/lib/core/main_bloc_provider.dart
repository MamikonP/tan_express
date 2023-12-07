import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/locale/locale_cubit.dart';
import '../logic/navigation/navigation_cubit.dart';

class MainBlocProvider extends StatelessWidget {
  const MainBlocProvider({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) =>
      MultiBlocProvider(providers: <BlocProvider<dynamic>>[
        BlocProvider<LocaleCubit>(
          create: (BuildContext context) => LocaleCubit(),
        ),
        BlocProvider<NavigationCubit>(
          create: (BuildContext context) => NavigationCubit(context),
        )
      ], child: child);
}
