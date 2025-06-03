import 'package:eng_mhamdino_flutter_task/features/dropdowns/categories/data/model/cateogory_model.dart';
import 'package:injectable/injectable.dart';

import '../repository/categories_repository.dart';
import 'package:shared/shared.dart';

@injectable
class PostCategoryDataUseCase
    extends AppAsyncUseCase<Result<NoResult>, CateogoryModel> {
  final CategoriesRepository _categoriesRepository;

  PostCategoryDataUseCase(this._categoriesRepository);

  @override
  Future<Result<NoResult>> execute(CateogoryModel params) async {
    try {
      await _categoriesRepository.addCategoryData(params);
      return const Result.success(data: NoResult());
    } catch (error) {
      return Result.failed(error: handleError(error));
    }
  }
}
