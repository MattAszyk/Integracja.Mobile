import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:integracja/pages/qr_scanner/qr_scanner.dart';
import 'package:integracja/utils/constrains.dart';

class QrError extends StatelessWidget {
  final String error;
  QrError(this.error);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              error,
              style: TextStyle(
                color: Colors.white,
                fontSize: textDefaultSize,
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => Get.off(() => QrScanner()),
              style: ElevatedButton.styleFrom(
                primary: primaryColor,
              ),
              child: Text(
                "PONÓW",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
