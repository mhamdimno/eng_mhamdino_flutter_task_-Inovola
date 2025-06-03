import 'expense_model.dart';

class HomeModel {
  List<ExpenseModel> expensedList = [];
  HomeModel({
    this.expensedList = const [],
  });

  double get totalExpenses => expensedList.fold(
      0.0, (previousValue, element) => previousValue + (element.amount ?? 0.0));
  double get totalIncome => 100000;
  double get totalBalance => totalIncome - totalExpenses;

  // Named constructor for easier instantiation
}
