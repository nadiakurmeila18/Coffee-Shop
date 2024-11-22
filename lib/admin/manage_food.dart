import 'package:flutter/material.dart';

class ManageFoodsScreen extends StatefulWidget {
  @override
  _ManageFoodsScreenState createState() => _ManageFoodsScreenState();
}

class _ManageFoodsScreenState extends State<ManageFoodsScreen> {
  List<Map<String, String>> foods = [
    {'name': 'Espresso', 'price': '20.000'},
    {'name': 'Cappuccino', 'price': '25.000'},
  ];

  final _nameController = TextEditingController();
  final _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Foods & Drinks'),
        backgroundColor: Colors.brown,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: foods.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(foods[index]['name']!),
                    subtitle: Text('Price: ${foods[index]['price']}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          foods.removeAt(index);
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
        onPressed: _addFoodDialog, // Menambahkan fungsi untuk dialog tambah makanan
        backgroundColor: Colors.brown,
        child: Icon(Icons.add),
      ),
    );
  }

  // Fungsi untuk menampilkan dialog tambah makanan
  void _addFoodDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Food/Drink'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Food/Drink Name'),
              ),
              TextField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
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
              onPressed: _addFood,
            ),
          ],
        );
      },
    );
  }

  // Fungsi untuk menambahkan makanan ke daftar
  void _addFood() {
    if (_nameController.text.isNotEmpty && _priceController.text.isNotEmpty) {
      setState(() {
        foods.add({
          'name': _nameController.text,
          'price': _priceController.text,
        });
        _nameController.clear();
        _priceController.clear();
      });
      Navigator.pop(context); // Menutup dialog setelah menambahkan makanan
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    super.dispose();
  }
}
