import 'package:bloc_test/bloc_test.dart';
import 'package:eng_mhamdino_flutter_task/features/home/data/dto/home_dto.dart';
import 'package:eng_mhamdino_flutter_task/features/home/data/model/expense_model.dart';
import 'package:eng_mhamdino_flutter_task/features/home/data/model/home_model.dart';
import 'package:eng_mhamdino_flutter_task/features/home/domain/usecase/get_home_data_use_case.dart';
import 'package:eng_mhamdino_flutter_task/features/home/presentation/view_model/home_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared/shared.dart'; // Assuming shared contains the Result class

class MockGetHomeDataUseCase extends Mock implements GetHomeDataUseCase {}

// Generate a mock class for GetHomeDataUseCase
void main() {
  late MockGetHomeDataUseCase mockGetHomeDataUseCase;
  late HomeCubit homeCubit;

  // Set up common mocks and cubit initialization before each test
  setUp(() {
    mockGetHomeDataUseCase = MockGetHomeDataUseCase();
    homeCubit = HomeCubit(mockGetHomeDataUseCase);
  });

  // Clean up cubit after each test
  tearDown(() {
    homeCubit.close();
  });

  group('HomeCubit - Pagination', () {
    // Test case 1: Initial state of the cubit
    blocTest<HomeCubit, HomeState>(
      'emits HomeState with default values on initial creation',
      build: () => homeCubit,
      expect: () => [], // No events are emitted on initial creation
      verify: (cubit) {
        expect(cubit.state.isLoading, false);
        expect(cubit.state.homeModel, null);
        expect(cubit.state.currentPage, 1);
        expect(cubit.state.hasReachedMax, false);
        expect(cubit.allExpenseList, isEmpty);
      },
    );

    blocTest<HomeCubit, HomeState>(
      'does not fetch data if hasReachedMax is true',
      build: () {
        // Set up initial state where hasReachedMax is true
        homeCubit = HomeCubit(mockGetHomeDataUseCase);
        homeCubit.emit(homeCubit.state.copyWith(hasReachedMax: true));
        return homeCubit;
      },
      act: (cubit) => cubit.getHomeData(),
      expect: () => [], // No state changes expected
      verify: (cubit) {
        // Verify that the use case was never called
        verifyZeroInteractions(mockGetHomeDataUseCase);
      },
    );
  });
}
