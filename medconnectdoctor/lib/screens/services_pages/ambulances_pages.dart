import 'package:flutter/material.dart';
import '../../models/ambulance_model.dart';
import '../components/ambulance_component.dart';

class AmbulancePage extends StatelessWidget {
  const AmbulancePage({super.key});

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
                "Our Ambulances",
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
                    itemCount: listAmbulances.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return AmbulanceComponent(
                          ambulanceModel: listAmbulances[index]);
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
