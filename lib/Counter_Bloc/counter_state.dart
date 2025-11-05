import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  final int counter;
  final bool isSwitchOn;
  String name = "Prashant";
  CounterState({this.counter = 0, this.isSwitchOn = false});

  CounterState copyWith({int? counter, bool? isSwitchOn}) {
    return CounterState(
      counter: counter ?? this.counter,
      isSwitchOn: isSwitchOn ?? this.isSwitchOn,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [counter, isSwitchOn];
}

class PostApiLoaded extends Equatable {
  final Response response;
  final String josnConverted;
  PostApiLoaded({required this.response, required this.josnConverted});
  PostApiLoaded copyWith({Response? response, String? josnConverted}) {
    return PostApiLoaded(
      response: response ?? this.response,
      josnConverted: josnConverted ?? this.josnConverted,
    );
  }

  @override
  List<Object?> get props => [response];
}
