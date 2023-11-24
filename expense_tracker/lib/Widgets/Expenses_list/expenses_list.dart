import 'package:expense_tracker/Models/expense.dart';
import 'package:expense_tracker/Widgets/Expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expense});

  final List<Expense> expense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expense.length,
      itemBuilder: (context, index) => ExpenseItem(expense[index]),
    );
  }
}
