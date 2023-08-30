import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/ccc_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _cubit = CccCubit();
  Color color = Colors.white24;
  final controller = TextEditingController();

  final key = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CccCubit, CccState>(
      bloc: _cubit,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  if (state is CccSuccess)
                    Text(
                      '${state.count}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    )
                  else
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '0',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(blurRadius: 12, color: Colors.green)
                        ]),
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: TextField(
                      controller: controller,
                    ),
                  ),
                  InkWell(
                    onHover: (value) {
                      if (value) {
                        setState(() => color = Colors.red);
                      } else {
                        setState(() => color = Colors.green);
                      }
                    },
                    onTap: () => _cubit.onPush(),
                    child: Icon(
                      Icons.add,
                      color: color,
                    ),
                  ),
                  InkWell(
                    onTap: () => _cubit.onPop(),
                    child: const Icon(Icons.remove),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      log(controller.text);
                      log('message');
                      // showDatePicker(
                      //     context: context,
                      //     initialDate: DateTime.now(),
                      //     firstDate: DateTime(1900),
                      //     lastDate: DateTime(2099));
                      // showModalBottomSheet(
                      //     context: context,
                      //     builder: (ctx) {
                      //       return Container();
                      //     });
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const Dialog(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [Text('data')],
                              ),
                            );
                          });
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: Container(
                      width: 200,
                      height: 200,
                      color: Colors.red,
                      child: const Center(
                        child: Text('sdfsdf'),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    child: SizedBox(
                      height: 400,
                      width: 400,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('asfaasdasdfasdf asdfasdfa',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.italic,
                              )),
                          const Text('asfaasdasdfasdf asdfasdfa'),
                          const Text('asfaasdasdfasdf asdfasdfa'),
                          const Text('asfaasdasdfasdf asdfasdfa'),
                          const Text('asfaasdasdfasdf asdfasdfa'),
                          Form(
                            key: key,
                            autovalidateMode: autovalidateMode,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          label: Text('họ và tên'),
                                          hintText: 'Vui lòng nhập',
                                        ),
                                        validator: (s) =>
                                            s == null || s.length < 4
                                                ? 'abc'
                                                : null,
                                      ),
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        validator: (s) =>
                                            s == null || s.length < 4
                                                ? 'abc'
                                                : null,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                            suffixIcon: Icon(Icons.percent),
                                            prefixIcon: Icon(Icons.search)),
                                        validator: (s) =>
                                            s == null || s.length < 4
                                                ? 'abc'
                                                : null,
                                      ),
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        validator: (s) =>
                                            s == null || s.length < 4
                                                ? 'abc'
                                                : null,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        validator: (s) =>
                                            s == null || s.length < 4
                                                ? 'abc'
                                                : null,
                                      ),
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        validator: (s) =>
                                            s == null || s.length < 4
                                                ? 'abc'
                                                : null,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                if (!key.currentState!.validate()) {
                                  setState(() => autovalidateMode =
                                      AutovalidateMode.always);
                                  return;
                                }
                                log('submit ok');
                              },
                              child: const Text('submit')),
                        ],
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      Image.network(
                        'https://imgv3.fotor.com/images/blog-richtext-image/part-blurry-image.jpg',
                        width: 300,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                          top: 0,
                          right: 0,
                          child: Card(
                            child: Container(
                              child: const Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'data',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  Text('data'),
                                  Text('data'),
                                  Text('data'),
                                ],
                              ),
                            ),
                          ))
                    ],
                  ),
                  PopupMenuButton(itemBuilder: (ctx) {
                    return [
                      const PopupMenuItem<String>(child: Text('aaaaa')),
                      const PopupMenuItem<String>(child: Text('aaaaa')),
                      const PopupMenuItem<String>(child: Text('aaaaa')),
                      const PopupMenuItem<String>(child: Text('aaaaa')),
                    ];
                  }),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Home',
            )
          ]),
        );
      },
    );
  }
}
