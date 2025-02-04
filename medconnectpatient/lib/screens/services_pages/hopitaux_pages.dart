import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/hospital_controller.dart';
import '../../models/hospital_model.dart';
import '../components/hopital_component.dart';

class HopitauxPage extends StatelessWidget {
  const HopitauxPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HospitalController());

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
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Our hospitals",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 10),
              Expanded(
                child: FutureBuilder<List<HospitalModel>>(
                    future: controller.getHospitalsController(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return HopitalComponent(
                              hospitalModel: snapshot.data![index],
                            );
                          },
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
