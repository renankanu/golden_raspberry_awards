import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:golden_raspberry_awards/core/core.dart';
import 'package:golden_raspberry_awards/features/dashboard/domain/entities/entities.dart';
import 'package:golden_raspberry_awards/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:golden_raspberry_awards/features/dashboard/domain/usecases/get_winner_by_year.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_winner_by_year_test.mocks.dart';

@GenerateMocks([DashboardRepository])
void main() {
  late MockDashboardRepository repository;
  late GetWinnerByYearUseCase usecase;
  late final List<WinnersByYear> tWinnersByYear;

  setUp(() {
    repository = MockDashboardRepository();
    usecase = GetWinnerByYearUseCase(repository);
    tWinnersByYear = [
      const WinnersByYear(
        id: 1,
        year: 2019,
        title: 'winner one',
      ),
      const WinnersByYear(
        id: 2,
        year: 2020,
        title: 'winner two',
      ),
    ];
    provideDummy<Either<Failure, List<WinnersByYear>>>(Right(tWinnersByYear));
  });

  test('should get winners by year from the repository', () async {
    // arrange
    when(repository.getWinnersByYear())
        .thenAnswer((_) async => Right(tWinnersByYear));
    // act
    final result = await usecase();
    // assert
    expect(result, Right(tWinnersByYear));
    verify(repository.getWinnersByYear());
    verifyNoMoreInteractions(repository);
  });
}
