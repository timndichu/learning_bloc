import 'package:bloc_test/bloc_test.dart';
import 'package:learning_bloc/cubit/counter_cubit.dart';
import 'package:test/test.dart';

void main() {
  group('CounterCubit', () {
    CounterCubit counterCubit = CounterCubit();

    //Inside the setup, we can instantiate our functions and access them later in our test
    setUp(() {
      counterCubit = CounterCubit();
    });

    //teardown will be run after our tests
    tearDown(() {
      counterCubit.close();
    });

    //testing initialstate of app
    test(
        'The initial State for the counterCubit is CounterState(counterValue:0)',
        () {
      expect(
          counterCubit.state,
          CounterState(
              counterValue: 0, wasIncremented: false, wasDecremented: false));
    });

    //testing increment and decrement
    //increment
    blocTest(
        'The cubit should emit a counterState(counterValue:1, wasIncremented:true) when cubit.increment() function is called',
        build: () => counterCubit,
        act: (CounterCubit counterCubit) => counterCubit.increment(),
        expect: () => [
              CounterState(
                  counterValue: 1, wasIncremented: true, wasDecremented: false)
            ]);

    //decrement
    blocTest(
        'The cubit should emit a counterState(counterValue:-1, wasDecremented:true) when cubit.decrement() function is called',
        build: () => counterCubit,
        act: (CounterCubit counterCubit) => counterCubit.decrement(),
        expect: () => [
              CounterState(
                  counterValue: -1, wasIncremented: false, wasDecremented: true)
            ]);
  });
}
