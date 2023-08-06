import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app_demo/provider_example/counter_provider.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  @override
  Widget build(BuildContext context) {
    log("i am build method");
    return Scaffold(
      body: Center(
        child: Consumer<CounterProvider>(
          builder: (context, obj, child) {
            log("i am consumer rebuild");
            return Text(
              obj.count.toString(),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Provider.of<CounterProvider>(context, listen: false).increament();
          context.read<CounterProvider>().increament();
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
// Text(context.watch<CounterProvider>().count.toString(),),
// ChangeNotifier
// notifylisteners 
// MultiProvider 
// ChangeNotifierProvider
// Provider.of(context)
// context.read()
// context.watch() 
// consumer 
// selector