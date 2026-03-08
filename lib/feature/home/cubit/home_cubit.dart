import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teska_boilerplate/feature/home/cubit/home_state.dart';

final class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  Future<void> example() async {
    emit(state.copyWith(isLoading: true));
    await Future<void>.delayed(const Duration(seconds: 2));
    emit(state.copyWith(isLoading: false));
  }
}
