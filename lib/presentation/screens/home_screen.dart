// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/cubit/counter_cubit.dart';

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.color,
        title: Text(widget.title),
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
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
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
    );
  }
}
