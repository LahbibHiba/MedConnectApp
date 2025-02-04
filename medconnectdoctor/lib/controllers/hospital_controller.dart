import 'package:get/get.dart';

import '../models/hospital_model.dart';
import '../repository/hospital_repository.dart';

class HospitalController extends GetxController {
  static HospitalController get instance => Get.find();
  final hospitalRepository = Get.put(HospitalRepository());

  Future<List<HospitalModel>> getHospitalsController() async {
    return await hospitalRepository.getHospitals();
  }
}
