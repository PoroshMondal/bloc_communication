import 'package:bloc_communication/stream_subscription_listen/business_logic/cubit/internet_cubit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'stream_subscription_listen/business_logic/cubit/counter_cubit.dart';
import 'stream_subscription_listen/presentation/router/app_router.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required this.appRouter,
    required this.connectivity
  });

  final AppRouter appRouter;
  final Connectivity connectivity;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<InternetCubit>(
              create: (context) => InternetCubit(connectivity: connectivity)
          ),
          BlocProvider<CounterCubit>(
              create: (context) =>
                  CounterCubit(internetCubit: context.read<InternetCubit>())
          ),
        ],
        child: MaterialApp(
          title: "BLoC Route Access",
          theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity),
          onGenerateRoute: appRouter.onGeneratedRoute,
        )
    );
  }
}
