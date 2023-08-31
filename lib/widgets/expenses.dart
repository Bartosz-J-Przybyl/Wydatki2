import 'package:flutter/material.dart';
import 'package:wydatki2/models/expense.dart';
import 'package:wydatki2/widgets/expenses_list/expenses_list.dart';
import 'package:wydatki2/widgets/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registerredExpense = [
    Expense(
      category: Category.work,
      title: "title",
      amount: 19.99,
      date: DateTime.now(),
    ),
    Expense(
      category: Category.leisure,
      title: "title2",
      amount: 01.99,
      date: DateTime.now(),
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registerredExpense.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _registerredExpense.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text("1"),
          Expanded(
            child: ExpensesList(
              expenses: _registerredExpense,
              onRemoveExpense: _removeExpense,
            ),
          ),
        ],
      ),
    );
  }
}
