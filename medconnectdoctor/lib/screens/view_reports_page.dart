import 'package:flutter/material.dart';

import '../models/patient_model.dart';
import '../models/report_model.dart';
import '../theme/constants.dart';
import 'add_new_patient_page.dart';
import 'components/report_component.dart';

class ViewReportsPage extends StatefulWidget {
  const ViewReportsPage({
    super.key,
    required this.patientModel,
  });
  final PatientModel patientModel;

  @override
  State<ViewReportsPage> createState() => _ViewReportsPageState();
}

class _ViewReportsPageState extends State<ViewReportsPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddNewPatientPage(),
              ),
            );
          },
          backgroundColor: kBlueColor,
          child: const Icon(
            Icons.add,
            color: kWhiteColor,
          ),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      const TextSpan(
                        text: "Your patient's reports \n",
                      ),
                      TextSpan(
                        text: "${widget.patientModel.fullName}",
                        style: const TextStyle(
                          color: kBlueColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: reportList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: screenWidth > 500 ? 4 : 2,
                  ),
                  itemBuilder: (context, index) {
                    return ReportComponent(
                      patientModel: widget.patientModel,
                      reportModel: reportList[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
