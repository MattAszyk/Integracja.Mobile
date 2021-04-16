import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:integracja/controllers/home_page/home_page_controller.dart';
import 'package:integracja/network/api/game_repository.dart';
import 'package:integracja/network/api_exception.dart';
import 'package:integracja/pages/qr_scanner/qr_error.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScanner extends StatefulWidget {
  @override
  _QrScannerState createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  bool scanned = false;
  Barcode result;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    }
    controller.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Get.back()),
        centerTitle: true,
        title: const Text(
          'Skanowanie gry',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: _buildQrView(context),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
    );
  }

  void _onQRViewCreated(QRViewController controller) async {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      if (!scanned) {
        GameRepository.join(scanData.code).then((value) {
          Get.find<HomePageController>().refresh();
          Get.back();
        }).catchError((e) {
          var errors = {
            'Gra przepełniona.',
            'Gra już się skończyła.',
            'Dołączyłeś już do tej gry.'
          };
          switch (e.codeStatus) {
            case 6:
              Get.off(() => QrError(errors.elementAt(0)));
              break;
            case 5:
              Get.off(() => QrError(errors.elementAt(1)));
              break;
            case 3:
              Get.off(() => QrError(errors.elementAt(2)));
              break;
            default:
              Get.back();
              break;
          }
        }, test: (e) => e is PlayException).catchError((e) {
          log('QrScanner: ${e.toString()}');
          Get.off(() => QrError(e.toString()));
        });
      }
      scanned = true;
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
