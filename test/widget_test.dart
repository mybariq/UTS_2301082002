import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_uts_2301082002_b/main.dart';

void main() {
  testWidgets('Test Peminjaman Screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the home screen shows a welcome message.
    expect(find.text('Selamat Datang di Aplikasi Peminjaman'), findsOneWidget);

    // Open the drawer
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();

    // Tap on the 'Peminjaman' menu item
    await tester.tap(find.text('Peminjaman'));
    await tester.pumpAndSettle();

    // Verify that the Peminjaman screen displays the expected details
    expect(find.text('Detail Peminjaman'), findsOneWidget);
    expect(find.text('Jumlah Pinjaman:'), findsOneWidget);
    expect(find.text('Lama Pinjaman:'), findsOneWidget);
    expect(find.text('Angsuran Pokok:'), findsOneWidget);
    expect(find.text('Bunga Per Bulan:'), findsOneWidget);
    expect(find.text('Angsuran Per Bulan:'), findsOneWidget);
    expect(find.text('Total Hutang:'), findsOneWidget);
  });
}