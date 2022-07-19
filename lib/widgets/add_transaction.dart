import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTransaction extends StatefulWidget {
  final Function addTx;

  const AddTransaction(this.addTx, {Key? key}) : super(key: key);

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enterTitle = _titleController.text;
    final enterNumber = double.parse(_amountController.text);

    if (enterTitle.isEmpty || enterNumber <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTx(
      enterTitle,
      enterNumber,
      _selectedDate,
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickDate) {
      if (pickDate == null) {
        return;
      } else {
        setState(() {
          _selectedDate = pickDate;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
          // margin: EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: "Title"),
                // onChanged: (value) => titleInput = value,
                controller: _titleController,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Amount"),
                // onChanged: (value) => amountInput = value,
                controller: _amountController,
              ),
              SizedBox(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? "No Date Choosen!"
                            : 'Picked Date : ${DateFormat.yMMMd().format(_selectedDate!)}',
                      ),
                    ),
                    TextButton(
                        onPressed: _presentDatePicker,
                        child: const Text("Choose Date"))
                  ],
                ),
              ),
              ElevatedButton(
                  // color: Colors.white.withOpacity(0.8),
                  onPressed: _submitData,
                  child: const Text(
                    "Add Transaction",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          )),
    );
  } 
}
