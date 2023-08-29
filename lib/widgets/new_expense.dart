import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amauntController = TextEditingController();

  // var _enteredTitle = "";

  // void _saveTitleInput(String inputValue) {
  //   _enteredTitle = inputValue;
  // }
  @override
  void dispose() {
    _titleController.dispose();
    _amauntController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text("Title"),
            ),
          ),
          TextField(
            controller: _amauntController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              prefixText: "\$ ",
              label: Text("Amount"),
            ),
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {},
                child: const Text("cancel"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("save expense"),
              )
            ],
          )
        ],
      ),
    );
  }
}
