// import 'package:bloc/bloc.dart';

// enum CounterEvent { increment, decrement }

// class CounterBloc extends Bloc<CounterEvent, int> {
//   //initializing Bloc with a state of 0
//   CounterBloc() : super(0);

//   //Bloc mapEventToState

//   Stream<int> mapEventToState(CounterEvent event) async* {
//     switch (event) {
//       case CounterEvent.increment:
//         yield state + 1;
//         break;
//       case CounterEvent.decrement:
//         yield state - 1;
//         break;
//     }
//     throw UnimplementedError();
//   }
// }

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
