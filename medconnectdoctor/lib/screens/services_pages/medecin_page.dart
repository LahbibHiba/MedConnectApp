import 'package:flutter/material.dart';
import '../../models/doctor_model.dart';
import '../components/medecin_component.dart';

class MedecinsPage extends StatelessWidget {
  const MedecinsPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                "Our doctors",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 10),
              Expanded(
                child: SizedBox(
                  child: ListView.builder(
                    itemCount: listDoctors.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return MedecinComponent(doctorModel: listDoctors[index]);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
