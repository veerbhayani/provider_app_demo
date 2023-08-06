import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app_demo/provider_example/counter_provider.dart';

import 'my_practice/form_app/form_provider.dart';
import 'my_practice/increament_decreament_app/increament_decreament_provider.dart';
import 'my_practice/simple_crude_app/simple_crude_app.dart';
import 'my_practice/simple_crude_app/simple_crude_provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CounterProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => IncreamentDecreament(),
        ),
        ChangeNotifierProvider(
          create: (context) => FormProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SimpleCrudProvider(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SimpleCrudDemo(),
      ),
    );
  }
}
