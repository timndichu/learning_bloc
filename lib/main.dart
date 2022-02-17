// ignore_for_file: avoid_print, prefer_const_constructors, deprecated_member_use

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:learning_bloc/cubit/counter_cubit.dart';
import 'package:learning_bloc/cubit/settings_cubit.dart';
import 'package:path_provider/path_provider.dart';

import 'cubit/internet_cubit.dart';
import 'presentation/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final CounterState counterState1 = CounterState(
      counterValue: 1, wasIncremented: false, wasDecremented: false);
  final CounterState counterState2 = CounterState(
      counterValue: 1, wasIncremented: false, wasDecremented: false);
  print(counterState1 == counterState2);

  final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  HydratedBlocOverrides.runZoned(
    () => runApp(MyApp(
      appRouter: AppRouter(),
      connectivity: Connectivity(),
    )),
    storage: storage,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter, required this.connectivity})
      : super(key: key);

  final AppRouter appRouter;
  final Connectivity connectivity;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterCubit>(create: (context) => CounterCubit()),
        BlocProvider<SettingsCubit>(create: (context) => SettingsCubit()),
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: appRouter.onGenerateRoute,
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
