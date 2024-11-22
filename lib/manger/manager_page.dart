import 'package:flutter/material.dart';

class ManagerPage extends StatefulWidget {
  @override
  _ManagerPageState createState() => _ManagerPageState();
}

class _ManagerPageState extends State<ManagerPage> {
  List<Map<String, dynamic>> transactions = [
    {'employee': 'Nadia', 'date': DateTime(2024, 10, 1), 'amount': 100.0},
    {'employee': 'Nadin', 'date': DateTime(2024, 10, 2), 'amount': 150.0},
    {'employee': 'Alexa', 'date': DateTime(2024, 10, 1), 'amount': 200.0},
  ];

  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manager Transactions',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.brown,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh), // Refresh icon
            onPressed: () {
              setState(() {
                _selectedDate = null; // Reset selected date
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: Text('Select Date',style: TextStyle(color: Colors.brown),),
                ),
                SizedBox(width: 10),
                Text(
                  _selectedDate == null
                      ? 'No date selected'
                      : 'Selected: ${_selectedDate!.toLocal()}'.split(' ')[0],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredTransactions().length,
              itemBuilder: (context, index) {
                final transaction = _filteredTransactions()[index];
                return Card(
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    title: Text('Employee: ${transaction['employee']}'),
                    subtitle: Text(
                        'Date: ${transaction['date'].toLocal()} \nAmount: ${transaction['amount']}'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> _filteredTransactions() {
    if (_selectedDate == null) {
      return transactions;
    }
    return transactions.where((transaction) {
      return transaction['date'].year == _selectedDate!.year &&
          transaction['date'].month == _selectedDate!.month &&
          transaction['date'].day == _selectedDate!.day;
    }).toList();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }
}
