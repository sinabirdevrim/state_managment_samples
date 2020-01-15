import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managment_sample/block/counterLib/counter_lib_event.dart';
import 'package:state_managment_sample/block/counterLib/counter_lib_state.dart';

class CounterLibBlock extends Bloc<CounterLibEvent, CounterLibState> {
  @override
  CounterLibState get initialState => CounterLibState.init();

  @override
  Stream<CounterLibState> mapEventToState(CounterLibEvent event) async* {
    final currentState = state;

    if (event is CounterLibIncreasing) {
      yield CounterLibState(counter: currentState.counter + 1);
    } else {
      yield CounterLibState(counter: currentState.counter - 1);
    }
  }
}
