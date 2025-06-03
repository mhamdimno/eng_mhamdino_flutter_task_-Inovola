import 'package:eng_mhamdino_flutter_task/objectbox.g.dart';

import '../../data/model/cateogory_model.dart';

abstract class CategoriesRepository {
  Future<List<CateogoryModel>> getCategoriesData();
  Future<void> addCategoryData(CateogoryModel categoryModel);
  // Future<void> updateCategoryData(CateogoryModel categoryModel);
  // Future<void> deleteCategoryData(int id);
}
