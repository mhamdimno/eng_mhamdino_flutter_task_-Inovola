import '../../../../home/data/model/expense_model.dart' show ExpenseModel;

abstract class AddExpenseRepository {
  Future<void> postAddExpenseData({required ExpenseModel expenseModel});
}
