import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment_sample/model/counter.dart';

class ProviderSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CounterModel>(
      create: (context) => CounterModel(0),
      child: ProviderSamplePage('Flutter Provider Sample'),
    );
  }
}

class ProviderSamplePage extends StatelessWidget {
  String _title;

  ProviderSamplePage(this._title);

  @override
  Widget build(BuildContext context) {
    /**
     * 1 . Yöntem Provider.of;
     */
    //final counter = Provider.of<CounterModel>(context);

    /**
     * 2 . Yöntem Consumer
     */
    return Consumer<CounterModel>(
        builder: (context, mCounter, widget) => Scaffold(
            appBar: AppBar(
              title: Text(_title),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${mCounter.counter}',
                    style: Theme.of(context).textTheme.display1,
                  ),
                ],
              ),
            ),
            floatingActionButton: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                FloatingActionButton(
                  heroTag: "1",
                  onPressed: () {
                    mCounter.setIncreasing();
                  },
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
                SizedBox(
                  height: 10,
                ),
                FloatingActionButton(
                  heroTag: "2",
                  onPressed: () {
                    mCounter.setDecrease();
                  },
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
              ],
            )));
  }
}
