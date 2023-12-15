import 'package:bloc_communication/communication_through_listener/presentation/router/listener_app_router.dart';
import 'package:bloc_communication/stream_subscription_listen/presentation/router/app_router.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'app.dart';
import 'listen_app.dart';

void main() {
  runApp(
      App(
        appRouter: AppRouter(),
        connectivity: Connectivity(),
      )
      /*ListenApp(
        listenerAppRouter: ListenerAppRouter(),
        connectivity: Connectivity(),
      )*/
  );
}

