import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_main/Api_user_call_bloc/Api_Usercall_event.dart';
import 'package:flutter_bloc_main/Api_user_call_bloc/Api_Usercall_state.dart';
import 'package:flutter_bloc_main/Counter_Bloc/counter_state.dart';
import 'package:flutter_bloc_main/Network/dioWrapper.dart';
import 'package:flutter_bloc_main/ommon_loader_bloc.dart/cmn_loader_bloc.dart';

class ApiUsercallBloc extends Bloc<ApiUsercallEvent, ApiUsercallState> {
  final LoaderBloc loaderBloc;
  ApiUsercallBloc(this.loaderBloc) : super(UserDataInitial()) {
    on<FetchUserData>(_fetapiUser);
  }

  void _fetapiUser(FetchUserData event, Emitter<ApiUsercallState> emit) async {
    // final currentState = state;
    loaderBloc.add(ShowLoaderEvent());
    emit(UserDataLoading());
    await Diowrapper(
      onsuccessfull: (response) {
        loaderBloc.add(HideLoaderEvent());
        Map<String, dynamic> getJson = response;
        List getValues = [getJson["id"]];
        emit(UserDataLoaded(response: response, list: getValues));
        print("the state is ============>>>>>>>>$getValues");
        // if (currentState is UserDataLoaded) {
        //   emit(currentState.copyWith(response, []));
        // }

        //
      },
      onProgressed: () {
        print("the print progress");
      },
      onerror: (errorMsg) {
        loaderBloc.add(HideLoaderEvent());
        emit(UserDataError(errorMessage: errorMsg));
      },
      urlBasic: event.urlBasic,
      formData: event.formData,
    ).postDioResponse();
  }

  
}
