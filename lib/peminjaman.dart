class Peminjaman {
  final String kode;
  final String nama;
  final String kodePeminjaman;
  final DateTime tanggal;
  final String kodeNasabah;
  final String namaNasabah;
  final double jumlahPinjaman;
  final int lamaPinjaman; // dalam bulan

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