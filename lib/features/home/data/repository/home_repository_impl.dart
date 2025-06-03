import 'package:eng_mhamdino_flutter_task/core/local_service/local_service.dart';
import 'package:eng_mhamdino_flutter_task/features/home/data/model/expense_model.dart';
import 'package:injectable/injectable.dart';
import 'package:eng_mhamdino_flutter_task/features/home/domain/repository/home_repository.dart';

import '../dto/home_dto.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl extends HomeRepository {
  final LocalService localService;

  HomeRepositoryImpl({required this.localService});

  @override
  Future<List<ExpenseModel>> getExpensesData({required HomeDto homeDto}) async {
    return await localService.getPaginatedData<ExpenseModel>(
      homeDto.page ?? 0,
      homeDto.pageSize ?? 100,
    );
  }
}
