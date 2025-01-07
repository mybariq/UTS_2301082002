import 'package:flutter/material.dart';
import 'nilai.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nilai Form',
      home: NilaiForm(),
    );
  }
}

class NilaiForm extends StatefulWidget {
  @override
  _NilaiFormState createState() => _NilaiFormState();
}

class _NilaiFormState extends State<NilaiForm> {
  final _formKey = GlobalKey<FormState>();
  String nobp = '';
  String nama = '';
  double nilaimtk = 0.0;
  double nilaifisika = 0.0;
  double nilaikimia = 0.0;
  double rata2 = 0.0;
  double max = 0.0;

  void _calculateNilai() {
    final nilai = Nilai(nobp, nama, nilaimtk, nilaifisika, nilaikimia);
    setState(() {
      rata2 = nilai.rata2;
      max = nilai.max;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Nilai'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'NOBP'),
                onChanged: (value) {
                  setState(() {
                    nobp = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter NOBP';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nama'),
                onChanged: (value) {
                  setState(() {
                    nama = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nilai MTK'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    nilaimtk = double.tryParse(value) ?? 0.0;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nilai Fisika'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    nilaifisika = double.tryParse(value) ?? 0.0;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nilai Kimia'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    nilaikimia = double.tryParse(value) ?? 0.0;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _calculateNilai();
                  }
                },
                child: Text('Submit'),
              ),
              SizedBox(height: 20),
              Text('Rata-rata: $rata2'),
              Text('Nilai Maksimum: $max'),
            ],
          ),
        ),
      ),
    );
  }
}
