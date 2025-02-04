import 'package:flutter/material.dart';
import '../../models/patient_model.dart';
import '../../models/report_model.dart';
import '../../theme/constants.dart';
import '../patient_report_page.dart';

class ReportComponent extends StatelessWidget {
  const ReportComponent({
    super.key,
    required this.patientModel,
    required this.reportModel,
  });
  final ReportModel reportModel;
  final PatientModel patientModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PatientReportPage(
              patientModel: patientModel,
              reportModel: reportModel,
            ),
          ),
        );
      },
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(child: Image.asset("assets/doc_image.png")),
              const SizedBox(height: 10),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: Theme.of(context).textTheme.titleLarge!,
                  children: <TextSpan>[
                    const TextSpan(
                      text: "Doctor: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: kBlueColor,
                      ),
                    ),
                    TextSpan(
                      text: reportModel.doctorName,
                      style: const TextStyle(),
                    ),
                  ],
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: Theme.of(context).textTheme.titleLarge!,
                  children: <TextSpan>[
                    const TextSpan(
                      text: "Speciality: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: kBlueColor,
                      ),
                    ),
                    TextSpan(
                      text: reportModel.doctorSpecialty,
                      style: const TextStyle(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
