import 'package:equatable/equatable.dart';

abstract class AlluserState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class AlluserInitaial extends AlluserState {}

class AlluserLoading extends AlluserState {}

class AlluserLoaded extends AlluserState {
  final List<dynamic> response;
  AlluserLoaded({required this.response});
  List<Object?> get props => [response];
}

class AlluserError extends AlluserState {
  final String errorMessage;
  AlluserError({required this.errorMessage});
  List<Object?> get props => [errorMessage];
}

class ValidationClass extends AlluserState {
  final String getUserName;
  final String getPassword;
  final bool returnBoolFunc;
  ValidationClass({
    required this.getUserName,
    required this.getPassword,
    required this.returnBoolFunc,
  });
}
