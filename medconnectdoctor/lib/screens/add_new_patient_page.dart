import 'package:flutter/material.dart';

import '../theme/constants.dart';

class AddNewPatientPage extends StatefulWidget {
  const AddNewPatientPage({super.key});

  @override
  State<AddNewPatientPage> createState() => _AddNewPatientPageState();
}

int currentStep = 0;

enum Gender { men, woman }

final TextEditingController _fullnameController = TextEditingController(),
    _ageController = TextEditingController(),
    _addressController = TextEditingController(),
    _phoneController = TextEditingController(),
    _socialCoverageController = TextEditingController(),
    _idController = TextEditingController(),
    _professionController = TextEditingController(),
    _familyHistoryController = TextEditingController(),
    _specifyPersonalHistoryController = TextEditingController(),
    _diabetesDurationController = TextEditingController(),
    _diabetesComplicationController = TextEditingController(),
    _hypertensionDurationController = TextEditingController(),
    _specifyAllergyController = TextEditingController(),
    _currentTreatmentController = TextEditingController(),
    _specifySurgeryController = TextEditingController(),
    _menarcheController = TextEditingController(),
    _firstIntercourseAgeController = TextEditingController(),
    _abortionsCountController = TextEditingController(),
    _breastfeedingController = TextEditingController(),
    _pregnanciesCountController = TextEditingController(),
    _parityCountController = TextEditingController(),
    _livingChildrenCountController = TextEditingController(),
    _miscarriagesCountController = TextEditingController(),
    _firstPregnancyTermController = TextEditingController(),
    _specifyPregnancyController = TextEditingController(),
    _contraceptionController = TextEditingController(),
    _hormonalController = TextEditingController(),
    _genitalActivityController = TextEditingController(),
    _packsPerYearController = TextEditingController(),
    _specifyDrugUseController = TextEditingController(),
    _otherHabitsController = TextEditingController(),
    _historyController = TextEditingController(),
    _diagnosisController = TextEditingController(),
    _summaryController = TextEditingController();

bool noFamilyHistory = false;
bool personalCancerHistory = false;
bool noMedicalHistory = false;
bool diabetes = false;
bool hypertension = false;
bool coronaryArteryDisease = false;
bool cardiacInsufficiency = false;
bool renalInsufficiency = false;
bool hepaticInsufficiency = false;
bool chronicRespiratoryInsufficiency = false;
bool allergy = false;
bool noSurgicalHistory = false;
bool operated = false;
bool noGynecologicalHistory = false;
bool pregnant = false;
bool noHabits = false;
bool alcoholUse = false;
bool tobaccoUse = false;
bool hookahUse = false;
bool drugUse = false;

