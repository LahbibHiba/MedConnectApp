import 'package:flutter/material.dart';

import '../../models/hospital_model.dart';
import '../../theme/constants.dart';

class HopitalComponent extends StatelessWidget {
  const HopitalComponent({
    super.key,
    required this.hospitalModel,
  });
  final HospitalModel hospitalModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kLightBlueColor,
        //color: kWhiteColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade500,
              offset: const Offset(4.0, 4.0),
              blurRadius: 15,
              spreadRadius: 1),
          const BoxShadow(
              color: Colors.white,
              offset: Offset(-4.0, -4.0),
              blurRadius: 15,
              spreadRadius: 1),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 3),
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: kRedContaineColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade500,
                      offset: const Offset(4.0, 4.0),
                      blurRadius: 15,
                      spreadRadius: 1),
                  const BoxShadow(
                      color: Colors.white,
                      offset: Offset(-4.0, -4.0),
                      blurRadius: 15,
                      spreadRadius: 1),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/hopital_image.png",
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Hospital",
                    style: Theme.of(context).textTheme.titleLarge!,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 5,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hospitalModel.name,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "All specialties",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: kDarkGreeyColor),
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    decoration: BoxDecoration(
                      color: kGreeyColor,
                      //color: kWhiteColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.local_phone_outlined,
                          color: kBlueColor,
                          size: 12,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          hospitalModel.ein,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: kBlueColor),
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: kDarkGreeyColor,
                        size: 12,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        hospitalModel.city,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: kDarkGreeyColor),
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
