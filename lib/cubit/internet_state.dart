part of 'internet_cubit.dart';

abstract class InternetState extends Equatable {
  const InternetState();

  @override
  List<Object> get props => [];
}

//The state when the user's device is connecting to the internet
class InternetLoading extends InternetState {}

//When we've successfully connected to the internet
class InternetConnected extends InternetState {
  final ConnectionType connectionType;

  const InternetConnected({required this.connectionType});
}

//when we've disconnected from the internet
class InternetDisconnected extends InternetState {}
