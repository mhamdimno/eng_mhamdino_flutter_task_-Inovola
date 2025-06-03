import 'package:api_service/api_service.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/constants/api_path.dart';

import '../model/currency_model.dart';
import '../../domain/repository/currency_repository.dart';
// static const String currency = '$_api/currency';

@Injectable(as: CurrencyRepository)
class CurrencyInRepositoryImpl extends CurrencyRepository {
  CurrencyInRepositoryImpl(this._apiService);

  final ApiService _apiService;
  @override
  Future<CurrencyResponse> getCurrencyData() async {
    return await _apiService.get(
      ApiPath.latestUSD,
      queryParameters: {'apikey': ApiPath.apiKey, 'base_currency': 'EGP'},
      fromJson: CurrencyResponse.fromJson,
    );
  }
}
