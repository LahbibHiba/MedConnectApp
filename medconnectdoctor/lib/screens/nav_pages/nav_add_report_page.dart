import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scanner_overlay/qr_scanner_overlay.dart';

import '../../models/patient_model.dart';
import '../view_reports_page.dart';

class NavAddReportPage extends StatefulWidget {
  const NavAddReportPage({super.key});

  @override
  State<NavAddReportPage> createState() => _NavAddReportPageState();
}

class _NavAddReportPageState extends State<NavAddReportPage> {
  List<Barcode> barcodes = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "QR scan of a new patient",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Stack(
                children: [
                  MobileScanner(
                    controller: MobileScannerController(
                      detectionSpeed: DetectionSpeed.noDuplicates,
                      returnImage: true,
                    ),
                    onDetect: (capture) async {
                      setState(() {
                        barcodes = capture.barcodes;
                      });
                      final Uint8List? image = capture.image;
                      for (final barcode in barcodes) {
                        print("Id Patient : ${barcode.rawValue}");
                      }
                      if (image != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViewReportsPage(
                              patientModel: listPatients[1],
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  QRScannerOverlay(
                    overlayColor: Colors.transparent,
                    scanAreaWidth: 300,
                    scanAreaHeight: 300,
                  )
                ],
              ),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
