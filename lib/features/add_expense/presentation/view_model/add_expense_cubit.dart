import 'dart:async';
import 'package:eng_mhamdino_flutter_task/features/dropdowns/categories/domain/usecase/get_categories_data_use_case.dart';
import 'package:eng_mhamdino_flutter_task/features/dropdowns/categories/domain/usecase/post_category_data_use_case.dart';
import 'package:eng_mhamdino_flutter_task/features/dropdowns/currency/data/model/currency_model.dart';
import 'package:eng_mhamdino_flutter_task/features/home/data/model/expense_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:multi_dropdown/multi_dropdown.dart';

import 'package:shared/shared.dart';
import 'package:ui/ui.dart';

import '../../../../core/di/di.dart';
import '../../../dropdowns/categories/data/model/cateogory_model.dart';
import '../../domain/usecase/post_add_expense_data_use_case.dart';

part 'add_expense_cubit.freezed.dart';

@freezed
class AddExpenseState with _$AddExpenseState {
  factory AddExpenseState({
    @Default(false) bool isLoading,
    CurrencyModel? selectedCurrency,
    String? errorMessage,
    @Default(false) bool isFormValid,
  }) = _AddExpenseState;
}

@injectable
class AddExpenseCubit extends Cubit<AddExpenseState> {
  AddExpenseCubit(
    this._postAddExpenseDataUseCase,
  ) : super(AddExpenseState());
  final PostAddExpenseDataUseCase _postAddExpenseDataUseCase;
  TextEditingController amountController = TextEditingController();

  ExpenseModel expenseDto = ExpenseModel();
  // final NavigationService _navigationService = getIt<NavigationService>();
  FutureOr<void> onFormValidationChanged(bool isValid) async {
    emit(state.copyWith(isFormValid: isValid));
  }

  void setSelectedCurrency(CurrencyModel? value) {
    // catogeryController.clearAll();
    // catogeryController.selectWhere((element) => element.label == value?.title);
    expenseDto.currency.target = value;
    emit(state.copyWith(selectedCurrency: value));
  }

  double get convertCurrencyAmount {
    if (expenseDto.currency.target == null) return 0.0;
    if (amountController.text.contains("-")) return 0.0;
    final amount = double.tryParse(amountController.text) ?? 0;
    return amount * (expenseDto.currency.target?.value ?? 1.0);
  }

  Future<void> addExpenseData(BuildContext context) async {
    if (expenseDto.category.target == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: AppText('Please select a category',
              style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    expenseDto.originalAmount = double.tryParse(amountController.text) ?? 0;
    expenseDto.convertedAmount = convertCurrencyAmount;

    emit(state.copyWith(isLoading: true));
    final result = await _postAddExpenseDataUseCase.execute(expenseDto);
    result.when(success: (model) {
      Navigator.of(context).pop(true);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: AppText('Expense added successfully!',
              style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.green,
        ),
      );
    }, failed: (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.debugMessage));
    });
  }
}
