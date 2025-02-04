import 'package:flutter/material.dart';
import '../../models/patient_model.dart';
import '../../models/report_model.dart';
import '../components/report_component.dart';

class NavViewReportpage extends StatefulWidget {
  const NavViewReportpage({super.key});

  @override
  State<NavViewReportpage> createState() => _NavViewReportpageState();
}

class _NavViewReportpageState extends State<NavViewReportpage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Your Reports",
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                itemCount: reportList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: screenWidth > 500 ? 4 : 2,
                ),
                itemBuilder: (context, index) {
                  return ReportComponent(
                    patientModel: listPatients[index],
                    reportModel: reportList[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
