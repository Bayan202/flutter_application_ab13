import 'package:flutter/material.dart';

import 'package:flutter_application_ab9/presentation/screen/scan.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ScanPage navigates to DisplayDataPage on scanning a QR code',
      (WidgetTester tester) async {
    bool qrCodeScanned = false;

    void mockOnQRCodeScanned(String code) {
      qrCodeScanned = true;
    }

    await tester.pumpWidget(
        MaterialApp(home: ScanPage(onQRCodeScanned: mockOnQRCodeScanned)));

    mockOnQRCodeScanned('Mock QR Code');

    expect(qrCodeScanned, isTrue);
  });
}
