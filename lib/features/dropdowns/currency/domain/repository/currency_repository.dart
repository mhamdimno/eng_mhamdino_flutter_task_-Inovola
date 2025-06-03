import '../../data/model/currency_model.dart';

abstract class CurrencyRepository {
  Future<CurrencyResponse> getCurrencyData();
}
