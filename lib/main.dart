// ignore_for_file: avoid_print, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/cubit/counter_cubit.dart';

import 'presentation/router/app_router.dart';

void main() {
  final CounterState counterState1 = CounterState(
      counterValue: 1, wasIncremented: false, wasDecremented: false);
  final CounterState counterState2 = CounterState(
      counterValue: 1, wasIncremented: false, wasDecremented: false);
  print(counterState1 == counterState2);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: _appRouter.onGenerateRoute,
      ),
    );
  }
}



/** Boat stream explanation */
/*
Stream<int> boatStream() async* {
  for (int i = 1; i <= 10; i++) {
    print("SENT BOAT no. " + i.toString());
    await Future.delayed(const Duration(seconds: 2));
    yield i;
  }
}

void main(List<String> args) async {
  Stream<int> stream = boatStream();

  stream.listen((receivedData) {
    print("RECEIVED BOAT no. " + receivedData.toString());
  });
}
*/

//Basic observation of how cubit works
/*
void main(List<String> args) {
  final cubit = CounterCubit();

  print(cubit.state);
  cubit.increment();
  print(cubit.state);
  cubit.increment();
  print(cubit.state);
  cubit.decrement();
  print(cubit.state);
}
*/

//Basic Bloc Implementation
// Future<void> main(List<String> args) async {
//   final bloc = CounterBloc();

//   final streamSubscription = bloc.stream.listen((event) {
//     print(event);
//   });

//   bloc.add(CounterEvent.increment);

//   await Future.delayed(Duration.zero);

//   await streamSubscription.cancel();

//   await bloc.close();
// }
