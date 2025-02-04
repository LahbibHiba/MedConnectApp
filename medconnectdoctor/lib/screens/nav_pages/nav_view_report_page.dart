import 'package:flutter/material.dart';

import '../../models/patient_model.dart';
import '../components/patient_component.dart';

class NavViewReportpage extends StatefulWidget {
  const NavViewReportpage({super.key});

  @override
  State<NavViewReportpage> createState() => _NavViewReportpageState();
}

class _NavViewReportpageState extends State<NavViewReportpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Your Patients' Files",
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                  itemCount: listPatients.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return PatientComponent(
                      patient: listPatients[index],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
