import 'dart:async';

import 'package:flutter/material.dart';

class StreamSample extends StatefulWidget {
  @override
  _StreamSampleState createState() => _StreamSampleState();
}

class _StreamSampleState extends State<StreamSample> {
  final StreamController<int> _streamController = StreamController<int>();
  int _counter = 0;

  @override
  void dispose() {
    // TODO: implement dispose
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Stream Sample Page"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              StreamBuilder<int>(
                  stream: _streamController.stream,
                  initialData: 0,
                  builder: (context, AsyncSnapshot snapshot) {
                    return Text(
                      '${snapshot.data}',
                      style: Theme.of(context).textTheme.display1,
                    );
                  }),
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
                _streamController.sink.add(++_counter);
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
                _streamController.sink.add(--_counter);
              },
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
          ],
        ));
  }
}
