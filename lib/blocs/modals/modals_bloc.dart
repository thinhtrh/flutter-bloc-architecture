//
// @author thinhth on 12/05/2021
//

import 'package:bloc/bloc.dart';
import 'package:todo_bloc/blocs/blocs.dart';
import 'package:todo_bloc/utils/utils.dart';

class ModalsBloc extends Bloc<ModalsEvent, ModalsState> {
  ModalsBloc() : super(const ModalsState()) {
    on<ShowLoadingEvent>(showLoading);
    on<HideLoadingEvent>(hideLoading);

    on<DisplayModal1Event>(displayModal1Event);
    on<HideModal1Event>(hideModal1Event);
  }

  void showLoading(ShowLoadingEvent event, Emitter<ModalsState> emit) {
    Loggers.d("_showLoading");
    emit(state.copyWith(loading: true));
  }

  void hideLoading(HideLoadingEvent event, Emitter<ModalsState> emit) {
    Loggers.d("_hideLoading");
    emit(state.copyWith(loading: false));
  }

  void displayModal1Event(DisplayModal1Event event, Emitter<ModalsState> emit) {
    // Loggers.d("displayModal1Event");
    emit(state.copyWith(modal1: event.modal1));
    // emit(DisplayModal1State());
  }

  void hideModal1Event(HideModal1Event event, Emitter<ModalsState> emit) {
    // Loggers.d("displayModal1Event");
    emit(state.copyWith(hideModal1: true));
  }
}
