import 'package:bloc/bloc.dart';

import 'package:bloc_counter/counter_event.dart';
import 'package:bloc_counter/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {

  void onIncrement() {
    add(IncrementEvent());
  }

  void onDecrement() {
    add(IncrementEvent());
  }
  
  @override
  CounterState get initialState => CounterState.initial();

  @override
  Stream<CounterState> mapEventToState(
      CounterEvent event) async* {
    if (event is IncrementEvent) {
      yield state..counter += 1;
    } else if (event is DecrementEvent) {
      yield state..counter -= 1;
    }
  }
}