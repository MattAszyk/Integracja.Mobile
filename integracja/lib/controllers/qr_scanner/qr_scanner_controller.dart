import 'dart:developer';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

enum QrStates { SCANNING, LOADING, ERROR, SUCCESS }

class QrScannerController extends GetxController {
  final _state = "ERROR";
  Barcode _result;

  @override
  void onInit() async {
    _scan();
    super.onInit();
  }

  Future _scan() async {}
}
