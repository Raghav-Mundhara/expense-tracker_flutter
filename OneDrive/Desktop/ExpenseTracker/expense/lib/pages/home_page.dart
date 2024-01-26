import 'package:expense/expense_data.dart';
import 'package:expense/models/expense-item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final newExpenseNameController = TextEditingController();
  final newExpenseAmountController = TextEditingController();

  void addNewExpense() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add new expense'),
          content: Column(
            children: [
              TextField(
                controller: newExpenseNameController,
              ),
              TextField(
                controller: newExpenseAmountController,
              ),
            ],
          ),
          actions: [
            MaterialButton(
              onPressed: save,
              child: const Text('Save'),
            ),
            MaterialButton(
              onPressed: cancel,
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  // save
  void save() {
    ExpenseItem newExpense = ExpenseItem(
      name: newExpenseNameController.text,
      amount: double.parse(newExpenseAmountController.text),
      dateTime: DateTime.now(),
    );
    Provider.of<ExpenseData>(context, listen: false).addNewExpense(newExpense);
  }

  void cancel() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        onPressed: addNewExpense,
        child: Icon(Icons.add),
      ),
    );
  }
}
