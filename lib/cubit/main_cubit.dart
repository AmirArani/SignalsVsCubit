import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainLoadedState(counter: 0));

  void count() {
    int number = (state as MainLoadedState).counter;
    number++;
    emit(MainLoadedState(counter: number));
  }
}
