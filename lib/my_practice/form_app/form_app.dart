import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'form_provider.dart';

class FormDemo extends StatefulWidget {
  const FormDemo({super.key});

  @override
  State<FormDemo> createState() => _FormDemoState();
}

class _FormDemoState extends State<FormDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Registration Form',
        ),
        leading: const Icon(
          Icons.menu,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Selector<FormProvider, TextEditingController>(
              builder: (context, value, child) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text(
                      'Enter First Name',
                    ),
                  ),
                  controller: value,
                ),
              ),
              selector: (contex, obj) => obj.txtFirstNameEditingController,
            ),
            Selector<FormProvider, TextEditingController>(
              builder: (context, value, child) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text(
                      'Enter Middle Name',
                    ),
                  ),
                  controller: value,
                ),
              ),
              selector: (contex, obj) => obj.txtSurNameEditingController,
            ),
            Selector<FormProvider, TextEditingController>(
              builder: (context, value, child) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text(
                      'Enter Last Name',
                    ),
                  ),
                  controller: value,
                ),
              ),
              selector: (contex, obj) => obj.txtLastNameEditingController,
            ),
            const Text('Salary'),
            Selector<FormProvider, double>(
              builder: (context, value, child) => Slider(
                value: value,
                onChanged: (value) {
                  context.read<FormProvider>().sliderMethod(value);
                },
                min: 1000,
                max: 50000,
              ),
              selector: (contex, obj) => obj.selectedSalary,
            ),
            Consumer<FormProvider>(
              builder: (context, obj, child) => Row(
                children: [
                  const Text('Gender :  '),
                  const Text('Male'),
                  Radio(
                    value: obj.male,
                    groupValue: obj.gender,
                    onChanged: (value) {
                      log('select is Male');
                      context.read<FormProvider>().checkGender(value!);
                      //gender = value!;
                    },
                  ),
                  const Text('Female'),
                  Radio(
                    value: obj.feMale,
                    groupValue: obj.gender,
                    onChanged: (value) {
                      log('select is feMale');
                      context.read<FormProvider>().checkGender(value!);
                      // gender = value!;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Hobby :  '),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Selector<FormProvider, bool>(
                            builder: (context, isCricket, child) {
                              log('select is Cricket');
                              return Checkbox(
                                value: isCricket,
                                onChanged: (value) {
                                  context
                                      .read<FormProvider>()
                                      .cricketMethod(value!);
                                },
                              );
                            },
                            selector: (context, obj) => obj.isCricket),
                        const Text('Cricket'),
                      ],
                    ),
                    Row(
                      children: [
                        Selector<FormProvider, bool>(
                            builder: (context, isFootball, child) {
                              log('select is Football');
                              return Checkbox(
                                value: isFootball,
                                onChanged: (value) {
                                  context
                                      .read<FormProvider>()
                                      .footballMethod(value!);
                                  //isFootball = value!;
                                },
                              );
                            },
                            selector: (context, obj) => obj.isFootball),
                        const Text('Football'),
                      ],
                    ),
                    Row(
                      children: [
                        Selector<FormProvider, bool>(
                            builder: (context, isSinging, child) {
                              log('select is Singing');
                              return Checkbox(
                                value: isSinging,
                                onChanged: (value) {
                                  context
                                      .read<FormProvider>()
                                      .singingMethod(value!);
                                  // isSinging = value!;
                                },
                              );
                            },
                            selector: (context, obj) => obj.isSinging),
                        const Text('Singing'),
                      ],
                    ),
                    Selector<FormProvider, List>(
                      shouldRebuild: (previous, next) => true,
                      builder: (context, value, child) => DropdownButton(
                        items: value
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  e,
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          context
                              .read<FormProvider>()
                              .streamMethod(value as String);
                        },
                        value: context.read<FormProvider>().selectedStream,
                      ),
                      selector: (contex, obj) => obj.stream,
                    ),
                    Selector<FormProvider, bool>(
                      builder: (context, isActive, child) => Switch(
                        value: isActive,
                        onChanged: (value) {
                          context.read<FormProvider>().switchMethod(value);
                        },
                      ),
                      selector: (contex, obj) => obj.isActive,
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                context.read<FormProvider>().showData();
              },
              child: const Text('submit'),
            ),
            const SizedBox(height: 10),
            Consumer<FormProvider>(builder: (context, obj, child) {
              return obj.isSubmited == true
                  ? SizedBox(
                      height: 300,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Text(
                              'Name :${obj.txtFirstNameEditingController.text} '),
                          Text(
                              'MiddleName :${obj.txtSurNameEditingController.text} '),
                          Text(
                              'LastName :${obj.txtLastNameEditingController.text} '),
                          Text('Gender :${obj.gender} '),
                          Text('Hobby :  ${obj.hobbyList}'),
                          Text('Stream : ${obj.selectedStream}'),
                          Text('Switch : ${obj.isActive}'),
                          Text('salary : ${obj.selectedSalary}')
                        ],
                      ),
                    )
                  : const SizedBox();
            }),
          ],
        ),
      ),
    );
  }
}
