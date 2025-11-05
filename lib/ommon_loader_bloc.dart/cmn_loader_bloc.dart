// loader_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';

class LoaderState {
  final bool isLoading;
  LoaderState(this.isLoading);
}

class ShowLoaderEvent {}
class HideLoaderEvent {}

class LoaderBloc extends Bloc<dynamic, LoaderState> {
  LoaderBloc() : super(LoaderState(false)) {
    on<ShowLoaderEvent>((event, emit) => emit(LoaderState(true)));
    on<HideLoaderEvent>((event, emit) => emit(LoaderState(false)));
  }
}
