import 'package:flutter/material.dart';

class ManageTablesScreen extends StatefulWidget {
  @override
  _ManageTablesScreenState createState() => _ManageTablesScreenState();
}

class _ManageTablesScreenState extends State<ManageTablesScreen> {
  List<Map<String, String>> tables = [
    {'tableNumber': '1', 'status': 'Available'},
    {'tableNumber': '2', 'status': 'Occupied'},
  ];

  final _tableController = TextEditingController();
  String? _selectedStatus = 'Available';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Tables'),
        backgroundColor: Colors.brown,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: tables.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    title: Text('Table ${tables[index]['tableNumber']}'),
                    subtitle: Text('Status: ${tables[index]['status']}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          tables.removeAt(index);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTableDialog, // Memanggil fungsi untuk membuka dialog
        backgroundColor: Colors.brown,
        child: Icon(Icons.add),
      ),
    );
  }

  // Fungsi untuk menampilkan dialog tambah meja
  void _addTableDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Table'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _tableController,
                decoration: InputDecoration(labelText: 'Table Number'),
                keyboardType: TextInputType.number,
              ),
              DropdownButtonFormField<String>(
                value: _selectedStatus,
                items: ['Available', 'Occupied'].map((String status) {
                  return DropdownMenuItem<String>(
                    value: status,
                    child: Text(status),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedStatus = newValue;
                  });
                },
                decoration: InputDecoration(labelText: 'Table Status'),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
              child: Text('Add'),
              onPressed: _addTable,
            ),
          ],
        );
      },
    );
  }

  // Fungsi untuk menambahkan meja ke daftar
  void _addTable() {
    if (_tableController.text.isNotEmpty) {
      setState(() {
        tables.add({
          'tableNumber': _tableController.text,
          'status': _selectedStatus!,
        });
        _tableController.clear();
        _selectedStatus = 'Available'; // Reset status ke default
      });
      Navigator.pop(context); // Menutup dialog setelah menambahkan meja
    }
  }

  @override
  void dispose() {
    _tableController.dispose();
    super.dispose();
  }
}
