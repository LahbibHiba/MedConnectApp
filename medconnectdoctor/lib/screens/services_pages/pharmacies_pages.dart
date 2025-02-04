import 'package:flutter/material.dart';
import '../../models/pharmacy_model.dart';
import '../components/pharmacy_component.dart';

class PharmaciePage extends StatelessWidget {
  const PharmaciePage({super.key});

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
                "Our Pharmacies",
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
                    itemCount: listPharmacies.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return PharmacyComponent(
                          pharmacyModel: listPharmacies[index]);
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
