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

    // Helper function to create dummy expense models
    List<ExpenseModel> createDummyExpenses(int count, int startId) {
      return List.generate(
        count,
        (i) {
          final expense = ExpenseModel(
            id: startId +
                i, // Changed from String to int as per new ExpenseModel
            convertedAmount: (100.0 + i),
            // 'date' and 'image' are optional for these tests and not directly used by cubit logic
            // date: '2023-01-${1 + i}',
            // image: 'image_url_${startId + i}',
            createdAt: DateTime(2023, 1, 1 + i, 10, 0, 0), // Setting createdAt
          );
          // Explicitly set dateSelected as it's a property, not a constructor parameter in the new ExpenseModel
          expense.dateSelected = DateTime(2023, 1, 1 + i);
          return expense;
        },
      );
    }

    // Test case 2: Fetching the first page of data successfully
    blocTest<HomeCubit, HomeState>(
      'emits loading and then success with first page data',
      build: () {
        // Mock the use case to return 10 items for the first page
        when(mockGetHomeDataUseCase.execute(HomeDto(page: 0, pageSize: 10)))
            .thenAnswer(
                (_) async => Result.success(data: createDummyExpenses(10, 1)));
        return homeCubit;
      },
      act: (cubit) => cubit.getHomeData(),
      wait: const Duration(milliseconds: 10), // Small wait for async operations
      expect: () => [
        // State when loading starts
        HomeState(isLoading: true),
        // State after successful data fetch
        HomeState(
          isLoading: false,
          homeModel: HomeModel(expensedList: createDummyExpenses(10, 1)),
          currentPage: 2, // Page incremented
          hasReachedMax: false, // Not reached max yet
        ),
      ],
      verify: (cubit) {
        // Verify that the use case was called with the correct DTO
        verify(mockGetHomeDataUseCase.execute(HomeDto(page: 1, pageSize: 10)))
            .called(1);
        expect(cubit.allExpenseList.length, 10);
      },
    );

    // Test case 3: Fetching subsequent pages of data successfully
    blocTest<HomeCubit, HomeState>(
      'emits loading and then success with appended data for subsequent pages',
      build: () {
        // Mock the use case for different pages
        when(mockGetHomeDataUseCase.execute(HomeDto(page: 1, pageSize: 10)))
            .thenAnswer(
                (_) async => Result.success(data: createDummyExpenses(10, 1)));
        when(mockGetHomeDataUseCase.execute(HomeDto(page: 2, pageSize: 10)))
            .thenAnswer(
                (_) async => Result.success(data: createDummyExpenses(10, 11)));
        return homeCubit;
      },
      act: (cubit) async {
        await cubit.getHomeData(); // Fetch first page
        await cubit.getHomeData(); // Fetch second page
      },
      wait: const Duration(seconds: 2), // Wait for both async calls with delay
      expect: () => [
        // First page states
        HomeState(isLoading: true),
        HomeState(
          isLoading: false,
          homeModel: HomeModel(expensedList: createDummyExpenses(10, 1)),
          currentPage: 2,
          hasReachedMax: false,
        ),
        // Second page states (after delay)
        HomeState(
          isLoading: true,
          homeModel: HomeModel(
              expensedList:
                  createDummyExpenses(10, 1)), // HomeModel from previous state
          currentPage: 2, // Current page before increment
          hasReachedMax: false,
        ),
        HomeState(
          isLoading: false,
          homeModel: HomeModel(
              expensedList: List.from(createDummyExpenses(10, 1))
                ..addAll(createDummyExpenses(10, 11))),
          currentPage: 3, // Page incremented again
          hasReachedMax: false,
        ),
      ],
      verify: (cubit) {
        verify(mockGetHomeDataUseCase.execute(HomeDto(page: 1, pageSize: 10)))
            .called(1);
        verify(mockGetHomeDataUseCase.execute(HomeDto(page: 2, pageSize: 10)))
            .called(1);
        expect(cubit.allExpenseList.length, 20);
      },
    );

    // Test case 4: `getHomeData` when `hasReachedMax` is true
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

    // Test case 5: Fetching the last page (fewer than page size items)
    blocTest<HomeCubit, HomeState>(
      'emits hasReachedMax true when fetching the last partial page',
      build: () {
        when(mockGetHomeDataUseCase.execute(HomeDto(page: 1, pageSize: 10)))
            .thenAnswer(
                (_) async => Result.success(data: createDummyExpenses(10, 1)));
        // Mock the use case to return 5 items for the second page (last page)
        when(mockGetHomeDataUseCase.execute(HomeDto(page: 2, pageSize: 10)))
            .thenAnswer(
                (_) async => Result.success(data: createDummyExpenses(5, 11)));
        return homeCubit;
      },
      act: (cubit) async {
        await cubit.getHomeData(); // Fetch first page
        await cubit.getHomeData(); // Fetch second (last) page
      },
      wait: const Duration(seconds: 2),
      expect: () => [
        // First page states
        HomeState(isLoading: true),
        HomeState(
          isLoading: false,
          homeModel: HomeModel(expensedList: createDummyExpenses(10, 1)),
          currentPage: 2,
          hasReachedMax: false,
        ),
        // Second page states (after delay)
        HomeState(
          isLoading: true,
          homeModel: HomeModel(expensedList: createDummyExpenses(10, 1)),
          currentPage: 2,
          hasReachedMax: false,
        ),
        HomeState(
          isLoading: false,
          homeModel: HomeModel(
              expensedList: List.from(createDummyExpenses(10, 1))
                ..addAll(createDummyExpenses(5, 11))),
          currentPage: 3,
          hasReachedMax: true, // Has reached max now
        ),
      ],
      verify: (cubit) {
        expect(cubit.allExpenseList.length, 15); // 10 + 5 items
        expect(cubit.state.hasReachedMax, true);
      },
    );

    // Test case 6: Fetching when an empty list is returned (no more data)
    blocTest<HomeCubit, HomeState>(
      'emits hasReachedMax true when an empty list is returned',
      build: () {
        when(mockGetHomeDataUseCase.execute(HomeDto(page: 1, pageSize: 10)))
            .thenAnswer(
                (_) async => Result.success(data: createDummyExpenses(10, 1)));
        // Mock the use case to return an empty list for the second page
        when(mockGetHomeDataUseCase.execute(HomeDto(
                page: 2,
                pageSize:
                    10))) // Corrected mockHomeDataUseCase to mockGetHomeDataUseCase
            .thenAnswer((_) async => const Result.success(data: []));
        return homeCubit;
      },
      act: (cubit) async {
        await cubit.getHomeData(); // Fetch first page
        await cubit.getHomeData(); // Fetch second (empty) page
      },
      wait: const Duration(seconds: 2),
      expect: () => [
        // First page states
        HomeState(isLoading: true),
        HomeState(
          isLoading: false,
          homeModel: HomeModel(expensedList: createDummyExpenses(10, 1)),
          currentPage: 2,
          hasReachedMax: false,
        ),
        // Second page states (after delay)
        HomeState(
          isLoading: true,
          homeModel: HomeModel(expensedList: createDummyExpenses(10, 1)),
          currentPage: 2,
          hasReachedMax: false,
        ),
        HomeState(
          isLoading: false,
          homeModel: HomeModel(
              expensedList:
                  createDummyExpenses(10, 1)), // List remains the same
          currentPage: 3,
          hasReachedMax: true, // Has reached max now
        ),
      ],
      verify: (cubit) {
        expect(cubit.allExpenseList.length, 10); // Still 10 items
        expect(cubit.state.hasReachedMax, true);
      },
    );

    // Test case 7: Error during data fetch

    // Test case 8: Reset pagination
    blocTest<HomeCubit, HomeState>(
      'resets pagination state correctly',
      build: () {
        homeCubit = HomeCubit(mockGetHomeDataUseCase);
        // Simulate some loaded data and state
        homeCubit.emit(homeCubit.state.copyWith(
          isLoading: false,
          homeModel: HomeModel(expensedList: createDummyExpenses(5, 1)),
          currentPage: 3,
          hasReachedMax: true,
          errorMessage: 'Some error',
        ));
        homeCubit.allExpenseList =
            createDummyExpenses(5, 1); // Also reset local list
        return homeCubit;
      },
      act: (cubit) => cubit.resetPagination(),
      expect: () => [
        HomeState(
          isLoading: false,
          homeModel: null, // Reset to null
          errorMessage: null, // Reset to null
          currentPage: 1, // Reset to 1
          hasReachedMax: false, // Reset to false
        ),
      ],
      verify: (cubit) {
        expect(
            cubit.allExpenseList, isEmpty); // allExpenseList should be cleared
      },
    );

    // Test case 9: Filtering already loaded data
  });
}
