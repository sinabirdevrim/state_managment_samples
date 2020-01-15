import 'dart:async';

import 'package:flutter/material.dart';
import 'package:state_managment_sample/block/counter/counter_block.dart';
import 'package:state_managment_sample/block/counter/counter_decrease.dart';
import 'package:state_managment_sample/block/counter/counter_increasing.dart';

class BlockSample extends StatefulWidget {
  @override
  _BlockSampleState createState() => _BlockSampleState();
}

class _BlockSampleState extends State<BlockSample> {
  final counterBlock = CounterBlock();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Block Sample Page"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              StreamBuilder<int>(
                  stream: counterBlock.counter,
                  initialData: 0,
                  builder: (context, AsyncSnapshot snapshot) {
                    return Text("This value ${snapshot.data}");
                  })
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
                counterBlock.eventSink.add(CounterIncreasing());
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
                counterBlock.eventSink.add(CounterDecrease());
              },
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
          ],
        ));
  }
}
