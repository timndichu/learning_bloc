import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learning_bloc/constants/enums.dart';
import 'package:learning_bloc/cubit/internet_cubit.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  //We want to check the internet status and perform operations when there is internet connection

  // final InternetCubit internetCubit;
  // late StreamSubscription internetStreamSubscription;

  // CounterCubit({required this.internetCubit})
  //     : super(CounterState(
  //           counterValue: 0, wasDecremented: false, wasIncremented: false)) {
  //   monitorInternetCubit();
  // }

  CounterCubit()
      : super(CounterState(
            counterValue: 0, wasDecremented: false, wasIncremented: false));

  // StreamSubscription<InternetState> monitorInternetCubit() {
  //   return internetStreamSubscription =
  //       internetCubit.stream.listen((internetState) {
  //     if (internetState is InternetConnected &&
  //         internetState.connectionType == ConnectionType.Wifi) {
  //       increment();
  //     } else if (internetState is InternetConnected &&
  //         internetState.connectionType == ConnectionType.Mobile) {
  //       decrement();
  //     }
  //   });
  // }

  void increment() => emit(CounterState(
      counterValue: state.counterValue + 1,
      wasDecremented: false,
      wasIncremented: true));

  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1,
      wasDecremented: true,
      wasIncremented: false));

  // @override
  // Future<void> close() {
  //   internetStreamSubscription.cancel();
  //   return super.close();
  // }
}
