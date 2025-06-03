import 'package:eng_mhamdino_flutter_task/features/home/data/model/expense_model.dart';
import 'package:injectable/injectable.dart';

import '../repository/add_expense_repository.dart';
import 'package:shared/shared.dart';

@injectable
class PostAddExpenseDataUseCase
    extends AppAsyncUseCase<Result<NoResult>, ExpenseModel> {
  final AddExpenseRepository _addExpenseRepository;

  PostAddExpenseDataUseCase(this._addExpenseRepository);

  @override
  Future<Result<NoResult>> execute(ExpenseModel params) async {
    try {
      await _addExpenseRepository.postAddExpenseData(expenseModel: params);
      return const Result.success(data: NoResult());
    } catch (error) {
      return Result.failed(error: handleError(error));
    }
  }
}
