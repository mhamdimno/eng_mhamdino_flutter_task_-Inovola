import 'dart:async';
import 'package:eng_mhamdino_flutter_task/features/home/data/dto/home_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:eng_mhamdino_flutter_task/features/home/data/model/home_model.dart';
import 'package:eng_mhamdino_flutter_task/features/home/domain/usecase/get_home_data_use_case.dart';
import 'package:shared/shared.dart';

import '../../data/model/expense_model.dart';

part 'home_cubit.freezed.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingList,
    HomeModel? homeModel,
    @Default("All") String filter,
    String? errorMessage,
    @Default(1) int currentPage, // Current page number
    @Default(false) bool hasReachedMax, // Indicates if all data has been loaded
  }) = _HomeState;
}

@injectable
class HomeCubit extends Cubit<HomeState> {
  List<ExpenseModel> allExpenseList = []; // Local list to hold expenses
  HomeCubit(this._getHomeDataUseCase) : super(HomeState());
  final GetHomeDataUseCase _getHomeDataUseCase;

  static const int _pageSize = 10; // Define your page size

  Future<void> getHomeData() async {
    if (state.hasReachedMax) return; // Don't fetch if all data is loaded

    // If it's the first fetch and not loading, or if it's not the first fetch and not loading and not reached max
    if (state.isLoading && state.currentPage == 1) {
      // If currently loading the first page, just return to avoid duplicate calls.
      return;
    }

    emit(state.copyWith(isLoading: true));
    if (state.currentPage > 1) {
      await Future.delayed(const Duration(seconds: 1)); // Use await here
    }
    // Optional delay for UI smoothness
    final homeDto = HomeDto(page: state.currentPage, pageSize: _pageSize);
    final result = await _getHomeDataUseCase.execute(homeDto);

    result.when(success: (items) {
      final List<ExpenseModel> newItems = items ?? [];
      final List<ExpenseModel> currentItems =
          state.homeModel?.expensedList ?? [];

      // Append new items to the existing list
      final updatedList = List<ExpenseModel>.from(currentItems)
        ..addAll(newItems);

      // Determine if all data has been loaded
      final hasReachedMax = newItems.isEmpty || newItems.length < _pageSize;
      allExpenseList = updatedList;
      emit(state.copyWith(
        isLoading: false,
        homeModel: HomeModel(
            expensedList: filterList(
          state.filter,
        )),
        currentPage: state.currentPage + 1,
        hasReachedMax: hasReachedMax,
      ));
    }, failed: (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.debugMessage));
    });
  }

  // Optional: A method to reset the pagination state
  void resetPagination() {
    emit(state.copyWith(
      isLoading: false,
      homeModel: null,
      errorMessage: null,
      currentPage: 1,
      hasReachedMax: false,
    ));
  }

  onFilterChanged(String filter) {
    // This method can be called when the filter changes
    final filteredList = filterList(
      filter,
    );
    emit(state.copyWith(
      homeModel: HomeModel(expensedList: filteredList),
    ));
  }

  List<ExpenseModel> filterList(String? filter) {
    final now = DateTime.now();
    return allExpenseList.where((item) {
      final DateTime itemDate = item.dateSelected ?? DateTime.now();
      debugPrint("👀itemDate $itemDate");
      switch (filter) {
        case 'This month':
          return itemDate.year == now.year && itemDate.month == now.month;
        case 'Last month':
          // Calculate last month
          final lastMonth = now.month == 1 ? 12 : now.month - 1;
          final lastMonthYear = now.month == 1 ? now.year - 1 : now.year;
          return itemDate.year == lastMonthYear && itemDate.month == lastMonth;
        case 'Last 7 days':
          final sevenDaysAgo = now.subtract(const Duration(days: 7));
          return itemDate.isAfter(sevenDaysAgo) &&
              itemDate
                  .isBefore(now.add(const Duration(days: 1))); // Include today
        case 'Last year':
          return itemDate.year == now.year - 1;
        default:
          return true; // No filter, show all
      }
    }).toList();
  }
}
