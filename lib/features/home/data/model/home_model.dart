import 'expense_model.dart';

class HomeModel {
  List<ExpenseModel> expensedList = [];
  HomeModel({
    this.expensedList = const [],
  });

  double get totalExpensesConverted => expensedList.fold(
      0.0,
      (previousValue, element) =>
          previousValue + (element.convertedAmount ?? 0.0));
  // double get totalIncomeConverted => 100000;
  // double get totalBalanceConverted =>
  //     totalIncomeConverted - totalExpensesConverted;

  double get totalExpensesOriginal => expensedList.fold(
      0.0,
      (previousValue, element) =>
          previousValue + (element.originalAmount ?? 0.0));
  // double get totalIncomeOrignal => 50000000;
  // double get totalBalanceOriginal => totalIncomeOrignal - totalExpensesOriginal;

  // String get totalBalanceFormateted =>
  //     '${totalBalanceConverted.toStringAsFixed(2)} \$\n≈${totalBalanceOriginal.toStringAsFixed(2)}EGP';
  // String get totalIncomeFormateted =>
  //     '${totalIncomeConverted.toStringAsFixed(2)} \$\n≈${totalIncomeOrignal.toStringAsFixed(2)}EGP';
  // String get totalExpensesFormateted =>
  //     '-${totalExpensesConverted.toStringAsFixed(2)} \$\n≈-${totalExpensesOriginal.toStringAsFixed(2)} EGP';

  // Named constructor for easier instantiation
}
