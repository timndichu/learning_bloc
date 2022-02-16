// ignore_for_file: must_be_immutable

part of 'counter_cubit.dart';

class CounterState extends Equatable {
  int counterValue;
  bool wasIncremented;
  bool wasDecremented;
  CounterState(
      {required this.counterValue,
      required this.wasIncremented,
      required this.wasDecremented});

  @override
  List<Object?> get props => [counterValue, wasDecremented, wasIncremented];
}
