
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props =>  [];
}

class IncrementCounter extends CounterEvent {
  final FormData? mapdata;
  IncrementCounter({this.mapdata});
}

class DecrementCounter extends CounterEvent {}

class SwitchEvent extends CounterEvent {}
