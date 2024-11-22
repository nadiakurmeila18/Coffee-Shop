import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nafe_coffee2/kasir/cetakNota.dart';

void main() {
  runApp(MyApp());
}

// Define the DetailItem class
class DetailItem {
  String meja;
  String nama;
  String tanggal;
  DetailItem({required this.meja, required this.nama, required this.tanggal});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pilih Meja',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: PilihMeja(),
    );
  }
}

class PilihMeja extends StatefulWidget {
  @override
  _PilihMejaState createState() => _PilihMejaState();
}

class _PilihMejaState extends State<PilihMeja> {
  String selectedMeja = ''; // This will hold the selected table
  String nama = ''; // For storing the user's inputted name
  String tanggal = ''; // For storing the selected date

  final List<String> mejaList = ['Meja 1', 'Meja 2', 'Meja 3', 'Meja 4', 'Meja 5'];
  final TextEditingController tanggalController = TextEditingController(); // Controller for date input

  // Function to select a date
  Future<void> _selectDate(BuildContext context) async {
    DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (selected != null) {
      setState(() {
        tanggal = DateFormat('dd-MM-yyyy').format(selected);
        tanggalController.text = tanggal; // Update the TextField with the selected date
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih Meja'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Pilih Meja',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // Input for name
            TextField(
              decoration: InputDecoration(
                labelText: 'Nama',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  nama = value;
                });
              },
            ),
            SizedBox(height: 20),

            // Date picker for date input
            TextField(
              decoration: InputDecoration(
                labelText: 'Tanggal',
                prefixIcon: Icon(Icons.calendar_today),
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.date_range),
                  onPressed: () => _selectDate(context),
                ),
              ),
              controller: tanggalController,
              readOnly: true,
            ),
            SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: mejaList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                      onPressed: () {
                        setState(() {
                          selectedMeja = mejaList[index];
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CheckoutPage(
                              selectedMeja: selectedMeja,
                              nama: nama,
                              tanggal: tanggal,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        mejaList[index],
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CheckoutPage extends StatelessWidget {
  final String selectedMeja;
  final String nama;
  final String tanggal;

  CheckoutPage({required this.selectedMeja, required this.nama, required this.tanggal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Meja yang dipilih: $selectedMeja',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),
            Text(
              'Nama: $nama',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),
            Text(
              'Tanggal: $tanggal',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Cetaknota(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text('Checkout', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
