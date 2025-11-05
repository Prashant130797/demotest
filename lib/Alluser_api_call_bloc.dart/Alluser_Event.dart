import 'package:equatable/equatable.dart';

abstract class AlluserEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FetchAllUserData extends AlluserEvent {
  final String urlBasic;
  FetchAllUserData({required this.urlBasic});
}

class ReturnstateCnditional extends AlluserEvent {
  final String usertxtController;
  final String passwordtxtController;
  ReturnstateCnditional({
    required this.usertxtController,
    required this.passwordtxtController,
  });
}
