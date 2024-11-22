import 'package:flutter/material.dart';
import 'package:nafe_coffee2/kasir/battom_navbar.dart';
import 'package:nafe_coffee2/kasir/pilih_meja.dart';

void main() => runApp(CoffeeApp());

class CoffeeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int total = 0;
  int _selectedCategoryIndex = 0; // Untuk melacak kategori yang dipilih

  Map<String, int> quantities = {
    'Americano': 0,
    'Latte': 0,
    'Matcha Latte': 0,
    'Cappuccino': 0,
    'Redvelvet': 0,
    'Nasi Lemak': 0,
    'Nasi Goreng': 0,
    'Nasi Katsu': 0,
    'Steak': 0,
    'Spaghetti': 0,
    'Donat': 0,
    'Risol': 0,
    'Cromboloni': 0,
    'Salad': 0,
  };

  void updateTotal() {
    total = quantities.entries.fold(0, (sum, entry) {
      int price = 0;
      switch (entry.key) {
        case 'Americano':
          price = 10000;
          break;
        case 'Latte':
          price = 14000;
          break;
        case 'Matcha Latte':
          price = 15000;
          break;
        case 'Cappuccino':
          price = 12000;
          break;
        case 'Redvelvet':
          price = 15000;
          break;
        case 'Nasi Lemak':
          price = 15000;
          break;
        case 'Nasi Goreng':
          price = 15000;
          break;
        case 'Nasi Katsu':
          price = 18000;
          break;
        case 'Steak':
          price = 25000;
          break;
        case 'Spaghetti':
          price = 20000;
          break;
        case 'Donat':
          price = 6000;
          break;
        case 'Risol':
          price = 10000;
          break;
        case 'Cromboloni':
          price = 8000;
          break;
        case 'Salad':
          price = 12000;
          break; 
      }
       return sum + (price * entry.value ~/ 1000);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Gambar di bagian atas
          Container(
            width: double.infinity,
            height: 236,
            child: Image.asset(
              'assets/images/latar.png',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20,),
          // Kategori (Drink, Food, Snack)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CategoryTab(
                text: 'Drink',
                isSelected: _selectedCategoryIndex == 0,
                onTap: () {
                  setState(() {
                    _selectedCategoryIndex = 0;
                  });
                },
              ),
              CategoryTab(
                text: 'Food',
                isSelected: _selectedCategoryIndex == 1,
                onTap: () {
                  setState(() {
                    _selectedCategoryIndex = 1;
                  });
                },
              ),
              CategoryTab(
                text: 'Snack',
                isSelected: _selectedCategoryIndex == 2,
                onTap: () {
                  setState(() {
                    _selectedCategoryIndex = 2;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 16),
          // Konten berdasarkan kategori yang dipilih
          Expanded(
            child: IndexedStack(
              index: _selectedCategoryIndex,
              children: [
                DrinkMenu(buildMenuItem),
                FoodMenu(buildMenuItem),
                SnackMenu(buildMenuItem),
              ],
            ),
          ),
          // Total dan tombol Checkout
          Container(
            padding: EdgeInsets.all(16),
            color: Color(0xFFF8F4E1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total : ${total}K', style: TextStyle(fontSize: 18, color: Colors.red)),
                ElevatedButton(
                  onPressed: () {
                    // Aksi navigasi ke halaman Pilih Meja
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PilihMeja(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Checkout'),
                ),
              ],
            ),
          ),

        ],
      ),
      bottomNavigationBar: BottomNav(selectedItem: 0),
    );
  }

  Widget buildMenuItem(String name, int price, String imagePath) {
    return ListTile(
      leading: Image.asset(
        imagePath,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
      title: Text(name, style: TextStyle(fontSize: 18)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (quantities[name]! > 0) {
                  quantities[name] = quantities[name]! - 1;
                  updateTotal();
                }
              });
            },
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              backgroundColor: Color(0xFFAF8F6F),
              
            ),
            child: Icon(Icons.remove, color: Colors.white),
          ),
          SizedBox(width: 2),
          Text(
            quantities[name].toString(),
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(width: 2),
          ElevatedButton(
            onPressed: () {
              setState(() {
                quantities[name] = quantities[name]! + 1;
                updateTotal();
              });
            },
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              backgroundColor: Colors.brown,
            ),
            child: Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
      subtitle: Text('${price ~/ 1000}K', style: TextStyle(fontSize: 18, color: Colors.red)),
    );
  }
}

// Kategori minuman
class DrinkMenu extends StatelessWidget {
  final Function buildMenuItem;
  DrinkMenu(this.buildMenuItem);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        buildMenuItem('Americano', 10000, 'assets/images/americano.png'),
        buildMenuItem('Latte', 14000, 'assets/images/late.png'),
        buildMenuItem('Matcha Latte', 15000, 'assets/images/matcha.png'),
        buildMenuItem('Cappuccino', 12000, 'assets/images/capucino.png'),
        buildMenuItem('Redvelvet', 15000, 'assets/images/redvelvet.png'),
      ],
    );
  }
}

// Kategori makanan
class FoodMenu extends StatelessWidget {
  final Function buildMenuItem;
  FoodMenu(this.buildMenuItem);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        buildMenuItem('Nasi Lemak', 15000, 'assets/images/nlemak.png'),
        buildMenuItem('Nasi Goreng', 15000, 'assets/images/ngoreng.png'),
        buildMenuItem('Nasi Katsu', 18000, 'assets/images/nkatsu.png'),
        buildMenuItem('Steak', 25000, 'assets/images/steak.png'),
        buildMenuItem('Spaghetti', 20000, 'assets/images/spageti.png'),
      ],
    );
  }
}

// Kategori snack
class SnackMenu extends StatelessWidget {
  final Function buildMenuItem;
  SnackMenu(this.buildMenuItem);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        buildMenuItem('Donat', 6000, 'assets/images/donat.png'),
        buildMenuItem('Risol', 10000, 'assets/images/risol.png'),
        buildMenuItem('Cromboloni', 8000, 'assets/images/cromboloni.png'),
        buildMenuItem('Salad', 12000, 'assets/images/salad.png'),
        
      ],
    );
  }
}

// Tab kategori
class CategoryTab extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  CategoryTab({required this.text, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: isSelected ? Colors.brown : Colors.grey,
        ),
      ),
    );
  }
}

