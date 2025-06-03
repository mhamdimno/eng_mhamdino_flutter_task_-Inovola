import 'package:injectable/injectable.dart';

import '../../data/model/currency_model.dart';
import '../repository/currency_repository.dart';
import 'package:shared/shared.dart';

@injectable
class GetCurrencyDataUseCase
    extends AppAsyncUseCase<Result<List<CurrencyModel>>, NoParams> {
  final CurrencyRepository _currencyRepository;

  GetCurrencyDataUseCase(this._currencyRepository);

  @override
  Future<Result<List<CurrencyModel>>> execute(NoParams params) async {
    try {
      final currencyModel = await _currencyRepository.getCurrencyData();
      return Result.success(data: currencyModel.items);
    } catch (error) {
      return Result.failed(error: handleError(error));
    }
  }
}
