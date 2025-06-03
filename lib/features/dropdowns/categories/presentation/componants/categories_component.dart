import 'package:eng_mhamdino_flutter_task/features/dropdowns/currency/presentation/view_model/currency_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_dropdown/multi_dropdown.dart';

import 'package:ui/ui.dart';
import '../../../../../core/di/di.dart';
import '../../../file_picker/presentation/componants/file_picker_componant.dart';
import '../../data/model/cateogory_model.dart';
import '../view_model/categories_cubit.dart';

class CategoriesComponent extends StatefulWidget {
  const CategoriesComponent(
      {super.key, required this.onSelectCategory, required});
  final Function(CateogoryModel) onSelectCategory;

  @override
  State<CategoriesComponent> createState() => _CategoriesComponentState();
}

class _CategoriesComponentState extends State<CategoriesComponent> {
  late final CategoriesCubit _categoriesCubit;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeCubit();
  }

  Future<void> _initializeCubit() async {
    _categoriesCubit = await getIt.getAsync<CategoriesCubit>();
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) return const SizedBox();

    return BlocProvider<CategoriesCubit>(
      create: (context) => _categoriesCubit..getCategoriesData(),
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          return Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: GridView.count(
                crossAxisCount: 4,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: (state.categoriesList?.map((category) {
                      return _buildCategoryChip(
                        category,
                        _categoriesCubit,
                      ).setAnimation(AnimateType.spin,
                          delay: AppAnimations.delay_s1_2);
                    }).toList() ??
                    [])
                  ..add(_buildCategoryChip(
                    CateogoryModel(
                        title: 'Add Category',
                        id: -1,
                        iconName: 'assets/icons/add.png'),
                    _categoriesCubit,
                    isAddButton: true,
                    icon: Icons.add_circle_outline,
                  )),
              ));
        },
      ),
    );
  }

  Widget _buildCategoryChip(
      CateogoryModel cateogoryModel, CategoriesCubit cubit,
      {bool isAddButton = false, IconData? icon}) {
    final bool isSelected =
        cateogoryModel.title == cubit.state.selectedCategory?.title;
    return GestureDetector(
      onTap: isAddButton
          ? () {
              // Handle add category
              _showAddCategoryDialog(cubit);
            }
          : () {
              cubit.setSelectedCategory(cateogoryModel);
              widget.onSelectCategory(cateogoryModel);
            },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppImage(
              path: cateogoryModel.iconName ?? "",
              width: 50,
              height: 50,
              boxFit: BoxFit.fill,
              clipRRectBorderRadius: 20,
              borderColor: isSelected
                  ? context.colorScheme.primary
                  : Colors.transparent),
          const SizedBox(height: 5),
          AppText(
            maxLines: 1,
            // Using textTheme
            cateogoryModel.title ?? 'Unknown',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: isSelected ? context.colorScheme.primary : Colors.black,
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal),
          ),
        ],
      ),
    );
  }

  void _showAddCategoryDialog(CategoriesCubit cubit) {
    final TextEditingController newCategoryController = TextEditingController();
    CateogoryModel newCategory = CateogoryModel(
        // Default icon
        );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add New Category'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FilePickerComponant(onSelectItem: (file) {
                // Handle file selection if needed
                newCategory.iconName = file.path;
              }),
              20.heightBox,
              TextField(
                controller: newCategoryController,
                decoration: const InputDecoration(
                  hintText: 'Enter category name',
                  labelText: 'Category Name',
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                newCategory.title = newCategoryController.text.trim();
                if (newCategory.title?.isNotEmpty == true &&
                    cubit.state.categoriesList
                            ?.map((cat) => cat.title)
                            .toList()
                            .contains(newCategory) !=
                        true) {
                  cubit.addCatsData(newCategory);
                  Navigator.of(context).pop();
                } else if (newCategory.title?.isEmpty == true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Category name cannot be empty.'),
                        backgroundColor: Colors.red),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Category already exists.'),
                        backgroundColor: Colors.red),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }
}
