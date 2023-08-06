import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'increament_decreament_provider.dart';

class IncreamentDecreamentDemo extends StatefulWidget {
  const IncreamentDecreamentDemo({super.key});
  @override
  State<IncreamentDecreamentDemo> createState() =>
      _IncreamentDecreamentDemoState();
}

class _IncreamentDecreamentDemoState extends State<IncreamentDecreamentDemo> {
  @override
  Widget build(BuildContext context) {
    // log('i am build method');
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                onPressed: () {
                  context.read<IncreamentDecreament>().decreamentByOne();
                },
                child: const Icon(
                  Icons.remove,
                ),
              ),
              // Consumer<IncreamentDecreament>(
              //   builder: (context, obj, child) {
              //     log('hi am count 1 rebuild');
              //     return Text(
              //       obj.count1.toString(),
              //       style: const TextStyle(
              //         fontSize: 25,
              //       ),
              //     );
              //   },
              // ),
              Selector<IncreamentDecreament, int>(
                builder: (context, value, child) {
                  log('hi am count 1 rebuild');
                  return Text(
                    value.toString(),
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                  );
                },
                selector: (context, obj) => obj.count1,
              ),
              FloatingActionButton(
                onPressed: () {
                  context.read<IncreamentDecreament>().increamentByOne();
                },
                child: const Icon(
                  Icons.add,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                onPressed: () {
                  context.read<IncreamentDecreament>().decreamentByTwo();
                },
                child: const Icon(
                  Icons.remove,
                ),
              ),
              // Consumer<IncreamentDecreament>(
              //   builder: (context, obj, child) {
              //     log('hi am count 2 rebuild');

              //     return Text(
              //       obj.count2.toString(),
              //       style: const TextStyle(
              //         fontSize: 25,
              //       ),
              //     );
              //   },
              // ),
              Selector<IncreamentDecreament, int>(
                builder: (context, value, child) {
                  log('hi am count 2 rebuild');
                  return Text(
                    value.toString(),
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                  );
                },
                selector: (context, obj) => obj.count2,
              ),
              FloatingActionButton(
                onPressed: () {
                  context.read<IncreamentDecreament>().increamentByTwo();
                },
                child: const Icon(
                  Icons.add,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
