import 'package:api_service/api_service.dart';
import 'package:eng_mhamdino_flutter_task/core/local_service/local_service.dart';
import 'package:eng_mhamdino_flutter_task/features/dropdowns/categories/data/model/cateogory_model.dart';
import 'package:eng_mhamdino_flutter_task/objectbox.g.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/constants/api_path.dart';

import '../../../../../core/local_service/objectbox_service.dart';
import '../../domain/repository/categories_repository.dart';
// static const String categories = '$_api/categories';

@Injectable(as: CategoriesRepository)
class CategoriesInRepositoryImpl extends CategoriesRepository {
  CategoriesInRepositoryImpl(this._localService);

  final LocalService _localService;

  @override
  Future<List<CateogoryModel>> getCategoriesData() async {
    return await _localService.getAll<CateogoryModel>();
  }

  @override
  Future<void> addCategoryData(CateogoryModel categoryModel) async {
    await _localService.put<CateogoryModel>(categoryModel);
  }
}
