import 'package:eng_mhamdino_flutter_task/features/home/data/dto/home_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:eng_mhamdino_flutter_task/features/home/data/model/home_model.dart';
import 'package:eng_mhamdino_flutter_task/features/home/domain/repository/home_repository.dart';
import 'package:shared/shared.dart';

import '../../data/model/expense_model.dart';

@injectable
class GetHomeDataUseCase
    extends AppAsyncUseCase<Result<List<ExpenseModel>?>, HomeDto> {
  final HomeRepository _homeRepository;

  GetHomeDataUseCase(this._homeRepository);

  @override
  Future<Result<List<ExpenseModel>?>> execute(HomeDto params) async {
    try {
      final expensedList =
          await _homeRepository.getExpensesData(homeDto: params);

      final sortedList = [...expensedList]
        ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

      return Result.success(
        data: sortedList,
      );
    } catch (error) {
      return Result.failed(error: handleError(error));
    }
  }
}
