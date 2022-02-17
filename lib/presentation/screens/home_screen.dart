// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/constants/enums.dart';
import 'package:learning_bloc/cubit/counter_cubit.dart';
import 'package:learning_bloc/cubit/internet_cubit.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key, required this.title, required this.color})
      : super(key: key);

  final String title;
  final Color color;

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  GlobalKey<ScaffoldState> homeScreenKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetConnected &&
            state.connectionType == ConnectionType.Wifi) {
          BlocProvider.of<CounterCubit>(context).increment();
        } else if (state is InternetConnected &&
            state.connectionType == ConnectionType.Mobile) {
          BlocProvider.of<CounterCubit>(context).decrement();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: widget.color,
          title: Text(widget.title),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/settings');
                },
                icon: Icon(Icons.settings))
          ],
        ),
        body: BlocListener<CounterCubit, CounterState>(
          listener: (context, state) {
            if (state.wasIncremented) {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Incremented!'),
                duration: Duration(milliseconds: 300),
              ));
            } else if (state.wasDecremented) {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Decremented!'),
                duration: Duration(milliseconds: 300),
              ));
            }
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BlocBuilder<InternetCubit, InternetState>(
                    builder: (context, state) {
                  if (state is InternetConnected &&
                      state.connectionType == ConnectionType.Wifi) {
                    return Text(
                      'Wi-Fi',
                      style: Theme.of(context).textTheme.headline3?.copyWith(
                            color: Colors.green,
                          ),
                    );
                  } else if (state is InternetConnected &&
                      state.connectionType == ConnectionType.Mobile) {
                    return Text(
                      'Mobile',
                      style: Theme.of(context).textTheme.headline3?.copyWith(
                            color: Colors.red,
                          ),
                    );
                  } else if (state is InternetDisconnected) {
                    return Text(
                      'Disconnected',
                      style: Theme.of(context).textTheme.headline3?.copyWith(
                            color: Colors.grey,
                          ),
                    );
                  }
                  return CircularProgressIndicator();
                }),
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  'COUNTER VALUE',
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      heroTag: 'dec',
                      onPressed: () {
                        context.read<CounterCubit>().decrement();
                        // BlocProvider.of<CounterCubit>(context).decrement();
                      },
                      tooltip: 'Decrement',
                      child: const Icon(Icons.remove),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: BlocBuilder<CounterCubit, CounterState>(
                        builder: (context, state) {
                          return Text(
                            state.counterValue.toString(),
                            style: Theme.of(context).textTheme.headline4,
                          );
                        },
                      ),
                    ),
                    FloatingActionButton(
                      heroTag: 'inc',
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).increment();
                      },
                      tooltip: 'Increment',
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                MaterialButton(
                  color: Colors.redAccent,
                  child: Text(
                    'Go to Second Screen',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      '/second',
                      arguments: homeScreenKey,
                    );
                  },
                ),
                SizedBox(
                  height: 24,
                ),
                MaterialButton(
                  color: Colors.greenAccent,
                  child: Text(
                    'Go to Third Screen',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      '/third',
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
