import 'dart:io';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:printing/printing.dart';
import 'package:get/get.dart';
import 'package:medconnectdoctor/models/patient_model.dart';
import 'package:medconnectdoctor/models/report_model.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class ReportRepository extends GetxController {
  static ReportRepository get instance => Get.find();
//gener PDF dossier
  generateReportPDF(ReportModel report, PatientModel patient) async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
          pageFormat: pw.PdfPageFormat.a4,
          build: (pw.Context context) {
            return pw.FullPage(
              ignoreMargins: true,
              child: pw.Container(
                padding: const pw.EdgeInsets.all(30),
                child: pw.Column(
                  children: [
                    pw.Text(
                      "Medical Report",
                      style: pw.TextStyle(
                        fontSize: 30,
                        color: const pw.PdfColor.fromInt(0xFF3DA9FC),
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.Text(
                      "${patient.fullName} ",
                      style: pw.TextStyle(
                        color: const pw.PdfColor.fromInt(0xFF094067),
                        fontSize: 20,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.SizedBox(height: 20),
                    pw.Row(
                      children: [
                        pw.Text(
                          "Doctor : ",
                          style: pw.TextStyle(
                            color: const pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.Text(
                          "${report.doctorName} ",
                          style: pw.TextStyle(
                            color: const pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                        pw.Spacer(),
                        pw.Text(
                          "Speciality : ",
                          style: pw.TextStyle(
                            color: const pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.Text(
                          "${report.doctorSpecialty} ",
                          style: pw.TextStyle(
                            color: const pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    pw.SizedBox(height: 20),
                    pw.Container(
                      alignment: pw.Alignment.topLeft,
                      child: pw.Text(
                        "Introduction",
                        textAlign: pw.TextAlign.start,
                        style: pw.TextStyle(
                          fontSize: 18,
                          color: const pw.PdfColor.fromInt(0xFF3DA9FC),
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ),

                    pw.Row(
                      children: [
                        pw.Text(
                          "Full name : ",
                          style: pw.TextStyle(
                            color: const pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        //pw.Spacer(),
                        pw.Text(
                          "${patient.fullName} ",
                          style: pw.TextStyle(
                            color: const pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                        pw.SizedBox(width: 10),

                        pw.Text(
                          "Age : ",
                          style: pw.TextStyle(
                            color: const pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),

                        pw.Text(
                          "${patient.age} ",
                          style: pw.TextStyle(
                            color: const pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                        pw.SizedBox(width: 10),
                        pw.Text(
                          "Gender : ",
                          style: pw.TextStyle(
                            color: const pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),

                        pw.Text(
                          "${patient.gender} ",
                          style: pw.TextStyle(
                            color: const pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    // pw.SizedBox(height: 10),
                    pw.Divider(),
                    pw.Row(
                      children: [
                        pw.Text(
                          "Adress : ",
                          style: pw.TextStyle(
                            color: const pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.Text(
                          "${patient.address} ",
                          style: pw.TextStyle(
                            color: const pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                        pw.SizedBox(width: 10),
                        pw.Text(
                          "Phone : ",
                          style: pw.TextStyle(
                            color: const pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.Text(
                          "${patient.phoneNumber} ",
                          style: pw.TextStyle(
                            color: const pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    pw.Divider(),
                    //pw.SizedBox(height: 10),
                    pw.Row(
                      children: [
                        pw.Text(
                          "Social cover : ",
                          style: pw.TextStyle(
                            color: const pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.Text(
                          "${patient.socialCoverage} ",
                          style: pw.TextStyle(
                            color: const pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                        pw.SizedBox(width: 10),
                        pw.Text(
                          "Id card : ",
                          style: pw.TextStyle(
                            color: const pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        //pw.Spacer(),
                        pw.Text(
                          "${patient.idCard} ",
                          style: pw.TextStyle(
                            color: const pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                        pw.SizedBox(width: 10),
                        pw.Text(
                          "Profession : ",
                          style: pw.TextStyle(
                            color: const pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),

                        pw.Text(
                          "${patient.profession} ",
                          style: pw.TextStyle(
                            color: const pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                      ],
                    ),

                    pw.SizedBox(height: 20),
                    pw.Container(
                      alignment: pw.Alignment.topLeft,
                      child: pw.Text(
                        "Family history",
                        textAlign: pw.TextAlign.start,
                        style: pw.TextStyle(
                          fontSize: 18,
                          color: const pw.PdfColor.fromInt(0xFF3DA9FC),
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ),

                    if (report.noFamilyHistory == true)
                      pw.Text(
                        "No family history",
                        style: pw.TextStyle(
                          color: const pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    if (report.noFamilyHistory == false)
                      pw.Row(
                        children: [
                          pw.Text(
                            "Nb of family antecedents : ",
                            style: pw.TextStyle(
                              color: const pw.PdfColor.fromInt(0xFF094067),
                              fontSize: 15,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.Text(
                            "${report.familyHistory} ",
                            style: pw.TextStyle(
                              color: const pw.PdfColor.fromInt(0xFF094067),
                              fontSize: 15,
                              fontWeight: pw.FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    if (report.noFamilyHistory == false)
                      pw.Row(
                        children: [
                          pw.Text(
                            "Family history : ",
                            style: pw.TextStyle(
                              color: const pw.PdfColor.fromInt(0xFF094067),
                              fontSize: 15,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.Text(
                            "${report.specifyFamilyHistory} ",
                            style: pw.TextStyle(
                              color: const pw.PdfColor.fromInt(0xFF094067),
                              fontSize: 15,
                              fontWeight: pw.FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    if (report.personalCancerHistory == true)
                      pw.Row(
                        children: [
                          pw.Text(
                            "Personal history of cancer : ",
                            style: pw.TextStyle(
                              color: const pw.PdfColor.fromInt(0xFF094067),
                              fontSize: 15,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.Text(
                            "${report.personalCancerHistory! ? "Yes" : "No"} ",
                            style: pw.TextStyle(
                              color: const pw.PdfColor.fromInt(0xFF094067),
                              fontSize: 15,
                              fontWeight: pw.FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    if (report.personalCancerHistory == true)
                      pw.Row(
                        children: [
                          pw.Text(
                            "Personal history of cancer : ",
                            style: pw.TextStyle(
                              color: const pw.PdfColor.fromInt(0xFF094067),
                              fontSize: 15,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.Text(
                            "${report.specifyPersonalHistory} ",
                            style: pw.TextStyle(
                              color: const pw.PdfColor.fromInt(0xFF094067),
                              fontSize: 15,
                              fontWeight: pw.FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    pw.SizedBox(height: 20),
                    pw.Container(
                      alignment: pw.Alignment.topLeft,
                      child: pw.Text(
                        "Medical history",
                        textAlign: pw.TextAlign.start,
                        style: pw.TextStyle(
                          fontSize: 18,
                          color: const pw.PdfColor.fromInt(0xFF3DA9FC),
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ),
                    if (report.noMedicalHistory == true)
                      pw.Text(
                        "No medical history",
                        style: pw.TextStyle(
                          color: const pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    pw.Row(
                      children: [
                        pw.Text(
                          "Diabetes : ",
                          style: pw.TextStyle(
                            color: const pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.Text(
                          "${report.hasDiabetes! ? "Yes" : "No"} ",
                          style: pw.TextStyle(
                            color: const pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    if (report.hasDiabetes == true)
                      pw.Row(
                        children: [
                          pw.Text(
                            "Years of diabetes (Years) : ",
                            style: pw.TextStyle(
                              color: const pw.PdfColor.fromInt(0xFF094067),
                              fontSize: 15,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.Text(
                            "${report.previousDiabetes} ",
                            style: pw.TextStyle(
                              color: const pw.PdfColor.fromInt(0xFF094067),
                              fontSize: 15,
                              fontWeight: pw.FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    if (report.hasDiabetes == true)
                      pw.Row(
                        children: [
                          pw.Text(
                            "Diabetes complications : ",
                            style: pw.TextStyle(
                              color: const pw.PdfColor.fromInt(0xFF094067),
                              fontSize: 15,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.Text(
                            "${report.diabetesComplications} ",
                            style: pw.TextStyle(
                              color: const pw.PdfColor.fromInt(0xFF094067),
                              fontSize: 15,
                              fontWeight: pw.FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    pw.Divider(),

                    pw.Row(
                      children: [
                        pw.Text(
                          "HTA : ",
                          style: pw.TextStyle(
                            color: const pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.Text(
                          "${report.hasHTN! ? "Yes" : "No"} ",
                          style: pw.TextStyle(
                            color: const pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    if (report.hasHTN == true)
                      pw.Row(
                        children: [
                          pw.Text(
                            "Seniority of HTA : ",
                            style: pw.TextStyle(
                              color: const pw.PdfColor.fromInt(0xFF094067),
                              fontSize: 15,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.Text(
                            "${report.previousHTN} ",
                            style: pw.TextStyle(
                              color: const pw.PdfColor.fromInt(0xFF094067),
                              fontSize: 15,
                              fontWeight: pw.FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    pw.Divider(),
                    pw.Row(
                      children: [
                        pw.Text(
                          "Coronaropathie : ",
                          style: pw.TextStyle(
                            color: const pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.Text(
                          "${report.hasCoronaryDisease! ? "Yes" : "No"} ",
                          style: pw.TextStyle(
                            color: const pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    pw.Divider(),
                    pw.Text(
                      "Deficiencies",
                      style: pw.TextStyle(
                        color: const pw.PdfColor.fromInt(0xFF094067),
                        fontSize: 16,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.Row(
                      children: [
                        pw.Text(
                          "Cardiac : ",
                          style: pw.TextStyle(
                            color: const pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.Text(
                          "${report.hasCardiacDisease! ? "Yes" : "No"} ",
                          style: pw.TextStyle(
                            color: const pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    pw.Row(
                      children: [
                        pw.Text(
                          "Renal : ",
                          style: pw.TextStyle(
                            color: const pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.Text(
                          "${report.hasRenalDisease! ? "Yes" : "No"} ",
                          style: pw.TextStyle(
                            color: const pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    pw.Row(
                      children: [
                        pw.Text(
                          "Hepatic : ",
                          style: pw.TextStyle(
                            color: const pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.Text(
                          "${report.hasLiverDisease! ? "Yes" : "No"} ",
                          style: pw.TextStyle(
                            color: const pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    pw.Row(
                      children: [
                        pw.Text(
                          "Resp.Chr : ",
                          style: pw.TextStyle(
                            color: const pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.Text(
                          "${report.hasChronicRespiratoryDisease! ? "Yes" : "No"} ",
                          style: pw.TextStyle(
                            color: const pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    pw.Divider(),

                    pw.Row(
                      children: [
                        pw.Text(
                          "Allergy : ",
                          style: pw.TextStyle(
                            color: const pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.Text(
                          "${report.hasAllergy! ? "Yes" : "No"} ",
                          style: pw.TextStyle(
                            color: const pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    if (report.hasAllergy == true)
                      pw.Row(
                        children: [
                          pw.Text(
                            "Allergies : ",
                            style: pw.TextStyle(
                              color: const pw.PdfColor.fromInt(0xFF094067),
                              fontSize: 15,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.Text(
                            "${report.allergyTreatment} ",
                            style: pw.TextStyle(
                              color: const pw.PdfColor.fromInt(0xFF094067),
                              fontSize: 15,
                              fontWeight: pw.FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    if (report.hasAllergy == true)
                      pw.Row(
                        children: [
                          pw.Text(
                            "Usual treatment : ",
                            style: pw.TextStyle(
                              color: const pw.PdfColor.fromInt(0xFF094067),
                              fontSize: 15,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.Text(
                            "${report.allergyTreatment} ",
                            style: pw.TextStyle(
                              color: const pw.PdfColor.fromInt(0xFF094067),
                              fontSize: 15,
                              fontWeight: pw.FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    pw.SizedBox(height: 20),
                    pw.Container(
                      alignment: pw.Alignment.topLeft,
                      child: pw.Text(
                        "Surgical history",
                        textAlign: pw.TextAlign.start,
                        style: pw.TextStyle(
                          fontSize: 18,
                          color: const pw.PdfColor.fromInt(0xFF3DA9FC),
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ),
                    if (report.hasSurgery == true)
                      pw.Text(
                        "No surgical history ",
                        style: pw.TextStyle(
                          color: const pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    pw.Row(
                      children: [
                        pw.Text(
                          "Operated : ",
                          style: pw.TextStyle(
                            color: const pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.Text(
                          "${report.hasSurgery! ? "Yes" : "No"} ",
                          style: pw.TextStyle(
                            color: const pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    pw.Row(
                      children: [
                        pw.Text(
                          "Operations : ",
                          style: pw.TextStyle(
                            color: const pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.Text(
                          "${report.specifySurgery} ",
                          style: pw.TextStyle(
                            color: const pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.FullPage(
            ignoreMargins: true,
            child: pw.Container(
              padding: const pw.EdgeInsets.all(30),
              child: pw.Column(
                children: [
                  pw.Container(
                    alignment: pw.Alignment.topLeft,
                    child: pw.Text(
                      "Gyneco-obstetrical antecedents",
                      textAlign: pw.TextAlign.start,
                      style: pw.TextStyle(
                        fontSize: 18,
                        color: const pw.PdfColor.fromInt(0xFF3DA9FC),
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ),
                  if (report.hasChronicRespiratoryDisease == true)
                    pw.Text(
                      "No ob-gyn history",
                      style: pw.TextStyle(
                        color: const pw.PdfColor.fromInt(0xFF094067),
                        fontSize: 15,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Menarche : ",
                        style: pw.TextStyle(
                          color: const pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        "${report.menarche} ",
                        style: pw.TextStyle(
                          color: const pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Age 1st report : ",
                        style: pw.TextStyle(
                          color: const pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        "${report.ageFirstIntercourse} ",
                        style: pw.TextStyle(
                          color: const pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Breastfeeding(nb/M) : ",
                        style: pw.TextStyle(
                          color: const pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        "${report.breastfeeding} ",
                        style: pw.TextStyle(
                          color: const pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Text(
                        "No. of pregnancies : ",
                        style: pw.TextStyle(
                          color: const pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        "${report.numberOfPregnancies} ",
                        style: pw.TextStyle(
                          color: const pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Nb Parity : ",
                        style: pw.TextStyle(
                          color: const pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        "${report.numberOfParity} ",
                        style: pw.TextStyle(
                          color: const pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Text(
                        "No. of living children : ",
                        style: pw.TextStyle(
                          color: const pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        "${report.numberOfChildren} ",
                        style: pw.TextStyle(
                          color: const pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Nb Miscarriages : ",
                        style: pw.TextStyle(
                          color: const pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        "${report.numberOfMiscarriages} ",
                        style: pw.TextStyle(
                          color: const pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  pw.Divider(),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Enclosure : ",
                        style: pw.TextStyle(
                          color: const pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        "${report.isPregnant! ? "Yes" : "No"} ",
                        style: pw.TextStyle(
                          color: const pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Text(
                        "The term : ",
                        style: pw.TextStyle(
                          color: const pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        "${report.specifyPregnancy} ",
                        style: pw.TextStyle(
                          color: const pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Contraception : ",
                        style: pw.TextStyle(
                          color: const pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        "${report.contraception} ",
                        style: pw.TextStyle(
                          color: const pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Hormonal(Nb/M) : ",
                        style: pw.TextStyle(
                          color: const pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        "${report.hormonalContraception} ",
                        style: pw.TextStyle(
                          color: const pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Ginétales activities : ",
                        style: pw.TextStyle(
                          color: const pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        "${report.gynecologicalActivity} ",
                        style: pw.TextStyle(
                          color: const pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Menopause since (Age) ",
                        style: pw.TextStyle(
                          color: const pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        "${report.menopause} ",
                        style: pw.TextStyle(
                          color: const pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  pw.SizedBox(height: 20),
                  pw.Container(
                    alignment: pw.Alignment.topLeft,
                    child: pw.Text(
                      "Habits",
                      textAlign: pw.TextAlign.start,
                      style: pw.TextStyle(
                        fontSize: 18,
                        color: const pw.PdfColor.fromInt(0xFF3DA9FC),
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ),
                  if (report.noHabits == true)
                    pw.Text(
                      "No habits : ",
                      style: pw.TextStyle(
                        color: const pw.PdfColor.fromInt(0xFF094067),
                        fontSize: 15,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Alcohol : ",
                        style: pw.TextStyle(
                          color: const pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        "${report.usesAlcohol! ? "Yes" : "No"} ",
                        style: pw.TextStyle(
                          color: const pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Tobacco : ",
                        style: pw.TextStyle(
                          color: const pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        "${report.usesTobacco! ? "Yes" : "No"} ",
                        style: pw.TextStyle(
                          color: const pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Packet/year : ",
                        style: pw.TextStyle(
                          color: const pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        "${report.packYear} ",
                        style: pw.TextStyle(
                          color: const pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  pw.Divider(),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Drugs : ",
                        style: pw.TextStyle(
                          color: const pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        "${report.usesDrugs! ? "Yes" : "No"} ",
                        style: pw.TextStyle(
                          color: const pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Drug name : ",
                        style: pw.TextStyle(
                          color: const pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        "${report.specifyDrugUse} ",
                        style: pw.TextStyle(
                          color: const pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  pw.Divider(),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Other habits : ",
                        style: pw.TextStyle(
                          color: const pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        "${report.otherHabits} ",
                        style: pw.TextStyle(
                          color: const pw.PdfColor.fromInt(0xFF094067),
                          fontSize: 15,
                          fontWeight: pw.FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  pw.SizedBox(height: 20),
                  pw.Container(
                    alignment: pw.Alignment.topLeft,
                    child: pw.Text(
                      "History of the disease",
                      textAlign: pw.TextAlign.start,
                      style: pw.TextStyle(
                        fontSize: 18,
                        color: const pw.PdfColor.fromInt(0xFF3DA9FC),
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.topLeft,
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      children: [
                        pw.Text(
                          "History : ",
                          style: pw.TextStyle(
                            color: const pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.Text(
                          "${report.history} ",
                          style: pw.TextStyle(
                            color: const pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                        pw.Text(
                          "Initial diagnosis : ",
                          style: pw.TextStyle(
                            color: const pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.Text(
                          "${report.initialDiagnosis} ",
                          style: pw.TextStyle(
                            color: const pw.PdfColor.fromInt(0xFF094067),
                            fontSize: 15,
                            fontWeight: pw.FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  pw.SizedBox(height: 20),
                  pw.Container(
                    alignment: pw.Alignment.topLeft,
                    child: pw.Text(
                      "Summary",
                      textAlign: pw.TextAlign.start,
                      style: pw.TextStyle(
                        fontSize: 18,
                        color: const pw.PdfColor.fromInt(0xFF3DA9FC),
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ),
                  pw.Container(
                      alignment: pw.Alignment.topLeft,
                      child: pw.Column(
                        children: [
                          pw.Text("${report.total} ",
                              style: pw.TextStyle(
                                color: const pw.PdfColor.fromInt(0xFF094067),
                                fontSize: 15,
                                fontWeight: pw.FontWeight.normal,
                              ),
                              textAlign: pw.TextAlign.start),
                        ],
                      )),
                ],
              ),
            ),
          );
        },
      ),
    );
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    File("$path/report.pdf").writeAsBytes(await pdf.save());
    OpenFile.open("$path/report.pdf");
    Printing.layoutPdf(onLayout: (pw.PdfPageFormat format) async => pdf.save());
  }

  Future<void> sendmail(
      ReportModel report, PatientModel patient, String mail) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    var attachement = File("$path/report.pdf").path;
    final Email email = Email(
      subject: 'Medical report of ${patient.fullName} ',
      body:
          "Dear Dr. I hope you are well.I am also sending you a copy of our patient's updated ${patient.fullName}  file in PDF format as an attachment to this email, for your reference and records. \nI would like to inform you that our patient's medical record has been successfully updated via our medical application. \n Sincerely, \n Name Doctor: ${report.doctorName} \n Specialty : ${report.doctorName} ",
      recipients: [
        mail.toString(),
      ],
      attachmentPaths: [attachement],
      isHTML: false,
    );
    await FlutterEmailSender.send(email);
  }
}
