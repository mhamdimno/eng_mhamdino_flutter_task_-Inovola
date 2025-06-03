import 'package:api_service/api_service.dart';
import 'package:eng_mhamdino_flutter_task/core/local_service/local_service.dart';
import 'package:eng_mhamdino_flutter_task/core/local_service/objectbox_service.dart';
import 'package:eng_mhamdino_flutter_task/features/home/data/model/expense_model.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/constants/api_path.dart';

import '../../domain/repository/add_expense_repository.dart';
// static const String addExpense = '$_api/addExpense';

@Injectable(as: AddExpenseRepository)
class AddExpenseInRepositoryImpl extends AddExpenseRepository {
  AddExpenseInRepositoryImpl(this._localService);

  final LocalService _localService;

  @override
  Future<void> postAddExpenseData({required ExpenseModel expenseModel}) async {
    await _localService.put<ExpenseModel>(expenseModel);
  }
}
