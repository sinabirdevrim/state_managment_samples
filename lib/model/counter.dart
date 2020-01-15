
import 'package:flutter/cupertino.dart';

class CounterModel with ChangeNotifier {

  int _counter;

  CounterModel(this._counter);

  int get counter => _counter;

  set counter(int value) {
    _counter = value;
  }

  void setIncreasing(){
    _counter++;
    notifyListeners();
  }

  void setDecrease(){
    _counter--;
    notifyListeners();
  }

}