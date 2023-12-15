import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:bloc_communication/constants/enums.dart';
import 'package:flutter/material.dart';

part 'listener_internet_state.dart';

class ListenerInternetCubit extends Cubit<ListenerInternetState> {
  final Connectivity connectivity;
  late StreamSubscription connectivityStreamSubscription;
  ListenerInternetCubit({required this.connectivity}) : super(InternetLoading()){
    monitorInternetConnection();
  }

  StreamSubscription<ConnectivityResult> monitorInternetConnection(){
    return connectivityStreamSubscription = connectivity.onConnectivityChanged.listen((connectivityResult) {
      // connectivityResult is state emitted by connectivity_plus library or package
      if(connectivityResult == ConnectivityResult.wifi){
        emitInternetConnected(ConnectionType.Wifi);
      }else if(connectivityResult == ConnectivityResult.mobile){
        emitInternetConnected(ConnectionType.Mobile);
      }else {
        emitInternetDisconnected();
      }
    });
  }

  void emitInternetConnected(ConnectionType _connectionType) => emit(InternetConnected(connectionType: _connectionType));
  void emitInternetDisconnected() => emit(InternetDisconnected());

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }

}