import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_main/Counter_Bloc/counter_event.dart';
import 'package:flutter_bloc_main/Counter_Bloc/counter_state.dart';


class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super( CounterState()) {
    on<IncrementCounter>(_increment);
    on<DecrementCounter>(_decrement);
    on<SwitchEvent>(_switchEvent);
  }

  void _increment(IncrementCounter event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter + 1));
  }

  

  void _decrement(DecrementCounter event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter - 1));
  }

  void _switchEvent(SwitchEvent event, Emitter<CounterState> emit) {
    emit(state.copyWith(isSwitchOn: !state.isSwitchOn));
  }
}
