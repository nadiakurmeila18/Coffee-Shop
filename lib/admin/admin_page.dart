import 'package:flutter/material.dart';
import 'package:nafe_coffee2/admin/manage_food.dart';
import 'package:nafe_coffee2/admin/manage_table.dart';
import 'package:nafe_coffee2/admin/manage_user.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,  // Menempatkan widget di tengah vertikal
            crossAxisAlignment: CrossAxisAlignment.stretch, // Memperluas tombol sesuai lebar layar
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ManageUsersScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, 
                backgroundColor: Colors.brown, 
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12), // Padding tombol
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15), // Bentuk sudut tombol
                  ),
                ),
                child: Text('Manage Users'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ManageFoodsScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, 
                  backgroundColor: Colors.brown, 
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12), // Padding tombol
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // Bentuk sudut tombol
                  ),
                ),
                child: Text('Manage Foods & Drinks'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ManageTablesScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, 
                  backgroundColor: Colors.brown, 
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12), // Padding tombol
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // Bentuk sudut tombol
                  ),
                ),
                child: Text('Manage Tables',),
              )
            ],
          ),
        ),
      ),
    );
  }
}
