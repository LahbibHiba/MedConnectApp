import 'package:get/get.dart';
import '../models/report_model.dart';
import '../models/patient_model.dart';
import '../repository/report_repository.dart';

class ReportController extends GetxController {
  static ReportController get instance => Get.find();
  final _reportRepository = Get.put(ReportRepository());

  generateReportPDFController(ReportModel report, PatientModel patient) async {
    await _reportRepository.generateReportPDF(report, patient);
  }

  sendmailController(
      ReportModel report, PatientModel patient, String mail) async {
    await _reportRepository.generateReportPDF(report, patient);
    _reportRepository.sendmail(report, patient, mail);
  }
}
