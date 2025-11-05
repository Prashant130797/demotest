import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_main/Alluser_api_call_bloc.dart/Alluser_Event.dart';
import 'package:flutter_bloc_main/Alluser_api_call_bloc.dart/Alluser_State.dart';
import 'package:flutter_bloc_main/Network/dioWrapper.dart';
import 'package:flutter_bloc_main/ommon_loader_bloc.dart/cmn_loader_bloc.dart';

class AlluserBloc extends Bloc<AlluserEvent, AlluserState> {
  final LoaderBloc loaderBloc;
  AlluserBloc(this.loaderBloc) : super(AlluserInitaial()) {
    on<FetchAllUserData>(_ffetchAllUserData);
    on<ReturnstateCnditional>(_getValidationState);
  }

  void _ffetchAllUserData(
    FetchAllUserData event,
    Emitter<AlluserState> emit,
  ) async {
    emit(AlluserLoading());
    loaderBloc.add(ShowLoaderEvent());
    await Diowrapper(
      onsuccessfull: (response) {
        loaderBloc.add(HideLoaderEvent());
        emit(AlluserLoaded(response: response));
      },
      onProgressed: () {},
      onerror: (errorMsg) {
        loaderBloc.add(HideLoaderEvent());
        emit(AlluserError(errorMessage: errorMsg));
      },
      urlBasic: event.urlBasic,
    ).getDioResponse();
  }

  void _getValidationState(
    ReturnstateCnditional event,
    Emitter<AlluserState> emit,
  ) {
    if (event.usertxtController == event.passwordtxtController) {
      emit(
        ValidationClass(
          getPassword: event.usertxtController,
          getUserName: event.passwordtxtController,
          returnBoolFunc: true,
        ),
      );
    } else {
      emit(
        ValidationClass(
          getPassword: event.usertxtController,
          getUserName: event.passwordtxtController,
          returnBoolFunc: false,
        ),
      );
    }
  }
}
