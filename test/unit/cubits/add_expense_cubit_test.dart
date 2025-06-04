import 'package:bloc_test/bloc_test.dart';
import 'package:eng_mhamdino_flutter_task/features/add_expense/domain/usecase/post_add_expense_data_use_case.dart';
import 'package:eng_mhamdino_flutter_task/features/add_expense/presentation/view_model/add_expense_cubit.dart';
import 'package:eng_mhamdino_flutter_task/features/dropdowns/currency/data/model/currency_model.dart';
import 'package:eng_mhamdino_flutter_task/features/home/data/model/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared/shared.dart';

// Mock classes for dependencies
class MockPostAddExpenseDataUseCase extends Mock
    implements PostAddExpenseDataUseCase {}

class MockCurrencyModel extends Mock implements CurrencyModel {}

// class MockBuildContext extends Mock implements BuildContext {}

// // Mock NavigatorObserver to capture navigation events
// class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  late AddExpenseCubit addExpenseCubit;
  late MockPostAddExpenseDataUseCase mockPostAddExpenseDataUseCase;
  // Set up common mocks before each test
  setUp(() {
    mockPostAddExpenseDataUseCase = MockPostAddExpenseDataUseCase();
    addExpenseCubit = AddExpenseCubit(mockPostAddExpenseDataUseCase);

    // Register fallbacks for any objects that might be passed to 'any()' in mocktail
    registerFallbackValue(ExpenseModel());
    registerFallbackValue(MockCurrencyModel());
    registerFallbackValue(MaterialPageRoute(builder: (_) => Container()));
  });

  // Clean up after each test
  tearDown(() {
    addExpenseCubit.close();
  });

  group('AddExpenseCubit', () {
    // Test case for onFormValidationChanged
    blocTest<AddExpenseCubit, AddExpenseState>(
      'emits [isFormValid: true] when onFormValidationChanged is called with true',
      build: () => addExpenseCubit,
      act: (cubit) => cubit.onFormValidationChanged(true),
      expect: () => [
        AddExpenseState(isFormValid: true),
      ],
    );

    blocTest<AddExpenseCubit, AddExpenseState>(
      'emits [isFormValid: false] when onFormValidationChanged is called with false',
      build: () => addExpenseCubit,
      act: (cubit) => cubit.onFormValidationChanged(false),
      expect: () => [
        AddExpenseState(isFormValid: false),
      ],
    );

    // Test case for setSelectedCurrency

    // Test cases for convertCurrencyAmount
    test('convertCurrencyAmount returns 0.0 when no currency is selected', () {
      addExpenseCubit.amountController.text = '100';
      expect(addExpenseCubit.convertCurrencyAmount, 0.0);
    });

    test(
        'convertCurrencyAmount converts amount correctly with selected currency',
        () {
      final mockCurrency = MockCurrencyModel();
      when(() => mockCurrency.value).thenReturn(0.5); // Example conversion rate
      addExpenseCubit.setSelectedCurrency(mockCurrency);
      addExpenseCubit.amountController.text = '100';
      expect(addExpenseCubit.convertCurrencyAmount, 50.0); // 100 * 0.5
    });

    test('convertCurrencyAmount returns 0.0 for invalid amount input', () {
      final mockCurrency = MockCurrencyModel();
      when(() => mockCurrency.value).thenReturn(2.0);
      addExpenseCubit.setSelectedCurrency(mockCurrency);
      addExpenseCubit.amountController.text = 'abc'; // Invalid input
      expect(addExpenseCubit.convertCurrencyAmount,
          0.0); // Should default to 0 * 2.0
    });
    test('handles decimal amounts correctly', () {
      final mockCurrency = MockCurrencyModel();
      when(() => mockCurrency.value).thenReturn(1.5);
      addExpenseCubit.setSelectedCurrency(mockCurrency);
      addExpenseCubit.amountController.text = '10.5';
      expect(addExpenseCubit.convertCurrencyAmount, 15.75); // 10.5 * 1.5
    });

    test('convertCurrencyAmount returns 0.0 for negative amount input', () {
      final mockCurrency = MockCurrencyModel();

      when(() => mockCurrency.value).thenReturn(2.0);
      addExpenseCubit.setSelectedCurrency(mockCurrency);
      addExpenseCubit.amountController.text = '-10.0'; // Negative input
      expect(addExpenseCubit.convertCurrencyAmount,
          0.0); // Should default to 0 * 2.0
    });
    // Test cases for addExpenseData
  });
  group('setSelectedCurrency', () {
    test('updates the selectedCurrency in the state and expenseDto', () {
      final mockCurrency = MockCurrencyModel();
      when(() => mockCurrency.code).thenReturn('USD');
      when(() => mockCurrency.value).thenReturn(1.0);

      addExpenseCubit.setSelectedCurrency(mockCurrency);

      expect(addExpenseCubit.state.selectedCurrency, mockCurrency);
      expect(addExpenseCubit.expenseDto.currency.target, mockCurrency);
    });

    test('updates to null when null is passed', () {
      final mockCurrency = MockCurrencyModel();
      addExpenseCubit.setSelectedCurrency(mockCurrency); // Set initially
      addExpenseCubit.setSelectedCurrency(null); // Then set to null

      expect(addExpenseCubit.state.selectedCurrency, isNull);
      expect(addExpenseCubit.expenseDto.currency.target, isNull);
    });
  });

  group('onFormValidationChanged', () {
    blocTest<AddExpenseCubit, AddExpenseState>(
      'emits state with isFormValid true when isValid is true',
      build: () => addExpenseCubit,
      act: (cubit) => cubit.onFormValidationChanged(true),
      expect: () => [
        AddExpenseState(isFormValid: true),
      ],
    );

    blocTest<AddExpenseCubit, AddExpenseState>(
      'emits state with isFormValid false when isValid is false',
      build: () => addExpenseCubit,
      act: (cubit) => cubit.onFormValidationChanged(false),
      expect: () => [
        AddExpenseState(isFormValid: false),
      ],
    );
  });
}
