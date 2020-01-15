import 'dart:async';

import 'package:state_managment_sample/block/counter/counter_event.dart';
import 'package:state_managment_sample/block/counter/counter_increasing.dart';

class CounterBlock {
  int _counter = 0;

  // state için
  final _counterStateStrem = StreamController<int>();

  Stream<int> get counter => _counterStateStrem.stream;

  StreamSink<int> get _counterSink => _counterStateStrem.sink;

//event için
  final _counterEventStrem = StreamController<CounterEvent>();

  Stream<CounterEvent> get _event => _counterEventStrem.stream;

  StreamSink<CounterEvent> get eventSink => _counterEventStrem.sink;

  CounterBlock() {
    _event.listen(_onEventListener);
  }

  void _onEventListener(CounterEvent event) {
    if (event is CounterIncreasing) {
      _counter++;
    } else {
      _counter--;
    }
    _counterSink.add(_counter);
  }
}
