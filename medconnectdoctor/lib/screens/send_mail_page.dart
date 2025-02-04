import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medconnectdoctor/models/report_model.dart';

import '../controllers/report_controller.dart';
import '../models/patient_model.dart';
import '../theme/constants.dart';

class SendMailPage extends StatelessWidget {
  const SendMailPage({
    super.key,
    required this.reportModel,
    required this.patientModel,
  });
  final ReportModel reportModel;
  final PatientModel patientModel;

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController =  TextEditingController();
    final controller = Get.put(ReportController());

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
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                "Envoyer Dossier Par Email",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "Your email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                style: Theme.of(context).inputDecorationTheme.labelStyle,
              ),
              const SizedBox(height: 10),
              const Spacer(),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                    onPressed: () async {
                      await controller.sendmailController(reportModel,
                          patientModel, emailController.text.trim().toString());
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: kBlueColor,
                    ),
                    child: Text(
                      "Envoyer",
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                color: kWhiteColor,
                                fontWeight: FontWeight.bold,
                              ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
