class CounterLibState {
  final int counter;

  const CounterLibState({this.counter});

  factory CounterLibState.init() {
    return CounterLibState(counter: 0);
  }
}
