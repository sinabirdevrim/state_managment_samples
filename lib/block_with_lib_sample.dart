import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managment_sample/block/counter/counter_block.dart';
import 'package:state_managment_sample/block/counter/counter_decrease.dart';
import 'package:state_managment_sample/block/counter/counter_increasing.dart';
import 'package:state_managment_sample/block/counterLib/counter_lib_block.dart';
import 'package:state_managment_sample/block/counterLib/counter_lib_event_v2.dart';

import 'block/counterLib/counter_lib_block_v2.dart';
import 'block/counterLib/counter_lib_event.dart';
import 'block/counterLib/counter_lib_state.dart';

class BlockLibSample extends StatefulWidget {
  @override
  _BlockLibSampleState createState() => _BlockLibSampleState();
}

class _BlockLibSampleState extends State<BlockLibSample> {
  final counterBlock = CounterLibBlockV2();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterLibBlockV2>(
      create: (context) => counterBlock,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Block Sample Page"),
          ),
          body: CenterWidget(),
          floatingActionButton: ColumnWidget()),
    );
  }
}

class ColumnWidget extends StatelessWidget {
  const ColumnWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _block = BlocProvider.of<CounterLibBlockV2>(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
          heroTag: "1",
          onPressed: () {
            _block.add(CounterLibEventV2.increment);
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
            _block.add(CounterLibEventV2.decrement);
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ],
    );
  }
}

class CenterWidget extends StatelessWidget {
  const CenterWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CounterWidget(),
    );
  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _block = BlocProvider.of<CounterLibBlockV2>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'You have pushed the button this many times:',
        ),
        BlocBuilder(
          bloc: _block,
          builder: (context, CounterLibState state) {
            return Text("This value ${state.counter}");
          },
        ),
      ],
    );
  }
}
