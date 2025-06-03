import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ui/ui.dart';

import '../../data/model/expense_model.dart';

class ExpensedItem extends StatelessWidget {
  const ExpensedItem({
    super.key,
    required this.expense,
  });

  final ExpenseModel? expense;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 2,
      ),
      child: Card(
        elevation: 0,
        child: ListTile(
          leading: AppImage(
            path:
                expense?.category.target?.iconName ?? 'assets/images/logo.png',
            width: 40,
            height: 40,
            boxFit: BoxFit.cover,
            clipRRectBorderRadius: 20,
          ),
          title: AppText(
            expense?.category.target?.title ?? 'Unknown Category',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          subtitle: AppText(
            expense?.date,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          trailing: AppText(
            '- \$ ${expense?.amount?.toStringAsFixed(2)}',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  // color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ).setAnimation(AnimateType.slideInDown),
    );
  }
}
