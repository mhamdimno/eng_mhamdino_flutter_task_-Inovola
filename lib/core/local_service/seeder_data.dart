import '../../features/dropdowns/categories/data/model/cateogory_model.dart';
import 'local_service.dart';

class SeederDataManager {
  static Future<void> seedCategories(LocalService localService) async {
    final existingCategories = await localService.getAll<CateogoryModel>();

    // // Get all stored categories

    // Check if data already exists
    final categories = [
      CateogoryModel(
          title: 'Groceries', iconName: 'assets/icons/cart.png', id: 0),
      CateogoryModel(
          title: 'Entertainment',
          iconName: 'assets/icons/entertainment.png',
          id: 0),
      CateogoryModel(title: 'Gas', iconName: 'assets/icons/gas.png', id: 0),
      CateogoryModel(
          title: 'Shopping', iconName: 'assets/icons/shopping.png', id: 0),
      CateogoryModel(
          title: 'News Paper', iconName: 'assets/icons/news_papper.png', id: 0),
      CateogoryModel(
          title: 'Transport', iconName: 'assets/icons/transport.png', id: 0),
      CateogoryModel(title: 'Rent', iconName: 'assets/icons/rent.png', id: 0),
    ]
        .where((newCat) => !existingCategories.any((existingCat) =>
                existingCat.title ==
                newCat.title // Check for duplicates by title
            ))
        .toList();

    localService.putMany<CateogoryModel>(
      categories,
    );
  }
}
