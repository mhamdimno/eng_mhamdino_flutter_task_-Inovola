import 'package:eng_mhamdino_flutter_task/features/home/data/model/home_model.dart';

import '../../data/dto/home_dto.dart';
import '../../data/model/expense_model.dart';

abstract class HomeRepository {
  Future<List<ExpenseModel>> getExpensesData({required HomeDto homeDto});
}
