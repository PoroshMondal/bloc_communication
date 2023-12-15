import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'communication_through_listener/business_logic/cubit/listener_counter_cubit.dart';
import 'communication_through_listener/business_logic/cubit/listener_internet_cubit.dart';
import 'communication_through_listener/presentation/router/listener_app_router.dart';

class ListenApp extends StatelessWidget {
  const ListenApp({
    super.key,
    required this.listenerAppRouter,
    required this.connectivity
  });

  final ListenerAppRouter listenerAppRouter;
  final Connectivity connectivity;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ListenerInternetCubit>(
              create: (context) => ListenerInternetCubit(connectivity: connectivity)
          ),
          BlocProvider<ListenerCounterCubit>(
              create: (context) => ListenerCounterCubit()
          ),
        ],
        child: MaterialApp(
          title: "BLoC Route Access",
          theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity),
          onGenerateRoute: listenerAppRouter.onGeneratedRoute,
        )
    );
  }
}
