import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/winner_by_year_usecases.dart';

part 'search_by_year_state.dart';

class SearchByYearCubit extends Cubit<SearchByYearState> {
  SearchByYearCubit(this.winnerByYearUseCase)
      : super(const SearchByYearInitial());

  final WinnerByYearUseCase winnerByYearUseCase;

  Future<void> getWinnerByYear(int year) async {
    emit(const SearchByYearLoading());
    final result = await winnerByYearUseCase(year);
    result.fold(
      (error) => emit(SearchByYearError(error.message)),
      (moviesWinner) => emit(SearchByYearLoaded(moviesWinner)),
    );
  }
}
