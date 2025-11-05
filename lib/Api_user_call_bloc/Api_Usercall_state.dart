import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class ApiUsercallState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserDataInitial extends ApiUsercallState {}

class UserDataLoading extends ApiUsercallState {}

class UserDataLoaded extends ApiUsercallState {
  final Map<String, dynamic> response;
  final List list;
  UserDataLoaded({required this.response, required this.list});
  UserDataLoaded copyWith(Map<String, dynamic>? responses, List? mainList) {
    print("the respons is ${responses}");
    return UserDataLoaded(
      response: responses ?? response,
      list: mainList ?? list,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [response, list];
}

class UserDataError extends ApiUsercallState {
  final String errorMessage;
  UserDataError({required this.errorMessage});
  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
}

class AlluserData extends ApiUsercallState {
  final List<dynamic> response;
  AlluserData({required this.response});
}
