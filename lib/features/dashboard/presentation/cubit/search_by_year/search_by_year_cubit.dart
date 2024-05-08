import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/get_winner_by_year.dart';

part 'search_by_year_state.dart';

class SearchByYearCubit extends Cubit<SearchByYearState> {
  final GetWinnerByYearUseCase winnerByYearUseCase;

  SearchByYearCubit(this.winnerByYearUseCase)
      : super(const SearchByYearInitial());

  Future<void> getWinnerByYear(int year) async {
    emit(const SearchByYearLoading());
    final result = await winnerByYearUseCase(year);
    result.fold(
      (error) => emit(SearchByYearError(error.message)),
      (moviesWinner) => emit(SearchByYearLoaded(moviesWinner)),
    );
  }
}
