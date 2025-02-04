import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:medconnectdoctor/models/hospital_model.dart';

class HospitalRepository extends GetxController {
  static HospitalRepository get instance => Get.find();
  Future<List<HospitalModel>> getHospitals() async {
    List<HospitalModel> hospitals = [];
    const url =
        "https://www.communitybenefitinsight.org/api/get_hospitals.php?state=NC";
   
    final response = await get(Uri.parse(url));
   
    if (response.statusCode == 200) {
      
      hospitals = hospitalModelFromJson(response.body);
    } else {
      print(response.statusCode);
    }
    return hospitals;
  }
}
