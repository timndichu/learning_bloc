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

  Map<String, dynamic> toMap() {
    return {
      'counterValue': counterValue,
      'wasIncremented': wasIncremented,
      'wasDecremented': wasDecremented,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      counterValue: map['counterValue'].toInt() ?? 0,
      wasIncremented: map['wasIncremented'] ?? false,
      wasDecremented: map['wasDecremented'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory CounterState.fromJson(String source) =>
      CounterState.fromMap(json.decode(source));
}
