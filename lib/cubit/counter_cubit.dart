import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> with HydratedMixin {
  CounterCubit()
      : super(CounterState(
            counterValue: 0, wasDecremented: false, wasIncremented: false));

  void increment() => emit(CounterState(
      counterValue: state.counterValue + 1,
      wasDecremented: false,
      wasIncremented: true));

  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1,
      wasDecremented: true,
      wasIncremented: false));

  //called everytime the app needs data
  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    //every time we want our data, hydrated bloc will call fromJson
    //This will retrieve our JSON which is already converted to a map

    //We will need to return a new instance of the counterState populated with the data from that map
    return CounterState.fromMap(json);
  }

  //called for every state
  @override
  Map<String, dynamic>? toJson(CounterState state) {
    //every time we have a state change, we want to save it to a map
    //Then send it to our hydratedbloc to store it to our local storage
    return state.toMap();
  }
}
