import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/Widgets/Expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expense, required this.OnRemoveExpense});

  final List<Expense> expense;
  final void Function(Expense expense) OnRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expense.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(expense[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error,
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        onDismissed: (direction) {
          OnRemoveExpense(expense[index]);
        },
        child: ExpenseItem(expense[index]),
      ),
    );
  }
}
