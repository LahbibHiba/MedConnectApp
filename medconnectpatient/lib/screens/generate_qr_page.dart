import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQrPage extends StatefulWidget {
  const GenerateQrPage({super.key});

  @override
  State<GenerateQrPage> createState() => _GenerateQrPageState();
}

String idPatient = "14785236";

class _GenerateQrPageState extends State<GenerateQrPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Center(
            child: Image.asset(
              "assets/appbar_image.png",
              height: 40,
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 15),
              Text(
                "My QR Code",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 30),
              idPatient != ""
                  ? Expanded(
                      child: QrImageView(
                        padding: const EdgeInsets.all(40),
                        data: idPatient,
                        version: QrVersions.auto,
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
