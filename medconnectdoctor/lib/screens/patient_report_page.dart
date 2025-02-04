import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medconnectdoctor/controllers/report_controller.dart';
import 'package:medconnectdoctor/screens/components/text_long_resume_component.dart';
import 'package:medconnectdoctor/screens/components/text_resume_component.dart';

import '../models/patient_model.dart';
import '../models/report_model.dart';
import '../theme/constants.dart';
import 'send_mail_page.dart';

class PatientReportPage extends StatefulWidget {
  const PatientReportPage({
    super.key,
    required this.patientModel,
    required this.reportModel,
  });
  final ReportModel reportModel;
  final PatientModel patientModel;

  @override
  State<PatientReportPage> createState() => _PatientReportPageState();
}

int currentStep = 0;

class _PatientReportPageState extends State<PatientReportPage> {
  final controller = Get.put(ReportController());

  @override
  Widget build(BuildContext context) {
    List<Step> getSteps() => [
          Step(
            title: const Text(""),
            state: currentStep > 0 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 0,
            content: SizedBox(
              child: Column(
                children: [
                  Text(
                    "Introduction",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.w900, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  TextResumeComponent(
                      title: "Full Name :",
                      subtitle: widget.patientModel.fullName),
                  const Divider(),
                  TextResumeComponent(
                      title: "Gender", subtitle: widget.patientModel.gender),
                  const Divider(),
                  TextResumeComponent(
                      title: "Adress", subtitle: widget.patientModel.address),
                  const Divider(),
                  TextResumeComponent(
                      title: "Phone",
                      subtitle: widget.patientModel.phoneNumber),
                  const Divider(),
                  TextResumeComponent(
                      title: "social Coverage",
                      subtitle: widget.patientModel.socialCoverage),
                  const Divider(),
                  TextResumeComponent(
                      title: "Id Card", subtitle: widget.patientModel.idCard),
                  const Divider(),
                  TextResumeComponent(
                      title: "Profession",
                      subtitle: widget.patientModel.profession),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          Step(
            title: const Text(""),
            state: currentStep > 1 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 1,
            content: SizedBox(
              child: Column(
                children: [
                  Text(
                    "Family antecedents",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.w900, fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                  if (widget.reportModel.noFamilyHistory == true)
                    const TextResumeComponent(
                        title: "No family history", subtitle: ""),
                  if (widget.reportModel.noFamilyHistory == false)
                    TextResumeComponent(
                        title: "Nb of family antecedents :",
                        subtitle: widget.reportModel.familyHistory),
                  if (widget.reportModel.noFamilyHistory == false)
                    TextLongResumeComponent(
                        title: "Family history :",
                        subtitle: widget.reportModel.specifyFamilyHistory),
                  const Divider(),
                  if (widget.reportModel.personalCancerHistory == true)
                    TextResumeComponent(
                        title: "Personal history of cancer :",
                        subtitle: widget.reportModel.personalCancerHistory!
                            ? "Yes"
                            : "No"),
                  if (widget.reportModel.personalCancerHistory == true)
                    TextLongResumeComponent(
                        title: "Personal history of cancer :",
                        subtitle: widget.reportModel.specifyPersonalHistory),
                ],
              ),
            ),
          ),
          Step(
            title: const Text(""),
            state: currentStep > 2 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 2,
            content: SizedBox(
              child: Column(
                children: [
                  Text(
                    "Medical history",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.w900, fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                  if (widget.reportModel.noMedicalHistory == true)
                    const TextResumeComponent(
                        title: "No medical history ", subtitle: ""),
                  TextResumeComponent(
                      title: "Diabéte :",
                      subtitle: widget.reportModel.hasDiabetes! ? "Yes" : "No"),
                  if (widget.reportModel.hasDiabetes == true)
                    TextResumeComponent(
                        title: "Years of diabetes (Years) :",
                        subtitle: widget.reportModel.previousDiabetes),
                  if (widget.reportModel.hasDiabetes == true)
                    TextResumeComponent(
                        title: "Diabetes complications :",
                        subtitle: widget.reportModel.diabetesComplications),
                  const Divider(),
                  TextResumeComponent(
                      title: "HTA :",
                      subtitle: widget.reportModel.hasHTN! ? "Yes" : "No"),
                  if (widget.reportModel.hasHTN == true)
                    TextResumeComponent(
                        title: "HTA seniority :",
                        subtitle: widget.reportModel.previousHTN),
                  const Divider(),
                  TextResumeComponent(
                      title: "Coronaropathie :",
                      subtitle: widget.reportModel.hasCoronaryDisease!
                          ? "Yes"
                          : "No"),
                  const Divider(),
                  Text(
                    "Deficiencies",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontWeight: FontWeight.w800, fontSize: 16),
                    textAlign: TextAlign.start,
                  ),
                  TextResumeComponent(
                      title: "Cardiac :",
                      subtitle:
                          widget.reportModel.hasCardiacDisease! ? "Yes" : "No"),
                  TextResumeComponent(
                      title: "Renal :",
                      subtitle:
                          widget.reportModel.hasRenalDisease! ? "Yes" : "No"),
                  TextResumeComponent(
                      title: "Hepatic :",
                      subtitle:
                          widget.reportModel.hasLiverDisease! ? "Yes" : "No"),
                  TextResumeComponent(
                      title: "Resp.Chr :",
                      subtitle: widget.reportModel.hasChronicRespiratoryDisease!
                          ? "Yes"
                          : "No"),
                  const Divider(),
                  TextResumeComponent(
                      title: "Allergy :",
                      subtitle: widget.reportModel.hasAllergy! ? "Yes" : "No"),
                  if (widget.reportModel.hasAllergy == true)
                    TextResumeComponent(
                        title: "Allergies :",
                        subtitle: widget.reportModel.specifyAllergy),
                  if (widget.reportModel.hasAllergy == true)
                    TextResumeComponent(
                        title: "Usual treatment :",
                        subtitle: widget.reportModel.allergyTreatment),
                ],
              ),
            ),
          ),
          Step(
            title: const Text(""),
            state: currentStep > 3 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 3,
            content: SizedBox(
              child: Column(
                children: [
                  Text(
                    "Surgical history",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.w900, fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                  if (widget.reportModel.noSurgicalHistory == true)
                    const TextResumeComponent(
                        title: "No surgical history ", subtitle: ""),
                  TextResumeComponent(
                      title: "Operated :",
                      subtitle: widget.reportModel.hasSurgery! ? "Yes" : "No"),
                  TextLongResumeComponent(
                      title: "Operations :",
                      subtitle: widget.reportModel.specifySurgery)
                ],
              ),
            ),
          ),
          Step(
            title: const Text(""),
            state: currentStep > 4 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 4,
            content: SizedBox(
              child: Column(
                children: [
                  Text(
                    "Gyneco-obstetrical antecedents",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.w900, fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                  if (widget.reportModel.noObstetricGynecHistory == true)
                    const TextResumeComponent(
                        title: "No ob-gyn history", subtitle: ""),
                  TextResumeComponent(
                      title: "Menarche :",
                      subtitle: widget.reportModel.menarche),
                  TextResumeComponent(
                      title: "Age 1st report :",
                      subtitle: widget.reportModel.ageFirstIntercourse),
                  TextResumeComponent(
                      title: "Nb IVG :",
                      subtitle: widget.reportModel.numberOfIVGs),
                  TextResumeComponent(
                      title: "Breastfeeding(nb/M) :",
                      subtitle: widget.reportModel.breastfeeding),
                  TextResumeComponent(
                      title: "Nb of pregnancies :",
                      subtitle: widget.reportModel.numberOfPregnancies),
                  TextResumeComponent(
                      title: "Nb Parity :",
                      subtitle: widget.reportModel.numberOfParity),
                  TextResumeComponent(
                      title: "Nb Living Children :",
                      subtitle: widget.reportModel.numberOfChildren),
                  TextResumeComponent(
                      title: "Nb Miscarriages :",
                      subtitle: widget.reportModel.numberOfMiscarriages),
                  const Divider(),
                  TextResumeComponent(
                      title: "Enclosure :",
                      subtitle: widget.reportModel.isPregnant! ? "Yes" : "No"),
                  TextResumeComponent(
                      title: "The term :",
                      subtitle: widget.reportModel.specifyPregnancy),
                  TextResumeComponent(
                      title: "Contraception :",
                      subtitle: widget.reportModel.contraception),
                  TextResumeComponent(
                      title: "Hormonal(Nb/M) :",
                      subtitle: widget.reportModel.hormonalContraception),
                  TextResumeComponent(
                      title: "Ginétales activities :",
                      subtitle: widget.reportModel.gynecologicalActivity),
                  TextResumeComponent(
                      title: "Menopause since (Age) :",
                      subtitle: widget.reportModel.menopause),
                ],
              ),
            ),
          ),
          Step(
            title: const Text(""),
            state: currentStep > 5 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 5,
            content: SizedBox(
              child: Column(
                children: [
                  Text(
                    "Habits",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.w900, fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                  if (widget.reportModel.noHabits == true)
                    const TextResumeComponent(title: "No habits", subtitle: ""),
                  TextResumeComponent(
                      title: "Alcohol :",
                      subtitle: widget.reportModel.usesAlcohol! ? "Yes" : "No"),
                  const Divider(),
                  TextResumeComponent(
                      title: "Tobacco :",
                      subtitle: widget.reportModel.usesTobacco! ? "Yes" : "No"),
                  TextResumeComponent(
                      title: "Packet/year :",
                      subtitle: widget.reportModel.packYear),
                  const Divider(),
                  TextResumeComponent(
                      title: "Drugs :",
                      subtitle: widget.reportModel.usesDrugs! ? "Yes" : "No"),
                  TextResumeComponent(
                      title: "Drug name :",
                      subtitle: widget.reportModel.specifyDrugUse),
                  const Divider(),
                  TextResumeComponent(
                      title: "Other habits :",
                      subtitle: widget.reportModel.otherHabits),
                ],
              ),
            ),
          ),
          Step(
            title: const Text(""),
            state: currentStep > 6 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 6,
            content: SizedBox(
              child: Column(
                children: [
                  Text(
                    "History of the disease",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.w900, fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                  TextLongResumeComponent(
                      title: "History :", subtitle: widget.reportModel.history),
                  const Divider(),
                  TextLongResumeComponent(
                      title: "Initial diagnosis :",
                      subtitle: widget.reportModel.initialDiagnosis),
                ],
              ),
            ),
          ),
          Step(
            title: const Text(""),
            state: currentStep > 7 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 7,
            content: SizedBox(
              child: Column(
                children: [
                  Text(
                    "Total",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.w900, fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                  TextLongResumeComponent(
                      title: "Total :", subtitle: widget.reportModel.total),
                ],
              ),
            ),
          ),
        ];
    final isLastStep = currentStep == getSteps().length - 1;
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
        body: Theme(
          data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(primary: kBlueColor)),
          child: Stepper(
            type: StepperType.horizontal,
            steps: getSteps(),
            currentStep: currentStep,
            onStepContinue: () async {
              if (isLastStep) {
              } else {
                setState(() => currentStep += 1);
              }
            },
            onStepCancel: () =>
                currentStep == 0 ? null : setState(() => currentStep -= 1),
            onStepTapped: (step) => setState(() => currentStep = step),
            controlsBuilder: (context, detail) {
              return Container(
                margin: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SendMailPage(
                                        reportModel: widget.reportModel,
                                        patientModel: widget.patientModel,
                                      ),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(double.infinity, 50),
                                  backgroundColor: kBlueColor,
                                ),
                                child: Text(
                                  "Send report by Email",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                        color: kWhiteColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ))),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () async {
                                  await controller.generateReportPDFController(
                                      widget.reportModel, widget.patientModel);
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(double.infinity, 50),
                                  backgroundColor: kBlueColor,
                                ),
                                child: Text(
                                  "Gener report to PDF format",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                        color: kWhiteColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ))),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
