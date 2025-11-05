import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ApiUsercallEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FetchUserData extends ApiUsercallEvent {
  final String urlBasic;
  final FormData formData;
  FetchUserData({required this.urlBasic, required this.formData});
}
