import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APLIKASI Peminjaman',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(color: Color.fromARGB(255, 33, 243, 65)),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: const Text('Peminjaman'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PeminjamanInputScreen()),
                );
              },
            ),
            ListTile(
              title: const Text('Tentang'),
              onTap: () {
                Navigator.pop(context); 
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
  final double bunga; 

  Peminjaman({
    required this.kode,
    required this.nama,
    required this.kodePeminjaman,
    required this.tanggal,
    required this.kodeNasabah,
    required this.namaNasabah,
    required this.jumlahPinjaman,
    required this.lamaPinjaman,
  }) : bunga = 12.0; 

  double get angsuranPokok => jumlahPinjaman / lamaPinjaman;

  double get totalBunga => (jumlahPinjaman * (bunga / 100));

  double get bungaPerBulan => totalBunga / lamaPinjaman;

  double get angsuranPerBulan => angsuranPokok + bungaPerBulan;

  double get totalHutang => jumlahPinjaman + totalBunga;
}

class PeminjamanInputScreen extends StatefulWidget {
  const PeminjamanInputScreen({super.key});

  @override
  _PeminjamanInputScreenState createState() => _PeminjamanInputScreenState();
}

class _PeminjamanInputScreenState extends State<PeminjamanInputScreen> {
  final TextEditingController _kodeController = TextEditingController();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _kodePeminjamanController = TextEditingController();
  final TextEditingController _kodeNasabahController = TextEditingController();
  final TextEditingController _namaNasabahController = TextEditingController();
  final TextEditingController _jumlahPinjamanController = TextEditingController();
  final TextEditingController _lamaPinjamanController = TextEditingController();

  void _showResult() {
    final peminjaman = Peminjaman(
      kode: _kodeController.text,
      nama: _namaController.text,
      kodePeminjaman: _kodePeminjamanController.text,
      tanggal: DateTime.now(),
      kodeNasabah: _kodeNasabahController.text,
      namaNasabah: _namaNasabahController.text,
      jumlahPinjaman: double.parse(_jumlahPinjamanController.text),
      lamaPinjaman: int.parse(_lamaPinjamanController.text),
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Detail Peminjaman'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Jumlah Pinjaman: ${peminjaman.jumlahPinjaman.toStringAsFixed(2)}'),
            Text('Lama Pinjaman: ${peminjaman.lamaPinjaman} bulan'),
            Text('Bunga: ${peminjaman.bunga} %'),
            Text('Angsuran Pokok: ${peminjaman.angsuranPokok.toStringAsFixed(2)}'),
            Text('Bunga Per Bulan: ${peminjaman.bungaPerBulan.toStringAsFixed(2)}'),
            Text('Angsuran Per Bulan: ${peminjaman.angsuranPerBulan.toStringAsFixed(2)}'),
            Text('Total Hutang: ${peminjaman.totalHutang.toStringAsFixed(2)}'),
          ],
        ),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Input Peminjaman')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _kodeController,
              decoration: const InputDecoration(labelText: 'Kode'),
            ),
            TextField(
              controller: _namaController,
              decoration: const InputDecoration(labelText: 'Nama'),
            ),
            TextField(
              controller: _kodePeminjamanController,
              decoration: const InputDecoration(labelText: 'Kode Peminjaman'),
            ),
            TextField(
              controller: _kodeNasabahController,
              decoration: const InputDecoration(labelText: 'Kode Nasabah'),
            ),
            TextField(
              controller: _namaNasabahController,
              decoration: const InputDecoration(labelText: 'Nama Nasabah'),
            ),
            TextField(
              controller: _jumlahPinjamanController,
              decoration: const InputDecoration(labelText: 'Jumlah Pinjaman'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _lamaPinjamanController,
              decoration: const InputDecoration(labelText: 'Lama Pinjaman (bulan)'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _showResult,
              child: const Text('Hitung'),
            ),
          ],
        ),
      ),
    );
  }
}