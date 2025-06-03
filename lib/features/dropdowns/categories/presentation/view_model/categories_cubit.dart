import 'dart:async';
import 'package:eng_mhamdino_flutter_task/features/dropdowns/categories/domain/usecase/get_categories_data_use_case.dart';
import 'package:flutter/foundation.dart' show debugPrint;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:shared/shared.dart';

import '../../data/model/cateogory_model.dart';
import '../../domain/usecase/post_category_data_use_case.dart';

part 'categories_cubit.freezed.dart';

@freezed
class CategoriesState with _$CategoriesState {
  factory CategoriesState({
    @Default(false) bool isLoading,
    List<CateogoryModel>? categoriesList,
    CateogoryModel? selectedCategory,
    String? errorMessage,
  }) = _CategoriesState;
}

@injectable
class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(
    this._getCategoriesDataUseCase,
    this._postCategoryDataUseCase,
  ) : super(CategoriesState());
  final GetCategoriesDataUseCase _getCategoriesDataUseCase;
  final PostCategoryDataUseCase _postCategoryDataUseCase;

  void setSelectedCategory(CateogoryModel? value) {
    emit(state.copyWith(selectedCategory: value));
  }

  Future<void> getCategoriesData() async {
    emit(state.copyWith(isLoading: true));
    final result = await _getCategoriesDataUseCase.execute(const NoParams());
    result.when(success: (model) {
      emit(state.copyWith(isLoading: false, categoriesList: null));

      Future.delayed(const Duration(milliseconds: 200), () {
        emit(state.copyWith(isLoading: false, categoriesList: model));
      });

      emit(state.copyWith(isLoading: false, categoriesList: model));
    }, failed: (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.debugMessage));
    });
  }

  Future<void> addCatsData(CateogoryModel cateogoryModel) async {
    final result = await _postCategoryDataUseCase.execute(cateogoryModel);
    result.when(success: (_) {
      getCategoriesData();
    }, failed: (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.debugMessage));
    });
  }
}
