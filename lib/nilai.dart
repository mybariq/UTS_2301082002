class Nilai {
  String nobp;
  String nama;
  double nilaimtk;
  double nilaifisika;
  double nilaikimia;
  late double rata2;
  late double max;

  Nilai(this.nobp, this.nama, this.nilaimtk, this.nilaifisika, this.nilaikimia) {
    rata2 = calculateAverage();
    max = findMax();
  }

  double calculateAverage() {
    return (nilaimtk + nilaifisika + nilaikimia) / 3;
  }

  double findMax() {
    return [nilaimtk, nilaifisika, nilaikimia].reduce((a, b) => a > b ? a : b);
  }
}
