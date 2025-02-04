import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medconnectpatient/models/article_model.dart';
import '../../theme/constants.dart';
import '../components/article_component.dart';
import '../services_pages/pharmacies_pages.dart';
import '../services_pages/ambulances_pages.dart';
import '../services_pages/hopitaux_pages.dart';
import '../services_pages/medecin_page.dart';

class NavHomePage extends StatefulWidget {
  const NavHomePage({super.key});

  @override
  State<NavHomePage> createState() => _NavHomePageState();
}

class _NavHomePageState extends State<NavHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Image.asset(
                "assets/home_image.png",
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Our services",
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HopitauxPage(),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 3),
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: kBlueContaineColor,
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
                                const SizedBox(height: 7),
                                Text(
                                  "Hospitals",
                                  style:
                                      Theme.of(context).textTheme.titleLarge!,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MedecinsPage(),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 3),
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
                                  "assets/medecin_image.png",
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Doctors",
                                  style:
                                      Theme.of(context).textTheme.titleLarge!,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AmbulancePage(),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 3),
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: kGreenContaineColor,
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
                                  "assets/ambulance_image.png",
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Ambulances",
                                  style:
                                      Theme.of(context).textTheme.titleLarge!,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PharmaciePage(),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 3),
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: kYellowContaineColor,
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
                                  "assets/pharmacie_image.png",
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Pharmacy",
                                  style:
                                      Theme.of(context).textTheme.titleLarge!,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Popular items",
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 240,
                    child: ListView.builder(
                        itemCount: listArticles.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return ArticleComponent(
                              articleModel: listArticles[index]);
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
