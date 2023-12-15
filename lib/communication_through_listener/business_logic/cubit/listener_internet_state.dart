part of 'listener_internet_cubit.dart';

@immutable
abstract class ListenerInternetState{}

class InternetLoading extends ListenerInternetState {}

class InternetConnected extends ListenerInternetState {
  final ConnectionType connectionType;

  InternetConnected({required this.connectionType});
}

class InternetDisconnected extends ListenerInternetState {}