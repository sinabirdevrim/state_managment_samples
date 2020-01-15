import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_lib_event_v2.dart';
import 'counter_lib_state.dart';

class CounterLibBlockV2 extends Bloc<CounterLibEventV2, CounterLibState> {
  @override
  CounterLibState get initialState => CounterLibState.init();

  @override
  Stream<CounterLibState> mapEventToState(CounterLibEventV2 event) async* {
    if (event == CounterLibEventV2.increment) {
      yield CounterLibState(counter: state.counter + 1);
    } else {
      yield CounterLibState(counter: state.counter - 1);
    }
  }
}
