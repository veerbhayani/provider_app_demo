import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app_demo/my_practice/simple_crude_app/simple_crude_provider.dart';

class SimpleCrudDemo extends StatefulWidget {
  const SimpleCrudDemo({super.key});

  @override
  State<SimpleCrudDemo> createState() => _SimpleCrudDemoState();
}

class _SimpleCrudDemoState extends State<SimpleCrudDemo> {
  //bool isCricket = false, isFootball = false, isSinging = false;
  // String gender = 'gender', male = 'male', feMale = 'female';
  //List hobbyList = [];
  // bool isSubmited = false;
  //bool isActive = false;

  @override
  Widget build(BuildContext context) {
    log('select is build');
    // SimpleCrudProvider simpleCrudProvider =
    //     context.read<SimpleCrudProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('SimpleCrud'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Selector<SimpleCrudProvider, TextEditingController>(
              builder: (context, value, child) => TextField(
                controller: value,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Name',
                  labelText: 'Name',
                ),
              ),
              selector: (contex, obj) => obj.txtFirstNameEditingController,
            ),
            const SizedBox(height: 5),
            Selector<SimpleCrudProvider, TextEditingController>(
              builder: (context, value, child) => TextField(
                controller: value,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'MiddleName',
                  labelText: 'MiddleName',
                ),
              ),
              selector: (contex, obj) => obj.txtMiddleEditingController,
            ),
            const SizedBox(height: 5),
            Selector<SimpleCrudProvider, TextEditingController>(
              builder: (context, value, child) => TextField(
                controller: value,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'LastName',
                  labelText: 'LastName',
                ),
              ),
              selector: (contex, obj) => obj.txtLastNameEditingController,
            ),
            const SizedBox(height: 5),
            Selector<SimpleCrudProvider, double>(
              builder: (context, value, child) => Slider(
                value: value,
                onChanged: (value) {
                  context.read<SimpleCrudProvider>().sliderMethod(value);
                },
                min: 1000,
                max: 50000,
              ),
              selector: (contex, obj) => obj.selectedSalary,
            ),
            Consumer<SimpleCrudProvider>(
              builder: (context, obj, child) => Row(
                children: [
                  const Text('gender :  '),
                  const Text('Male'),
                  Radio(
                    value: obj.male,
                    groupValue: obj.gender,
                    onChanged: (value) {
                      print('select is Male');

                      context.read<SimpleCrudProvider>().checkGender(value!);
                      //gender = value!;
                    },
                  ),
                  const Text('FeMale'),
                  Radio(
                    value: obj.feMale,
                    groupValue: obj.gender,
                    onChanged: (value) {
                      print('select is feMale');
                      context.read<SimpleCrudProvider>().checkGender(value!);
                      // gender = value!;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text('Hobby :  '),
                Selector<SimpleCrudProvider, bool>(
                    builder: (context, isCricket, child) {
                      print('select is Cricket');
                      return Checkbox(
                        value: isCricket,
                        onChanged: (value) {
                          context
                              .read<SimpleCrudProvider>()
                              .cricketMethod(value!);
                          //isFootball = value!;
                        },
                      );
                    },
                    selector: (context, obj) => obj.isCricket),
                const Text('Cricket'),
                Selector<SimpleCrudProvider, bool>(
                    builder: (context, isFootball, child) {
                      print('select is Football');
                      return Checkbox(
                        value: isFootball,
                        onChanged: (value) {
                          context
                              .read<SimpleCrudProvider>()
                              .footballMethod(value!);
                          //isFootball = value!;
                        },
                      );
                    },
                    selector: (context, obj) => obj.isFootball),
                const Text('Football'),
                Selector<SimpleCrudProvider, bool>(
                    builder: (context, isSinging, child) {
                      print('select is Singing');
                      return Checkbox(
                        value: isSinging,
                        onChanged: (value) {
                          context
                              .read<SimpleCrudProvider>()
                              .singingMethod(value!);
                          // isSinging = value!;
                        },
                      );
                    },
                    selector: (context, obj) => obj.isSinging),
                const Text('Singing'),
              ],
            ),
            const SizedBox(height: 10),
            Selector<SimpleCrudProvider, List>(
              shouldRebuild: (previous, next) => true,
              builder: (context, value, child) => DropdownButton(
                items: value
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (value) {
                  context
                      .read<SimpleCrudProvider>()
                      .streamMethod(value as String);
                },
                value: context.read<SimpleCrudProvider>().selectedStream,
              ),
              selector: (contex, obj) => obj.stream,
            ),
            Selector<SimpleCrudProvider, bool>(
              builder: (context, isActive, child) => Switch(
                value: isActive,
                onChanged: (value) {
                  context.read<SimpleCrudProvider>().switchMethod(value);
                },
              ),
              selector: (contex, obj) => obj.isActive,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                context.read<SimpleCrudProvider>().showData();
                context.read<SimpleCrudProvider>().addUserData();
                context.read<SimpleCrudProvider>().clearMethod();
              },
              child: const Text('submit'),
            ),
            const SizedBox(height: 10),
            Consumer<SimpleCrudProvider>(builder: (context, obj, child) {
              return obj.userData.isEmpty
                  ? const Text('There is not data')
                  : Expanded(
                      child: ListView.builder(
                        itemCount: obj.userData.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              obj.selectedIndex = index;
                              log('${obj.selectedIndex}');
                              context.read<SimpleCrudProvider>().onTapUpdate();
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return SimpleDialog(
                                    children: [
                                      Column(
                                        children: [
                                          TextField(
                                            controller: obj
                                                .txtUpdateFirstNameEditingController,
                                            decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                                hintText: 'Name'),
                                          ),
                                          const SizedBox(height: 5),
                                          TextField(
                                            controller: obj
                                                .txtUpdateMiddleEditingController,
                                            decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                                hintText: 'MiddleName'),
                                          ),
                                          const SizedBox(height: 5),
                                          TextField(
                                            controller: obj
                                                .txtUpdateLastNameEditingController,
                                            decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                                hintText: 'LastName'),
                                          ),
                                          const SizedBox(height: 5),
                                          Selector<SimpleCrudProvider, double>(
                                            builder: (context, value, child) =>
                                                Slider(
                                              value: value,
                                              onChanged: (value) {
                                                context
                                                    .read<SimpleCrudProvider>()
                                                    .sliderMethodDialog(value);
                                              },
                                              min: 1000,
                                              max: 50000,
                                            ),
                                            selector: (contex, obj) =>
                                                obj.selectedSalaryUpdate,
                                          ),
                                          const SizedBox(height: 5),
                                          Consumer<SimpleCrudProvider>(
                                            builder: (context, obj, child) =>
                                                Row(
                                              children: [
                                                const Text('gender :  '),
                                                const Text('Male'),
                                                Radio(
                                                  value: obj.maleUpdate,
                                                  groupValue: obj.genderUpdate,
                                                  onChanged: (value) {
                                                    print('select is Male');

                                                    context
                                                        .read<
                                                            SimpleCrudProvider>()
                                                        .checkGenderDialog(
                                                            value!);
                                                    //gender = value!;
                                                  },
                                                ),
                                                const Text('FeMale'),
                                                Radio(
                                                  value: obj.feMaleUpdate,
                                                  groupValue: obj.genderUpdate,
                                                  onChanged: (value) {
                                                    print('select is feMale');
                                                    context
                                                        .read<
                                                            SimpleCrudProvider>()
                                                        .checkGenderDialog(
                                                            value!);
                                                    // gender = value!;
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              const Text('Hobby :  '),
                                              Selector<SimpleCrudProvider,
                                                      bool>(
                                                  builder: (context, isCricket,
                                                      child) {
                                                    print('select is Cricket');
                                                    return Checkbox(
                                                      value:
                                                          obj.isCricketUpdate,
                                                      onChanged: (value) {
                                                        context
                                                            .read<
                                                                SimpleCrudProvider>()
                                                            .cricketMethodDialog(
                                                                value!);
                                                        //isFootball = value!;
                                                      },
                                                    );
                                                  },
                                                  selector: (context, obj) =>
                                                      obj.isCricketUpdate),
                                              const Text('Cricket'),
                                              Selector<SimpleCrudProvider,
                                                      bool>(
                                                  builder: (context, isFootball,
                                                      child) {
                                                    print('select is Football');
                                                    return Checkbox(
                                                      value:
                                                          obj.isFootballUpdate,
                                                      onChanged: (value) {
                                                        context
                                                            .read<
                                                                SimpleCrudProvider>()
                                                            .footballMethodDialog(
                                                                value!);
                                                        //isFootball = value!;
                                                      },
                                                    );
                                                  },
                                                  selector: (context, obj) =>
                                                      obj.isFootballUpdate),
                                              const Text('Football'),
                                              Selector<SimpleCrudProvider,
                                                      bool>(
                                                  builder: (context, isSinging,
                                                      child) {
                                                    print('select is Singing');
                                                    return Checkbox(
                                                      value:
                                                          obj.isSingingUpdate,
                                                      onChanged: (value) {
                                                        context
                                                            .read<
                                                                SimpleCrudProvider>()
                                                            .singingMethodDialog(
                                                                value!);
                                                        // isSinging = value!;
                                                      },
                                                    );
                                                  },
                                                  selector: (context, obj) =>
                                                      obj.isSingingUpdate),
                                              const Text('Singing'),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Selector<SimpleCrudProvider, List>(
                                            shouldRebuild: (previous, next) =>
                                                true,
                                            builder: (context, value, child) =>
                                                DropdownButton(
                                              items: value
                                                  .map((e) => DropdownMenuItem(
                                                      value: e, child: Text(e)))
                                                  .toList(),
                                              onChanged: (value) {
                                                context
                                                    .read<SimpleCrudProvider>()
                                                    .streamMethodDialog(
                                                        value as String);
                                              },
                                              value: context
                                                  .read<SimpleCrudProvider>()
                                                  .selectedStreamUpdate,
                                            ),
                                            selector: (contex, obj) =>
                                                obj.streamUpdate,
                                          ),
                                          Selector<SimpleCrudProvider, bool>(
                                            builder:
                                                (context, isActive, child) =>
                                                    Switch(
                                              value: obj.isActiveUpdate,
                                              onChanged: (value) {
                                                context
                                                    .read<SimpleCrudProvider>()
                                                    .switchMethodDialog(value);
                                              },
                                            ),
                                            selector: (contex, obj) =>
                                                obj.isActiveUpdate,
                                          ),
                                          const SizedBox(height: 5),
                                          Row(
                                            children: [
                                              MaterialButton(
                                                onPressed: () {
                                                  context
                                                      .read<
                                                          SimpleCrudProvider>()
                                                      .updateMethod();
                                                  context
                                                      .read<
                                                          SimpleCrudProvider>()
                                                      .clearUpdateMethod();
                                                  context
                                                      .read<
                                                          SimpleCrudProvider>()
                                                      .updateButton(context);
                                                },
                                                child: const Text('Update'),
                                              ),
                                              MaterialButton(
                                                onPressed: () {
                                                  context
                                                      .read<
                                                          SimpleCrudProvider>()
                                                      .cancleButton(context);
                                                },
                                                child: const Text('cancle'),
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  );
                                },
                              );
                            },
                            child: Dismissible(
                              key: UniqueKey(),
                              onDismissed: (direction) {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('Are you sure?'),
                                      actions: [
                                        MaterialButton(
                                          onPressed: () {
                                            context
                                                .read<SimpleCrudProvider>()
                                                .deleteButton(context, index);
                                          },
                                          child: const Text('Delete'),
                                        ),
                                        MaterialButton(
                                          onPressed: () {
                                            context
                                                .read<SimpleCrudProvider>()
                                                .cancleDeleteButton(context);
                                          },
                                          child: const Text('cancle'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: SizedBox(
                                height: 130,
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    Text(
                                        'Name :${obj.userData[index]['name']} '),
                                    Text(
                                        'MiddleName :${obj.userData[index]['middle']} '),
                                    Text(
                                        'LastName :${obj.userData[index]['lastName']} '),
                                    Text(
                                        'Gender :${obj.userData[index]['gender']} '),
                                    Text(
                                        'Hobby :  ${obj.userData[index]['hobby'].map((e) => e).toList()}'),
                                    Text(
                                        'Stream : ${obj.userData[index]['stream']}'),
                                    Text(
                                        'Switch : ${obj.userData[index]['active']}'),
                                    Text(
                                        'Salary : ${obj.userData[index]['salary']}')
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
            }),
          ],
        ),
      ),
    );
  }
}
