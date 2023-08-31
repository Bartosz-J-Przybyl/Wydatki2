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
    final expensIndex = _registerredExpense.indexOf(expense);
    setState(() {
      _registerredExpense.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text("Expense deleted"),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _registerredExpense.insert(expensIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text("No expenses found.Try to adding some!"),
    );
    if (_registerredExpense.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registerredExpense,
        onRemoveExpense: _removeExpense,
      );
    }

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
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
