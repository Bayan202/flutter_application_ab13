import 'dart:async';

import 'package:flutter_application_ab9/presentation/screen/scan.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

void main() {
  group('QRCodeProcessor Tests', () {
    test('should return null for null input', () {
      final processor = QRCodeProcessor();
      expect(processor.processQRCode(null), isNull);
    });

    test('should return same string for valid input', () {
      final processor = QRCodeProcessor();
      const qrCode = 'validCode';
      expect(processor.processQRCode(qrCode), qrCode);
    });
  });

  group('CameraControllerMock Tests', () {
    test('should stream barcodes', () async {
      final expectedBarcode = Barcode('expectedCode', BarcodeFormat.qrcode, []);
      final streamController = StreamController<Barcode>();
      final controllerMock = CameraControllerMock(streamController.stream);

      streamController.add(expectedBarcode);
      await expectLater(
          controllerMock.scannedDataStream, emits(expectedBarcode));
    });
  });
}
