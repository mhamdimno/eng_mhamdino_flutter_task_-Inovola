import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:shared/shared.dart';
import '../../data/model/currency_model.dart';
import '../../domain/usecase/get_currency_data_use_case.dart';

part 'currency_cubit.freezed.dart';

@freezed
class CurrencyState with _$CurrencyState {
  factory CurrencyState({
    @Default(false) bool isLoading,
    List<CurrencyModel>? currencyList,
    String? errorMessage,
  }) = _CurrencyState;
}

@injectable
class CurrencyCubit extends Cubit<CurrencyState> {
  CurrencyCubit(this._getCurrencyDataUseCase) : super(CurrencyState());
  final GetCurrencyDataUseCase _getCurrencyDataUseCase;

  Future<void> getCurrencyData() async {
    emit(state.copyWith(isLoading: true));
    final result = await _getCurrencyDataUseCase.execute(const NoParams());
    result.when(success: (model) {
      emit(state.copyWith(isLoading: false, currencyList: null));
      Future.delayed(const Duration(milliseconds: 50), () {
        emit(state.copyWith(isLoading: false, currencyList: model));
      });
    }, failed: (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.debugMessage));
    });
  }
}
