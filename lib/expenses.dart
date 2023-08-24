import 'package:flutter/material.dart';
import 'package:wydatki2/models/expense.dart';

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
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text("1"),
          Text("2"),
          
        ],
      ),
    );
  }
}
