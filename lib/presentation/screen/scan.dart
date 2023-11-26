import 'package:flutter/material.dart';

import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanPage extends StatefulWidget {
  final Function(String)? onQRCodeScanned;

  ScanPage({Key? key, this.onQRCodeScanned}) : super(key: key);

  @override
  _ScanPageState createState() => _ScanPageState();
}

abstract class IQRViewController {
  Stream<Barcode> get scannedDataStream;

  void pauseCamera();
  void resumeCamera();
  void dispose();
}

class QRCodeProcessor {
  String? processQRCode(String? qrCode) {
    if (qrCode == null || qrCode.isEmpty) {
      return null;
    }

    return qrCode;
  }
}

class CameraControllerMock implements IQRViewController {
  final Stream<Barcode> _barcodeStream;

  CameraControllerMock(this._barcodeStream);

  @override
  Stream<Barcode> get scannedDataStream => _barcodeStream;

  @override
  void pauseCamera() {}

  @override
  void resumeCamera() {}

  @override
  void dispose() {}
}

class _ScanPageState extends State<ScanPage> {
  QRViewController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QRView(
        key: GlobalKey(debugLabel: 'QR'),
        onQRViewCreated: _onQRViewCreated,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (scanData.code != null) {
        controller.pauseCamera();
        widget.onQRCodeScanned?.call(scanData.code!);
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