class _AddNewPatientPageState extends State<AddNewPatientPage> {
  Gender? _selectedGender;
  String sexe = "";
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
                    "Introduction ",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.w900, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  TextFormField(
                    controller: _fullnameController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Full Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _ageController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Age",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: kLightBlueColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio(
                          value: Gender.men,
                          groupValue: _selectedGender,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value as Gender;
                              sexe = "men";
                            });
                          },
                        ),
                        const Text('Men'),
                        const SizedBox(
                            width: 20), // Espacement entre les boutons radio
                        Radio(
                          value: Gender.woman,
                          groupValue: _selectedGender,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value as Gender;
                              sexe = "woman";
                            });
                          },
                        ),
                        const Text('woman'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _addressController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Adress",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _phoneController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Phone",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _addressController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Address",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _socialCoverageController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Social security cover",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _idController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Id card",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _professionController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Profession",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
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
                    "Family history",
                    style: Theme.of(context).textTheme.displaySmall!,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CheckboxListTile(
                            title: Expanded(
                              child: Text("No family history",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith()),
                            ),
                            value: noFamilyHistory,
                            onChanged: (value) {
                              setState(() {
                                noFamilyHistory = value!;
                              });
                            }),
                        TextFormField(
                          controller: _familyHistoryController,
                          maxLines: 1,
                          decoration: InputDecoration(
                            hintText: "Family history (0, 1, 2, 3)",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          style:
                              Theme.of(context).inputDecorationTheme.labelStyle,
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _specifyPersonalHistoryController,
                          maxLines: 2,
                          decoration: InputDecoration(
                            hintText: "If yes, please specify :",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          style:
                              Theme.of(context).inputDecorationTheme.labelStyle,
                        ),
                        const SizedBox(height: 10),
                        CheckboxListTile(
                            title: Expanded(
                              child: Text("Personal history of cancer",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith()),
                            ),
                            value: personalCancerHistory,
                            onChanged: (value) {
                              setState(() {
                                personalCancerHistory = value!;
                              });
                            }),
                        TextFormField(
                          controller: _specifyPersonalHistoryController,
                          maxLines: 2,
                          decoration: InputDecoration(
                            hintText: "If yes, please specify :",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          style:
                              Theme.of(context).inputDecorationTheme.labelStyle,
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
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
                  CheckboxListTile(
                      title: Expanded(
                        child: Text("No medical history",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith()),
                      ),
                      value: noMedicalHistory,
                      onChanged: (value) {
                        setState(() {
                          noMedicalHistory = value!;
                        });
                      }),
                  CheckboxListTile(
                      title: Expanded(
                        child: Text("Diabetes",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith()),
                      ),
                      value: diabetes,
                      onChanged: (value) {
                        setState(() {
                          diabetes = value!;
                        });
                      }),
                  TextFormField(
                    controller: _diabetesDurationController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Seniority (years)",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _diabetesComplicationController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Complications",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  CheckboxListTile(
                      title: Expanded(
                        child: Text("HTA",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith()),
                      ),
                      value: hypertension,
                      onChanged: (value) {
                        setState(() {
                          hypertension = value!;
                        });
                      }),
                  TextFormField(
                    controller: _hypertensionDurationController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Seniority (years)",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  CheckboxListTile(
                      title: Expanded(
                        child: Text("Coronaropathie",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith()),
                      ),
                      value: coronaryArteryDisease,
                      onChanged: (value) {
                        setState(() {
                          coronaryArteryDisease = value!;
                        });
                      }),
                  const Divider(),
                  const SizedBox(height: 10),
                  Text(
                    "Insufficiencies :",
                    style:
                        Theme.of(context).textTheme.headlineSmall!.copyWith(),
                    textAlign: TextAlign.start,
                  ),
                  CheckboxListTile(
                      title: Expanded(
                        child: Text("Cardiac",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith()),
                      ),
                      value: cardiacInsufficiency,
                      onChanged: (value) {
                        setState(() {
                          cardiacInsufficiency = value!;
                        });
                      }),
                  CheckboxListTile(
                      title: Expanded(
                        child: Text("Renal",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith()),
                      ),
                      value: renalInsufficiency,
                      onChanged: (value) {
                        setState(() {
                          renalInsufficiency = value!;
                        });
                      }),
                  CheckboxListTile(
                      title: Expanded(
                        child: Text("Hepatic",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith()),
                      ),
                      value: hepaticInsufficiency,
                      onChanged: (value) {
                        setState(() {
                          hepaticInsufficiency = value!;
                        });
                      }),
                  CheckboxListTile(
                      title: Expanded(
                        child: Text("Resp.Chr",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith()),
                      ),
                      value: chronicRespiratoryInsufficiency,
                      onChanged: (value) {
                        setState(() {
                          chronicRespiratoryInsufficiency = value!;
                        });
                      }),
                  const Divider(),
                  CheckboxListTile(
                      title: Expanded(
                        child: Text("Allergy",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith()),
                      ),
                      value: allergy,
                      onChanged: (value) {
                        setState(() {
                          allergy = value!;
                        });
                      }),
                  TextFormField(
                    controller: _specifyAllergyController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "If yes, please specify :",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _currentTreatmentController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Usual treatment",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  const SizedBox(height: 10),
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
                  CheckboxListTile(
                      title: Expanded(
                        child: Text("No previous surgical history",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith()),
                      ),
                      value: noSurgicalHistory,
                      onChanged: (value) {
                        setState(() {
                          noSurgicalHistory = value!;
                        });
                      }),
                  CheckboxListTile(
                      title: Expanded(
                        child: Text("Operated",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith()),
                      ),
                      value: operated,
                      onChanged: (value) {
                        setState(() {
                          operated = value!;
                        });
                      }),
                  TextFormField(
                    controller: _specifySurgeryController,
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: "If yes, please specify :",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  const SizedBox(height: 10),
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
                    "Gynaeco-obstetrical history",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.w900, fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                  CheckboxListTile(
                      title: Expanded(
                        child: Text("No previous gynaeco-obstetric history",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith()),
                      ),
                      value: noGynecologicalHistory,
                      onChanged: (value) {
                        setState(() {
                          noGynecologicalHistory = value!;
                        });
                      }),
                  TextFormField(
                    controller: _menarcheController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Menarche",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _firstIntercourseAgeController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Age 1st report",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _abortionsCountController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Nb IVG",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _breastfeedingController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Breastfeeding(nb/M)",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _pregnanciesCountController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Nb of pregnancies",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _parityCountController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Nb of Parity",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _livingChildrenCountController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Nb of living children",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _miscarriagesCountController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Nb of miscarriages",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _firstPregnancyTermController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Nb 1st full-term pregnancy",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  CheckboxListTile(
                      title: Expanded(
                        child: Text("Enclosure",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith()),
                      ),
                      value: pregnant,
                      onChanged: (value) {
                        setState(() {
                          pregnant = value!;
                        });
                      }),
                  TextFormField(
                    controller: _specifyPregnancyController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "If yes, specify the term :",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _contraceptionController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Contraception",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _hormonalController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "If hormonal, please specify (Nb M)",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _genitalActivityController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Ginetal activities",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _menarcheController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Menopause since(Age)",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  const SizedBox(height: 10),
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
                  CheckboxListTile(
                      title: Expanded(
                        child: Text("No habits",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith()),
                      ),
                      value: noHabits,
                      onChanged: (value) {
                        setState(() {
                          noHabits = value!;
                        });
                      }),
                  const Divider(),
                  CheckboxListTile(
                      title: Expanded(
                        child: Text("Alcohol",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith()),
                      ),
                      value: alcoholUse,
                      onChanged: (value) {
                        setState(() {
                          alcoholUse = value!;
                        });
                      }),
                  const Divider(),
                  CheckboxListTile(
                      title: Expanded(
                        child: Text("Tobacco",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith()),
                      ),
                      value: tobaccoUse,
                      onChanged: (value) {
                        setState(() {
                          tobaccoUse = value!;
                        });
                      }),
                  TextFormField(
                    controller: _packsPerYearController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "packs/year",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  CheckboxListTile(
                      title: Expanded(
                        child: Text("Drugs",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith()),
                      ),
                      value: drugUse,
                      onChanged: (value) {
                        setState(() {
                          drugUse = value!;
                        });
                      }),
                  TextFormField(
                    controller: _specifyDrugUseController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Specify",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _otherHabitsController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: "Other habits :",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  const SizedBox(height: 10),
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
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _historyController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: "History",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _diagnosisController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: "Diagnostic initial",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  const SizedBox(height: 10),
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
                    "Summary",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.w900, fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _summaryController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: "Summary",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  const SizedBox(height: 10),
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
                Navigator.pop(context);
              } else {
                setState(() => currentStep += 1);
              }
            },
            onStepCancel: () =>
                currentStep == 0 ? null : setState(() => currentStep -= 1),
            onStepTapped: (step) => setState(() => currentStep = step),
            controlsBuilder: (context, detail) {
              return SizedBox(
                //margin: EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    if (currentStep != 0)
                      Expanded(
                          child: ElevatedButton(
                              onPressed: detail.onStepCancel,
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(double.infinity, 50),
                                backgroundColor: kBlueColor,
                              ),
                              child: Text(
                                "Back",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                      color: kWhiteColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ))),
                    currentStep != 0
                        ? const SizedBox(width: 10)
                        : const SizedBox(width: 0),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          backgroundColor: kBlueColor,
                        ),
                        onPressed: detail.onStepContinue,
                        child: Text(
                          isLastStep ? "Confirmed" : "Next",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                color: kWhiteColor,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
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
