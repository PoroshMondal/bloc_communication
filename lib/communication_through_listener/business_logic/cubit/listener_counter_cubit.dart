import 'package:bloc/bloc.dart';

import 'listener_internet_cubit.dart';

part 'listener_counter_state.dart';

class ListenerCounterCubit extends Cubit<ListenerCounterState> {
  ListenerCounterCubit()
      : super(ListenerCounterState(counterValue: 0, wasIncremented: false));


  void increment() => emit(ListenerCounterState(counterValue: state.counterValue + 1, wasIncremented: true));
  void decrement() => emit(ListenerCounterState(counterValue: state.counterValue - 1, wasIncremented: false));

}