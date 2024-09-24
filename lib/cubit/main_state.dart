part of 'main_cubit.dart';

sealed class MainState extends Equatable {
  const MainState();
}

final class MainLoadedState extends MainState {
  final int counter;

  const MainLoadedState({required this.counter});

  @override
  List<Object> get props => [counter];
}
