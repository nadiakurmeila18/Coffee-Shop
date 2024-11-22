import 'package:flutter/material.dart';
import 'package:nafe_coffee2/kasir/pilih_meja.dart';



class DetailItemScreen extends StatelessWidget {
  final DetailItem detail;

  DetailItemScreen({required this.detail});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Meja: ${detail.meja}',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Nama: ${detail.nama}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Tanggal: ${detail.tanggal}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10,),
            Text(
              'Detail Item',
              style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 10,),
            
          ],
        ),
      ),
      
      
    );
  }}