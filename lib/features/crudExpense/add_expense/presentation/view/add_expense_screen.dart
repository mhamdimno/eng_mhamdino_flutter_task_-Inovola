import 'package:eng_mhamdino_flutter_task/features/dropdowns/categories/presentation/view_model/categories_cubit.dart';
import 'package:eng_mhamdino_flutter_task/features/dropdowns/currency/presentation/componants/currency_componant.dart';
import 'package:eng_mhamdino_flutter_task/features/dropdowns/date_picker/presentation/componants/date_picker_componant.dart';
import 'package:eng_mhamdino_flutter_task/features/dropdowns/file_picker/presentation/componants/file_picker_componant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:multi_dropdown/multi_dropdown.dart';
import 'package:shared/shared.dart';

import 'package:ui/ui.dart';
import '../../../../../core/di/di.dart';
import '../../../../dropdowns/categories/data/model/cateogory_model.dart';
import '../../../../dropdowns/categories/presentation/componants/categories_component.dart';
import '../view_model/add_expense_cubit.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final _formKey = GlobalKey<FormState>();

  late final AddExpenseCubit _addExpenseCubit;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeCubit();
  }

  Future<void> _initializeCubit() async {
    _addExpenseCubit = await getIt.getAsync<AddExpenseCubit>();
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) return const SizedBox();

    return BlocProvider<AddExpenseCubit>(
      create: (context) => _addExpenseCubit,
      child: BlocBuilder<AddExpenseCubit, AddExpenseState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const AppText('Add Expense'),
            ),
            body: (state.isLoading)
                ? const AppLoading()
                : state.errorMessage != null
                    ? Center(
                        child: AppText(state.errorMessage!)
                            .setAnimation(AnimateType.bounceInDown),
                      )
                    : SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          onChanged: () {
                            _addExpenseCubit.onFormValidationChanged(
                              _formKey.currentState?.validate() ?? false,
                            );
                          },
                          child: AppPadding(
                            child: Column(
                              children: [
                                30.heightBox,
                                Column(
                                  children: [
                                    AppTopTextInputField(
                                        topText: "Currency",
                                        child: CurrencyComponant(
                                          onSelectItem: (item) {
                                            _addExpenseCubit
                                                .setSelectedCurrency(item);
                                          },
                                        )),
                                    20.heightBox,
                                    AppTopTextInputField(
                                        topText: "Amount in EGP",
                                        child:
                                            _buildAmountField(context, state)),
                                    20.heightBox,
                                    AppTopTextInputField(
                                        topText: "Date",
                                        child: DatePickerComponant(
                                          onSelectItem: (date) {
                                            _addExpenseCubit.expenseDto.date =
                                                date.dateString;
                                            _addExpenseCubit.expenseDto
                                                .dateSelected = date.dateTime;
                                          },
                                          // isRequired: true,
                                        )),
                                    20.heightBox,
                                    AppTopTextInputField(
                                        topText: "Attach Receipt",
                                        child: FilePickerComponant(
                                          onSelectItem: (filePath) {
                                            _addExpenseCubit.expenseDto.image =
                                                filePath.path;
                                          },
                                          // isRequired: true,
                                        )),
                                  ],
                                ),
                                AppTopTextInputField(
                                    topWidget: const AppText(
                                      'Categories',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    child: CategoriesComponent(
                                      onSelectCategory: (item) {
                                        _addExpenseCubit.expenseDto.category
                                            .target = item as CateogoryModel?;
                                      },
                                    )),
                                20.heightBox,
                                _buildSaveButton(context, state).setAnimation(
                                  AnimateType.bounceInDown,
                                  delay: AppAnimations.delay_s1_2,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
          );
        },
      ),
    );
  }

  AppTextInputField _buildAmountField(
      BuildContext context, AddExpenseState state) {
    return AppTextInputField(
      controller: _addExpenseCubit.amountController,
      validator:
          AppFormValidator().requiredField("Amount is required").validate,
      hintText: "50 EGP",
      labelText: "Amount in EGP",
      keyboardType: TextInputType.number,
    );
  }

  Widget _buildSaveButton(BuildContext context, AddExpenseState state) {
    return AppButton(
      isLoading: state.isLoading,
      text: "Save",
      disabled: !state.isFormValid,
      type: ButtonType.primary,
      onTap: () {
        if (_formKey.currentState!.validate()) {
          _addExpenseCubit.addExpenseData(context);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Please fill in all required fields.'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
    );
  }
}
