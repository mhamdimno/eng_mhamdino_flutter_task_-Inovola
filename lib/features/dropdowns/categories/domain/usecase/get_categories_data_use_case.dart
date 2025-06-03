import 'package:eng_mhamdino_flutter_task/features/dropdowns/categories/data/model/cateogory_model.dart';
import 'package:injectable/injectable.dart';

import '../repository/categories_repository.dart';
import 'package:shared/shared.dart';

@injectable
class GetCategoriesDataUseCase
    extends AppAsyncUseCase<Result<List<CateogoryModel>>, NoParams> {
  final CategoriesRepository _categoriesRepository;

  GetCategoriesDataUseCase(this._categoriesRepository);

  @override
  Future<Result<List<CateogoryModel>>> execute(NoParams params) async {
    try {
      final categoriesModel = await _categoriesRepository.getCategoriesData();
      return Result.success(data: categoriesModel);
    } catch (error) {
      return Result.failed(error: handleError(error));
    }
  }
}
