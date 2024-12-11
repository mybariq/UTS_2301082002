import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Peminjaman',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  get Navigator => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              title: const Text('Peminjaman'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PeminjamanScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: const Center(child: Text('Selamat Datang di Aplikasi Peminjaman')),
    );
  }
}

class Peminjaman {
  final String kode;
  final String nama;
  final String kodePeminjaman;
  final DateTime tanggal;
  final String kodeNasabah;
  final String namaNasabah;
  final double jumlahPinjaman;
  final int lamaPinjaman;

  Peminjaman({
    required this.kode,
    required this.nama,
    required this.kodePeminjaman,
    required this.tanggal,
    required this.kodeNasabah,
    required this.namaNasabah,
    required this.jumlahPinjaman,
    required this.lamaPinjaman,
  });

  double get angsuranPokok => jumlahPinjaman / lamaPinjaman;

  double get bunga => jumlahPinjaman * 0.12;

  double get bungaPerBulan => bunga / 12;

  double get angsuranPerBulan => angsuranPokok + bungaPerBulan;

  double get totalHutang => jumlahPinjaman + bunga;
}

class PeminjamanScreen extends StatelessWidget {
  const PeminjamanScreen({super.key});

  @override
  Widget build(BuildContext context) {
  
    Peminjaman peminjaman = Peminjaman(
      kode: '001',
      nama: 'Pinjaman 1',
      kodePeminjaman: 'P001',
      tanggal: DateTime.now(),
      kodeNasabah: 'N001',
      namaNasabah: 'John Doe',
      jumlahPinjaman: 1000000,
      lamaPinjaman: 12,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Detail Peminjaman')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Jumlah Pinjaman: ${peminjaman.jumlahPinjaman.toStringAsFixed(2)}'),
            Text('Lama Pinjaman: ${peminjaman.lamaPinjaman} bulan'),
            Text('Angsuran Pokok: ${peminjaman.angsuranPokok.toStringAsFixed(2)}'),
            Text('Bunga Per Bulan: ${peminjaman.bungaPerBulan.toStringAsFixed(2)}'),
            Text('Angsuran Per Bulan: ${peminjaman.angsuranPerBulan.toStringAsFixed(2)}'),
            Text('Total Hutang: ${peminjaman.totalHutang.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}