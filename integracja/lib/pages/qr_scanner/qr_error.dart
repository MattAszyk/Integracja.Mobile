import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:integracja/pages/qr_scanner/qr_scanner.dart';

class QrError extends StatelessWidget {
  final String error;
  QrError(this.error);

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
      body: Column(
        children: [
          Text(error),
          TextButton(
              onPressed: () => Get.to(() => QrScanner()), child: Text("PONÓW"))
        ],
      ),
    );
  }
}
